#!/usr/bin/env bash

# Chainscan - Chainguard Image Comparison Tool
# Usage: ./chainscan.sh <image1> <image2> [analysis_depth]
# Example: ./chainscan.sh cgr.dev/chainguard/python:latest cgr.dev/chainguard/python:3.12

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Configuration
WORK_DIR="./chainscan_$(date +%Y%m%d_%H%M%S)"
ANALYSIS_DEPTH="${3:-basic}"  # basic, full, or diff-only

# Function to print colored output
print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 <image1> <image2> [analysis_depth]"
    echo ""
    echo "Arguments:"
    echo "  image1         First Chainguard image to compare"
    echo "  image2         Second Chainguard image to compare" 
    echo "  analysis_depth Analysis depth (basic|full|diff-only) - default: basic"
    echo ""
    echo "Analysis depths:"
    echo "  basic      - Compare SBOMs and extract different APK packages"
    echo "  full       - Extract all APK packages from both images"
    echo "  diff-only  - Only extract packages that differ between images"
    echo ""
    echo "Examples:"
    echo "  $0 cgr.dev/chainguard/python:latest cgr.dev/chainguard/python:3.12"
    echo "  $0 cgr.dev/chainguard/python:3.13 cgr.dev/chainguard/python:3.12"
    echo "  $0 cgr.dev/chainguard/node:latest cgr.dev/chainguard/node:18 full"
    exit 1
}

# Function to check dependencies
check_dependencies() {
    local missing=0
    
    # Check bash version - we need at least 3.0
    if [ -z "$BASH_VERSION" ]; then
        print_color $RED "Error: This script requires bash"
        missing=1
    fi
    
    if ! command -v syft &> /dev/null; then
        print_color $RED "Error: syft is not installed"
        echo "Install: curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin"
        missing=1
    fi
    
    if ! command -v jq &> /dev/null; then
        print_color $RED "Error: jq is not installed"
        missing=1
    fi
    
    if ! command -v tar &> /dev/null; then
        print_color $RED "Error: tar is not installed"
        missing=1
    fi
    
    if ! command -v curl &> /dev/null; then
        print_color $RED "Error: curl is not installed"
        missing=1
    fi
    
    if ! command -v yq &> /dev/null; then
        print_color $YELLOW "Warning: yq not installed - YAML comparison will be limited"
        echo "Install yq for better YAML analysis: https://github.com/mikefarah/yq"
    fi
    
    if [ $missing -eq 1 ]; then
        exit 1
    fi
}

# Function to generate safe filename
safe_filename() {
    local name=$1
    echo "$name" | sed 's/[^a-zA-Z0-9._-]/_/g'
}

# Function to download specific APK package and extract melange.yaml
download_specific_apk() {
    local package_name=$1
    local package_version=$2
    local image_name=$3
    local output_dir="$WORK_DIR/downloaded_apks/$(safe_filename $image_name)"
    
    mkdir -p "$output_dir"
    
    local apk_file="$package_name-$package_version.apk"
    local success=0
    
    # Try to download directly from Wolfi repository and extract melange.yaml
    for arch in x86_64 aarch64; do
        local wolfi_url="https://packages.wolfi.dev/os/$arch/$apk_file"
        
        # First check if the APK exists
        if curl -f -sI "$wolfi_url" >/dev/null 2>&1; then
            # Download and extract melange.yaml
            if curl -f -sL "$wolfi_url" | tar -xz -C "$output_dir" .melange.yaml 2>/dev/null; then
                if [ -f "$output_dir/.melange.yaml" ]; then
                    mv "$output_dir/.melange.yaml" "$output_dir/$package_name-$package_version.melange.yaml"
                    success=1
                    
                    # Also get PKGINFO
                    curl -f -sL "$wolfi_url" | tar -xz -C "$output_dir" .PKGINFO 2>/dev/null && {
                        if [ -f "$output_dir/.PKGINFO" ]; then
                            mv "$output_dir/.PKGINFO" "$output_dir/$package_name-$package_version.PKGINFO"
                        fi
                    } || true
                    
                    # Optionally save the full APK for reference
                    if [ "$ANALYSIS_DEPTH" = "full" ]; then
                        curl -f -sL "$wolfi_url" -o "$output_dir/$apk_file" 2>/dev/null || true
                    fi
                    
                    break
                fi
            fi
        fi
    done
    
    # Mark as unavailable if not found
    if [ $success -eq 0 ]; then
        echo "unavailable" > "$output_dir/$package_name-$package_version.unavailable"
    fi
    
    return $success
}

