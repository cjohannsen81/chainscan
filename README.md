# Chainscan

A comprehensive bash script for analyzing and comparing Chainguard container images, focusing on APK package differences and build configuration changes.

## Overview

This tool compares two Chainguard container images by:
- Generating Software Bill of Materials (SBOM) using Syft
- Identifying package differences between images
- Extracting APK packages from Wolfi repositories
- Comparing melange.yaml build configurations
- Creating interactive HTML and markdown reports

### Key Features

- 🔍 **Smart Analysis**: Analyzes non-dev images but uses dev variants for tooling access
- 📦 **Package Extraction**: Downloads specific APK packages and their build configs
- 🔄 **Version Comparison**: Compares melange.yaml files to show build changes
- 📊 **Rich Reports**: Generates both HTML (interactive) and Markdown reports
- 🎯 **Flexible Depth**: Three analysis modes (basic, full, diff-only)

## Prerequisites

### Required Tools

```bash
# Syft - SBOM generation
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Docker - Container runtime
# Install from: https://docs.docker.com/get-docker/

# jq - JSON processing
# macOS: brew install jq
# Ubuntu/Debian: apt-get install jq
# CentOS/RHEL: yum install jq

# tar - Archive extraction (usually pre-installed)
```

### Optional Tools

```bash
# yq - Enhanced YAML comparison
# macOS: brew install yq
# Linux: https://github.com/mikefarah/yq
# Note: Without yq, YAML comparison will be limited to diff output
```

## Installation

1. Download the script:
```bash
git clone https://github.com/cjohannsen81/chainscan.git
chmod +x chainscan.sh
```

2. Verify dependencies:
```bash
./chainscan.sh
# Will show error messages for any missing dependencies
```

## Usage

### Basic Syntax

```bash
./chainscan.sh <image1> <image2> [analysis_depth]
```

### Parameters

- **image1**: First Chainguard image to compare (non-dev variant)
- **image2**: Second Chainguard image to compare (non-dev variant)
- **analysis_depth**: Optional - `basic` (default), `full`, or `diff-only`

### Analysis Depth Modes

| Mode | Description | Use Case |
|------|-------------|----------|
| `basic` | Compare SBOMs and extract different packages | Default - balances detail and speed |
| `full` | Extract all APK packages from both images | Complete archive of all packages |
| `diff-only` | Only extract packages that differ | Minimal storage footprint |

## Examples

### Compare Python Versions

```bash
# Compare latest Python with 3.12
./chainscan.sh \
  cgr.dev/chainguard/python:latest \
  cgr.dev/chainguard/python:3.12

# With full analysis
./chainscan.sh \
  cgr.dev/chainguard/python:latest \
  cgr.dev/chainguard/python:3.12 \
  full
```

### Compare Node.js Versions

```bash
./chainscan.sh \
  cgr.dev/chainguard/node:latest \
  cgr.dev/chainguard/node:18
```

### Compare with Different Depths

```bash
# Basic - just the differences
./chainscan.sh cgr.dev/chainguard/python:3.13 cgr.dev/chainguard/python:3.12 basic

# Full - everything
./chainscan.sh cgr.dev/chainguard/python:3.13 cgr.dev/chainguard/python:3.12 full

# Diff-only - minimal extraction
./chainscan.sh cgr.dev/chainguard/python:3.13 cgr.dev/chainguard/python:3.12 diff-only
```

## How It Works

### Workflow

1. **Image Preparation**
   - Accepts non-dev images for analysis
   - Automatically converts to dev variants for extraction (adds `-dev` suffix)
   - Dev variants include `apk` tooling needed for package extraction

2. **SBOM Generation**
   - Uses Syft to generate comprehensive SBOMs for both non-dev images
   - Also generates SBOMs for dev variants for reference
   - Extracts package lists in JSON format

3. **Package Analysis**
   - Compares APK packages between images
   - Identifies version changes, additions, and removals
   - Categorizes packages by change type

4. **APK Extraction**
   - Downloads specific packages from Wolfi repository (packages.wolfi.dev)
   - Extracts melange.yaml build configurations
   - Handles both x86_64 and aarch64 architectures
   - Gracefully handles packages removed from repository

5. **Comparison**
   - Uses `yq` (if available) for structured YAML comparison
   - Falls back to `diff` for text comparison
   - Analyzes source URLs, versions, and build pipelines

6. **Report Generation**
   - Creates interactive HTML report with expandable sections
   - Generates markdown report for documentation
   - Includes package summaries and detailed comparisons

### Dev vs Non-Dev Images

**Important**: The script analyzes packages from **non-dev images** but uses **dev variants** for extraction:

- **Non-dev images**: Minimal, production images being compared
- **Dev variants**: Include `apk` package manager for extracting package info
- **Analysis**: Only packages present in non-dev images are analyzed

This approach ensures you're analyzing production configurations while still having access to necessary tooling.

## Output Structure

After running, the script creates a timestamped directory:

```
image_analysis_YYYYMMDD_HHMMSS/
├── comparison_report.html          # Interactive HTML report
├── comparison_report.md            # Markdown report
├── package_diff.txt                # Raw package differences
├── packages1.txt                   # Package list from image 1
├── packages2.txt                   # Package list from image 2
├── downloaded_apks/                # Downloaded APK packages
│   ├── image1_safe_name/
│   │   ├── package-version.melange.yaml
│   │   ├── package-version.PKGINFO
│   │   └── package-version.apk (if full mode)
│   └── image2_safe_name/
│       └── ...
├── melange_comparisons/            # Package-by-package comparisons
│   ├── package1-comparison.txt
│   ├── package2-comparison.txt
│   └── ...
└── *-sbom.json                     # Generated SBOMs
```

## Viewing Reports

### HTML Report (Recommended)

```bash
# macOS
open image_analysis_*/comparison_report.html

# Linux with default browser
xdg-open image_analysis_*/comparison_report.html

# Or use any web browser
firefox image_analysis_*/comparison_report.html
```

The HTML report features:
- 📊 Summary cards with package counts
- 🔽 Expandable comparison sections
- 🎨 Syntax-highlighted diffs
- 🔘 Expand/collapse all button
- 📱 Responsive design

### Markdown Report

```bash
# View in terminal
cat image_analysis_*/comparison_report.md

# Or open in your preferred markdown viewer
code image_analysis_*/comparison_report.md
```

## Understanding the Output

### Package Differences

The script shows three types of changes:

```diff
< package-name 1.0.0    # Only in image 1 (removed or downgraded)
> package-name 2.0.0    # Only in image 2 (added or upgraded)
```

### Melange.yaml Comparisons

For packages with version changes, the script compares:
- **Source URLs**: Where the package source code comes from
- **Versions/Tags**: Specific version or git commit
- **Build Pipeline**: Steps used to build the package
- **Dependencies**: Package dependencies and build requirements

### Package Status Indicators

During execution, you'll see:
- `.` = Package successfully downloaded
- `x` = Package unavailable (removed from repository)

### Common Scenarios

1. **Version Upgrade**: Same package, different version in each image
2. **New Package**: Package exists only in image 2
3. **Removed Package**: Package exists only in image 1
4. **Unavailable**: Package no longer available in Wolfi repository (old/removed)

## Troubleshooting

### "Error: apk not found"

**Problem**: Trying to extract from non-dev image

**Solution**: Script automatically converts to dev variant. If this fails:
```bash
# Manually specify dev image
./chainscan.sh cgr.dev/chainguard/python:latest-dev cgr.dev/chainguard/python:3.12-dev
```

### "Permission denied" when pulling images

**Problem**: Not authenticated to registry

**Solution**:
```bash
docker login cgr.dev
# Enter credentials when prompted
```

### "Package unavailable in repository"

**Cause**: Old packages are periodically removed from Wolfi repository

**Impact**: melange.yaml comparison not possible for that package

**Workaround**: Focus on packages that are available; unavailable packages are automatically skipped

### yq warnings

**Impact**: Script still works but YAML comparison is less detailed

**Solution**: Install yq for enhanced YAML analysis
```bash
# macOS
brew install yq

# Linux (binary install)
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
chmod +x /usr/local/bin/yq
```

### Large output directories

**Cause**: Using `full` mode downloads all packages

**Solution**:
- Use `basic` (default) or `diff-only` for smaller footprint
- Regularly clean old analysis directories
- Use symbolic links if archiving multiple analyses

## Advanced Usage

### Comparing Specific Tags

```bash
# Compare specific date-tagged images
./chainscan.sh \
  cgr.dev/chainguard/python:3.12-20240115 \
  cgr.dev/chainguard/python:3.12-20240201
```

### Analyzing Multiple Images

```bash
# Create a comparison script
for version in 3.10 3.11 3.12 3.13; do
  ./chainscan.sh \
    cgr.dev/chainguard/python:3.13 \
    cgr.dev/chainguard/python:$version
done
```

### Filtering Results

```bash
# Find all packages with version changes
grep '^[<>]' image_analysis_*/package_diff.txt

# Count changed packages
grep -c '^<' image_analysis_*/package_diff.txt  # Removed/downgraded
grep -c '^>' image_analysis_*/package_diff.txt  # Added/upgraded
```

## Best Practices

1. **Use Non-Dev Images**: Always specify non-dev images for analysis
   - ✅ `cgr.dev/chainguard/python:latest`
   - ❌ `cgr.dev/chainguard/python:latest-dev`

2. **Start with Basic Mode**: Use default `basic` mode first, only use `full` if needed

3. **Archive Important Results**: Save analysis directories for historical comparison
   ```bash
   mv image_analysis_* archived_analyses/
   ```

4. **Review HTML Report First**: More readable than raw files

5. **Check Unavailable Packages**: High number of unavailable packages may indicate very old images

## Limitations

- Requires Docker and network access to pull images
- Package downloads limited to what's available in Wolfi repository
- Dev variants must exist for both images
- Large images with many packages can take significant time

## Contributing

Suggestions and improvements welcome! Key areas:
- Support for other package managers (rpm, deb)
- Enhanced comparison algorithms
- Additional report formats
- Performance optimizations

## Related Tools

- [Syft](https://github.com/anchore/syft) - SBOM generation
- [Grype](https://github.com/anchore/grype) - Vulnerability scanning
- [Wolfi](https://github.com/wolfi-dev) - Undistro for container images
- [Chainguard Images](https://www.chainguard.dev/chainguard-images) - Secure base images