# Function to compare melange.yaml files
compare_melange_files() {
    local package_name=$1
    local version1=$2
    local version2=$3
    local image1_safe=$(safe_filename "$4")
    local image2_safe=$(safe_filename "$5")
    
    local melange1="$WORK_DIR/downloaded_apks/$image1_safe/$package_name-$version1.melange.yaml"
    local melange2="$WORK_DIR/downloaded_apks/$image2_safe/$package_name-$version2.melange.yaml"
    local unavailable1="$WORK_DIR/downloaded_apks/$image1_safe/$package_name-$version1.unavailable"
    local unavailable2="$WORK_DIR/downloaded_apks/$image2_safe/$package_name-$version2.unavailable"
    local comparison_file="$WORK_DIR/melange_comparisons/$package_name-comparison.txt"
    
    mkdir -p "$WORK_DIR/melange_comparisons"
    
    print_color $MAGENTA "Comparing $package_name: $version1 → $version2"
    
    # Check if either version is unavailable
    if [ -f "$unavailable1" ] && [ -f "$unavailable2" ]; then
        print_color $YELLOW "  Both versions unavailable in repository (old packages)"
        echo "unavailable" > "$comparison_file"
        return 1
    elif [ -f "$unavailable1" ]; then
        print_color $YELLOW "  Version $version1 unavailable in repository"
        if [ -f "$melange2" ]; then
            echo "Only version $version2 available - see $melange2"
        fi
        return 1
    elif [ -f "$unavailable2" ]; then
        print_color $YELLOW "  Version $version2 unavailable in repository"
        if [ -f "$melange1" ]; then
            echo "Only version $version1 available - see $melange1"
        fi
        return 1
    fi
    
    # Check if melange files exist
    if [ ! -f "$melange1" ] || [ ! -f "$melange2" ]; then
        print_color $YELLOW "  Melange.yaml files not found for comparison"
        return 1
    fi
    
    # Create comparison report
    {
        echo "======================================"
        echo "Package: $package_name"
        echo "Version 1: $version1 ($(basename "$4"))"
        echo "Version 2: $version2 ($(basename "$5"))"
        echo "======================================"
        echo ""
        
        if [ -f "$melange1" ] && [ -f "$melange2" ]; then
            # Both files exist - do full comparison
            if command -v yq &> /dev/null; then
                echo "=== Source/Version Changes ==="
                local ver1_source=$(yq eval '.pipeline[] | select(.uses == "fetch") | .with.uri // .with.source' "$melange1" 2>/dev/null | head -1)
                local ver2_source=$(yq eval '.pipeline[] | select(.uses == "fetch") | .with.uri // .with.source' "$melange2" 2>/dev/null | head -1)
                
                local ver1_commit=$(yq eval '.pipeline[] | select(.uses == "fetch") | .with.tag // .with.expected-commit' "$melange1" 2>/dev/null | head -1)
                local ver2_commit=$(yq eval '.pipeline[] | select(.uses == "fetch") | .with.tag // .with.expected-commit' "$melange2" 2>/dev/null | head -1)
                
                echo "Source URL:"
                echo "  v$version1: $ver1_source"
                echo "  v$version2: $ver2_source"
                echo ""
                
                echo "Version/Tag/Commit:"
                echo "  v$version1: $ver1_commit"
                echo "  v$version2: $ver2_commit"
                echo ""
                
                echo "=== Build Pipeline Comparison ==="
                echo "Version 1 pipeline:"
                yq eval '.pipeline' "$melange1" 2>/dev/null | sed 's/^/  /' || echo "  (unable to parse)"
                echo ""
                echo "Version 2 pipeline:"
                yq eval '.pipeline' "$melange2" 2>/dev/null | sed 's/^/  /' || echo "  (unable to parse)"
                echo ""
            fi
            
            echo "=== Raw YAML Diff ==="
            diff -u "$melange1" "$melange2" || true
            
        elif [ -f "$melange1" ]; then
            echo "melange.yaml only exists in version 1:"
            cat "$melange1"
        elif [ -f "$melange2" ]; then
            echo "melange.yaml only exists in version 2:"
            cat "$melange2"
        fi
        
    } > "$comparison_file"
    
    # Show summary
    if [ -f "$melange1" ] && [ -f "$melange2" ] && command -v yq &> /dev/null; then
        local ver1_source=$(yq eval '.pipeline[] | select(.uses == "fetch") | .with.uri // .with.source' "$melange1" 2>/dev/null | head -1)
        local ver2_source=$(yq eval '.pipeline[] | select(.uses == "fetch") | .with.uri // .with.source' "$melange2" 2>/dev/null | head -1)
        
        if [ "$ver1_source" != "$ver2_source" ]; then
            print_color $YELLOW "    Source repository changed!"
            echo "      $version1: $ver1_source"
            echo "      $version2: $ver2_source"
        else
            echo "    Same source repository"
        fi
    fi
    
    echo "  Full comparison saved to: $comparison_file"
    echo ""
}

# Function to analyze package differences from SBOM and extract APKs
analyze_and_extract_packages() {
    local image1="$1"
    local image2="$2"
    local sbom1="$3"
    local sbom2="$4"
    
    print_color $YELLOW "Analyzing package differences..."
    
    # Create temporary files for package lists (focusing on apk packages)
    local pkg_list1="$WORK_DIR/packages1.txt"
    local pkg_list2="$WORK_DIR/packages2.txt"
    
    # Extract APK package info - each artifact IS a package in newer Syft versions
    jq -r '.artifacts[] | select(.type=="apk") | "\(.name) \(.version)"' "$sbom1" | sort > "$pkg_list1" 2>/dev/null || touch "$pkg_list1"
    jq -r '.artifacts[] | select(.type=="apk") | "\(.name) \(.version)"' "$sbom2" | sort > "$pkg_list2" 2>/dev/null || touch "$pkg_list2"
    
    # Debug: show what we found
    local pkg_count1=$(wc -l < "$pkg_list1" 2>/dev/null || echo "0")
    local pkg_count2=$(wc -l < "$pkg_list2" 2>/dev/null || echo "0") 
    print_color $CYAN "Found $pkg_count1 APK packages in image 1, $pkg_count2 APK packages in image 2"
    
    if [ "$pkg_count1" -gt 0 ]; then
        echo "  First 5 packages from image 1:"
        head -5 "$pkg_list1" | sed 's/^/    /'
    fi
    
    # Find differences
    local diff_output="$WORK_DIR/package_diff.txt"
    diff "$pkg_list1" "$pkg_list2" > "$diff_output" || true
    
    if [ -s "$diff_output" ]; then
        print_color $YELLOW "Package differences found:"
        cat "$diff_output"
        echo ""
        
        # Create temporary files to track packages
        local pkg_img1_list="$WORK_DIR/packages_img1_to_download.txt"
        local pkg_img2_list="$WORK_DIR/packages_img2_to_download.txt"
        
        # Parse diff output to find changed packages
        grep '^<' "$diff_output" | sed 's/^< //' > "$pkg_img1_list" || touch "$pkg_img1_list"
        grep '^>' "$diff_output" | sed 's/^> //' > "$pkg_img2_list" || touch "$pkg_img2_list"
        
        # Download APK packages from image 1
        if [ -s "$pkg_img1_list" ]; then
            print_color $BLUE "Downloading APK packages for image 1 from packages.wolfi.dev..."
            local downloaded=0
            local unavailable=0
            while IFS=' ' read -r pkg_name pkg_version; do
                if download_specific_apk "$pkg_name" "$pkg_version" "$image1"; then
                    downloaded=$((downloaded + 1))
                    echo -n "."
                else
                    unavailable=$((unavailable + 1))
                    echo -n "x"
                fi
            done < "$pkg_img1_list"
            echo ""
            print_color $GREEN "  Downloaded: $downloaded packages"
            if [ $unavailable -gt 0 ]; then
                print_color $YELLOW "  Unavailable: $unavailable packages (removed from repository)"
            fi
        fi
        
        # Download APK packages from image 2
        if [ -s "$pkg_img2_list" ]; then
            print_color $BLUE "Downloading APK packages for image 2 from packages.wolfi.dev..."
            local downloaded=0
            local unavailable=0
            while IFS=' ' read -r pkg_name pkg_version; do
                if download_specific_apk "$pkg_name" "$pkg_version" "$image2"; then
                    downloaded=$((downloaded + 1))
                    echo -n "."
                else
                    unavailable=$((unavailable + 1))
                    echo -n "x"
                fi
            done < "$pkg_img2_list"
            echo ""
            print_color $GREEN "  Downloaded: $downloaded packages"
            if [ $unavailable -gt 0 ]; then
                print_color $YELLOW "  Unavailable: $unavailable packages (removed from repository)"
            fi
        fi
        
        # Compare packages that exist in both images (different versions)
        print_color $BLUE "Comparing melange.yaml files for version changes..."
        
        # Get package names from both lists
        awk '{print $1}' "$pkg_img1_list" | sort > "$WORK_DIR/pkg_names1.txt" 2>/dev/null || touch "$WORK_DIR/pkg_names1.txt"
        awk '{print $1}' "$pkg_img2_list" | sort > "$WORK_DIR/pkg_names2.txt" 2>/dev/null || touch "$WORK_DIR/pkg_names2.txt"
        
        # Find common package names (packages that exist in both but with different versions)
        comm -12 "$WORK_DIR/pkg_names1.txt" "$WORK_DIR/pkg_names2.txt" > "$WORK_DIR/common_packages.txt"
        
        local compared=0
        local skipped=0
        
        if [ -s "$WORK_DIR/common_packages.txt" ]; then
            # Use image names since that's where files are stored
            local image1_safe=$(safe_filename "$image1")
            local image2_safe=$(safe_filename "$image2")
            
            while read -r pkg_name; do
                local version1=$(grep "^$pkg_name " "$pkg_img1_list" | awk '{print $2}' | head -1)
                local version2=$(grep "^$pkg_name " "$pkg_img2_list" | awk '{print $2}' | head -1)
                
                if [ -n "$version1" ] && [ -n "$version2" ]; then
                    # Check if melange files exist before attempting comparison
                    local melange1="$WORK_DIR/downloaded_apks/$image1_safe/$pkg_name-$version1.melange.yaml"
                    local melange2="$WORK_DIR/downloaded_apks/$image2_safe/$pkg_name-$version2.melange.yaml"
                    local unavailable1="$WORK_DIR/downloaded_apks/$image1_safe/$pkg_name-$version1.unavailable"
                    local unavailable2="$WORK_DIR/downloaded_apks/$image2_safe/$pkg_name-$version2.unavailable"
                    
                    # Only compare if both melange files exist
                    if [ -f "$melange1" ] && [ -f "$melange2" ]; then
                        compare_melange_files "$pkg_name" "$version1" "$version2" "$image1" "$image2"
                        compared=$((compared + 1))
                    elif [ -f "$unavailable1" ] || [ -f "$unavailable2" ]; then
                        # Skip silently if marked unavailable
                        skipped=$((skipped + 1))
                    fi
                fi
            done < "$WORK_DIR/common_packages.txt"
            
            echo ""
            print_color $GREEN "Compared: $compared packages"
            if [ $skipped -gt 0 ]; then
                print_color $YELLOW "Skipped: $skipped packages (unavailable in repository)"
            fi
        else
            print_color $YELLOW "No common packages with different versions found"
        fi
        
        # Report on packages only in one image
        local only_in_1=$(comm -23 "$WORK_DIR/pkg_names1.txt" "$WORK_DIR/pkg_names2.txt" | wc -l)
        local only_in_2=$(comm -13 "$WORK_DIR/pkg_names1.txt" "$WORK_DIR/pkg_names2.txt" | wc -l)
        
        if [ "$only_in_1" -gt 0 ]; then
            print_color $YELLOW "Packages only in image 1: $only_in_1"
            comm -23 "$WORK_DIR/pkg_names1.txt" "$WORK_DIR/pkg_names2.txt" | head -5 | sed 's/^/  - /'
            if [ "$only_in_1" -gt 5 ]; then
                echo "  ... and $((only_in_1 - 5)) more"
            fi
        fi
        
        if [ "$only_in_2" -gt 0 ]; then
            print_color $YELLOW "Packages only in image 2: $only_in_2"
            comm -13 "$WORK_DIR/pkg_names1.txt" "$WORK_DIR/pkg_names2.txt" | head -5 | sed 's/^/  - /'
            if [ "$only_in_2" -gt 5 ]; then
                echo "  ... and $((only_in_2 - 5)) more"
            fi
        fi
        
    else
        print_color $GREEN "No APK package differences found between images"
    fi
}

# Function to generate HTML report
generate_html_report() {
    local image1=$1
    local image2=$2
    local output_file=$3
    local count1=$4
    local count2=$5
    local apk_count1=$6
    local apk_count2=$7
    
    local generation_date=$(date)
    local package_diff=""
    if [ -f "$WORK_DIR/package_diff.txt" ]; then
        package_diff=$(cat "$WORK_DIR/package_diff.txt" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
    else
        package_diff="No package differences found."
    fi
    
    # Generate comparisons HTML
    local comparisons_html=""
    if [ -d "$WORK_DIR/melange_comparisons" ]; then
        local idx=0
        for comparison_file in "$WORK_DIR/melange_comparisons"/*.txt; do
            if [ -f "$comparison_file" ]; then
                local pkg_name=$(basename "$comparison_file" -comparison.txt)
                local content=$(cat "$comparison_file" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
                comparisons_html="${comparisons_html}
        <div class=\"comparison\">
            <div class=\"comparison-header\" onclick=\"toggleComparison('comp$idx')\">
                📄 $pkg_name
            </div>
            <div id=\"comp$idx\" class=\"comparison-content\">
                <pre>$content</pre>
            </div>
        </div>"
                idx=$((idx + 1))
            fi
        done
    fi
    
    if [ -z "$comparisons_html" ]; then
        comparisons_html="        <p>No melange.yaml comparisons available.</p>"
    fi
    
    # Write HTML directly without placeholders
    cat > "$output_file" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chainscan Report - Chainguard Image Comparison</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            color: #333;
            background: #f5f5f5;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 { color: #2c3e50; margin-bottom: 20px; font-size: 2em; }
        h2 { color: #34495e; margin: 30px 0 15px 0; padding-bottom: 10px; border-bottom: 2px solid #3498db; }
        h3 { color: #7f8c8d; margin: 20px 0 10px 0; }
        .meta { background: #ecf0f1; padding: 15px; border-radius: 5px; margin: 20px 0; }
        .meta strong { color: #2c3e50; }
        code { background: #f8f9fa; padding: 2px 6px; border-radius: 3px; font-family: 'Monaco', 'Courier New', monospace; }
        pre {
            background: #282c34;
            color: #abb2bf;
            padding: 15px;
            border-radius: 5px;
            overflow-x: auto;
            margin: 10px 0;
            font-family: 'Monaco', 'Courier New', monospace;
            font-size: 13px;
            line-height: 1.5;
        }
        .diff-add { color: #50fa7b; }
        .diff-remove { color: #ff5555; }
        .diff-header { color: #8be9fd; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th { background: #3498db; color: white; }
        tr:hover { background: #f5f5f5; }
        .comparison {
            margin: 20px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
        }
        .comparison-header {
            background: #3498db;
            color: white;
            padding: 10px 15px;
            font-weight: bold;
            cursor: pointer;
            user-select: none;
        }
        .comparison-header:hover { background: #2980b9; }
        .comparison-content {
            padding: 15px;
            display: none;
        }
        .comparison-content.show { display: block; }
        .toggle-all {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px 0;
            font-size: 14px;
        }
        .toggle-all:hover { background: #2980b9; }
        .note {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 12px;
            margin: 15px 0;
            border-radius: 4px;
        }
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin: 20px 0;
        }
        .summary-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
        .summary-card h3 { color: white; margin: 0 0 10px 0; font-size: 14px; }
        .summary-card .value { font-size: 32px; font-weight: bold; }
        .branding {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            color: #7f8c8d;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔗 Chainscan Report</h1>
        <p style="color: #7f8c8d; margin-bottom: 20px;">Chainguard Image Comparison Analysis</p>
        
        <div class="meta">
            <p><strong>Generated:</strong> $generation_date</p>
            <p><strong>Image 1:</strong> <code>$image1</code></p>
            <p><strong>Image 2:</strong> <code>$image2</code></p>
        </div>
        
        <div class="note">
            <strong>Analysis Method:</strong> All APK packages and melange.yaml files were downloaded directly from packages.wolfi.dev.
            No container images were run during this analysis.
        </div>
        
        <h2>Package Summary</h2>
        <div class="summary-grid">
            <div class="summary-card">
                <h3>Image 1 Total</h3>
                <div class="value">$count1</div>
            </div>
            <div class="summary-card">
                <h3>Image 2 Total</h3>
                <div class="value">$count2</div>
            </div>
            <div class="summary-card">
                <h3>Image 1 APK</h3>
                <div class="value">$apk_count1</div>
            </div>
            <div class="summary-card">
                <h3>Image 2 APK</h3>
                <div class="value">$apk_count2</div>
            </div>
        </div>
        
        <h2>Package Differences</h2>
        <pre>$package_diff</pre>
        
        <h2>Melange.yaml Comparisons</h2>
        <button class="toggle-all" onclick="toggleAll()">Expand All Comparisons</button>
        <div id="comparisons">
$comparisons_html
        </div>
        
        <div class="branding">
            <p>Generated by <strong>Chainscan</strong> - Chainguard Image Analysis Tool</p>
        </div>
    </div>
    
    <script>
        function toggleComparison(id) {
            const content = document.getElementById(id);
            content.classList.toggle('show');
        }
        
        let allExpanded = false;
        function toggleAll() {
            const contents = document.querySelectorAll('.comparison-content');
            const button = document.querySelector('.toggle-all');
            allExpanded = !allExpanded;
            contents.forEach(content => {
                if (allExpanded) {
                    content.classList.add('show');
                } else {
                    content.classList.remove('show');
                }
            });
            button.textContent = allExpanded ? 'Collapse All Comparisons' : 'Expand All Comparisons';
        }
        
        // Syntax highlighting for diff
        document.querySelectorAll('pre').forEach(pre => {
            const lines = pre.innerHTML.split('\\n');
            const highlighted = lines.map(line => {
                if (line.startsWith('+')) return '<span class="diff-add">' + line + '</span>';
                if (line.startsWith('-')) return '<span class="diff-remove">' + line + '</span>';
                if (line.startsWith('@@') || line.startsWith('===')) return '<span class="diff-header">' + line + '</span>';
                return line;
            }).join('\\n');
            pre.innerHTML = highlighted;
        });
    </script>
</body>
</html>
EOF
    
    return 0
}

# Function to generate comprehensive report
generate_report() {
    local image1=$1
    local image2=$2
    local report="$WORK_DIR/comparison_report.md"
    
    print_color $GREEN "Generating comprehensive comparison report..."
    
    {
        echo "# Chainscan Report"
        echo ""
        echo "**Generated:** $(date)"
        echo ""
        echo "## Images Analyzed"
        echo "- **Image 1:** \`$image1\`"
        echo "- **Image 2:** \`$image2\`"
        echo ""
        echo "> **Analysis Method:** All APK packages and melange.yaml files were downloaded directly"
        echo "> from packages.wolfi.dev. No container images were run during this analysis."
        echo ""
        
        echo "## APK Packages Downloaded"
        if [ -d "$WORK_DIR/downloaded_apks" ]; then
            for img_dir in "$WORK_DIR/downloaded_apks"/*; do
                if [ -d "$img_dir" ]; then
                    local img_name=$(basename "$img_dir")
                    echo "### $img_name"
                    local melange_count=$(find "$img_dir" -name "*.melange.yaml" 2>/dev/null | wc -l)
                    local apk_count=$(find "$img_dir" -name "*.apk" 2>/dev/null | wc -l)
                    echo "- Melange.yaml files: $melange_count"
                    if [ "$ANALYSIS_DEPTH" = "full" ]; then
                        echo "- APK files: $apk_count"
                    fi
                    echo ""
                fi
            done
        fi
        
        echo "## Package Differences"
        if [ -f "$WORK_DIR/package_diff.txt" ] && [ -s "$WORK_DIR/package_diff.txt" ]; then
            echo "\`\`\`diff"
            cat "$WORK_DIR/package_diff.txt"
            echo "\`\`\`"
        else
            echo "No package differences found."
        fi
        echo ""
        
        echo "## Melange.yaml Comparisons"
        if [ -d "$WORK_DIR/melange_comparisons" ] && [ "$(ls -A $WORK_DIR/melange_comparisons 2>/dev/null)" ]; then
            for comparison_file in "$WORK_DIR/melange_comparisons"/*.txt; do
                if [ -f "$comparison_file" ]; then
                    echo "### $(basename "$comparison_file" -comparison.txt)"
                    echo "\`\`\`"
                    head -100 "$comparison_file"  # Show more detail
                    echo "\`\`\`"
                    echo ""
                fi
            done
        else
            echo "No melange.yaml comparisons available."
        fi
        
    } > "$report"
    
    print_color $BLUE "Comprehensive report saved to: $report"
}

# Main execution
main() {
    if [ $# -lt 2 ]; then
        show_usage
    fi
    
    local image1=$1
    local image2=$2
    
    print_color $GREEN "Starting Chainscan - Chainguard Image Analysis"
    print_color $BLUE "Analyzing images:"
    print_color $BLUE "  - $image1"
    print_color $BLUE "  - $image2"
    print_color $BLUE "Analysis depth: $ANALYSIS_DEPTH"
    echo ""
    print_color $CYAN "Note: All packages will be downloaded from packages.wolfi.dev"
    print_color $CYAN "      No container images will be run"
    echo ""
    
    # Check dependencies
    check_dependencies
    
    # Create work directory
    mkdir -p "$WORK_DIR"
    print_color $BLUE "Work directory: $WORK_DIR"
    
    # Generate SBOMs for images
    print_color $YELLOW "Generating SBOMs..."
    local sbom1="$WORK_DIR/$(safe_filename $image1)-sbom.json"
    local sbom2="$WORK_DIR/$(safe_filename $image2)-sbom.json"
    
    syft "$image1" -o json > "$sbom1"
    syft "$image2" -o json > "$sbom2"
    
    print_color $GREEN "✓ SBOMs generated successfully"
    
    # Debug: Check SBOM structure
    print_color $CYAN "Analyzing SBOM structure..."
    local artifacts_count1=$(jq '.artifacts | length' "$sbom1" 2>/dev/null || echo "0")
    local artifacts_count2=$(jq '.artifacts | length' "$sbom2" 2>/dev/null || echo "0")
    echo "  SBOM1 artifacts count: $artifacts_count1"
    echo "  SBOM2 artifacts count: $artifacts_count2"
    
    # Check APK packages
    local apk_count1=$(jq '.artifacts[] | select(.type=="apk") | .name' "$sbom1" 2>/dev/null | wc -l)
    local apk_count2=$(jq '.artifacts[] | select(.type=="apk") | .name' "$sbom2" 2>/dev/null | wc -l)
    echo "  SBOM1 APK packages: $apk_count1"
    echo "  SBOM2 APK packages: $apk_count2"
    
    if [ "$apk_count1" -gt 0 ]; then
        echo "  Sample APK packages from SBOM1:"
        jq -r '.artifacts[] | select(.type=="apk") | "    \(.name) \(.version)"' "$sbom1" 2>/dev/null | head -5 || echo "    (no APK packages found)"
    fi
    echo ""
    
    # Analyze differences and download specific APKs from packages.wolfi.dev
    analyze_and_extract_packages "$image1" "$image2" "$sbom1" "$sbom2"
    
    # Generate final reports
    generate_report "$image1" "$image2"
    
    # Generate HTML report
    local html_report="$WORK_DIR/comparison_report.html"
    local count1=$(jq '.artifacts | length' "$sbom1" 2>/dev/null || echo "0")
    local count2=$(jq '.artifacts | length' "$sbom2" 2>/dev/null || echo "0")
    local apk_count1=$(jq '.artifacts[] | select(.type=="apk") | .name' "$sbom1" 2>/dev/null | wc -l)
    local apk_count2=$(jq '.artifacts[] | select(.type=="apk") | .name' "$sbom2" 2>/dev/null | wc -l)
    
    generate_html_report "$image1" "$image2" "$html_report" "$count1" "$count2" "$apk_count1" "$apk_count2"
    
    # Verify HTML report was created
    if [ -f "$html_report" ]; then
        print_color $GREEN "✓ HTML report generated successfully: $html_report"
    else
        print_color $RED "✗ Failed to generate HTML report"
    fi
    
    print_color $GREEN "Analysis complete!"
    print_color $BLUE "Results saved in: $WORK_DIR"
    
    # Show summary
    echo ""
    print_color $CYAN "Summary:"
    print_color $CYAN "Analyzed images:"
    print_color $CYAN "  $image1"
    print_color $CYAN "  $image2"
    echo ""
    if [ -d "$WORK_DIR/downloaded_apks" ]; then
        local apk_count=$(find "$WORK_DIR/downloaded_apks" -name "*.apk" 2>/dev/null | wc -l)
        local melange_count=$(find "$WORK_DIR/downloaded_apks" -name "*.melange.yaml" 2>/dev/null | wc -l)
        if [ "$ANALYSIS_DEPTH" = "full" ]; then
            print_color $CYAN "- Downloaded $apk_count APK packages from packages.wolfi.dev"
        fi
        print_color $CYAN "- Extracted $melange_count melange.yaml files"
    fi
    
    if [ -d "$WORK_DIR/melange_comparisons" ]; then
        local comparison_count=$(find "$WORK_DIR/melange_comparisons" -name "*.txt" 2>/dev/null | wc -l)
        print_color $CYAN "- Generated $comparison_count package comparisons"
    fi
    
    print_color $GREEN "\nKey files to review:"
    print_color $BLUE "  - $html_report (interactive HTML report - open in browser)"
    print_color $BLUE "  - $WORK_DIR/comparison_report.md (markdown report)"
    print_color $BLUE "  - $WORK_DIR/package_diff.txt (package differences)"
    print_color $BLUE "  - $WORK_DIR/melange_comparisons/ (build config changes)"
    echo ""
    print_color $CYAN "To view the HTML report, run:"
    print_color $CYAN "  open $html_report"
    echo ""
    print_color $GREEN "🔗 Chainscan analysis complete!"
}

# Check if script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
