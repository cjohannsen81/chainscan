# Chainscan

Fast, efficient comparison tool for Chainguard container images. Analyzes package differences and build configurations without running containers.

## What It Does

- Compares APK packages between two Chainguard images
- Downloads build configurations (melange.yaml) from packages.wolfi.dev
- Shows what changed between versions (upgrades, downgrades, additions, removals)
- Generates interactive HTML reports with build pipeline comparisons

## Quick Start

### Install Dependencies

```bash
# Syft (SBOM generation)
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# jq (JSON processing)
brew install jq  # macOS
apt install jq   # Ubuntu/Debian
```

### Run Analysis

```bash
./chainscan.sh cgr.dev/chainguard/python:latest cgr.dev/chainguard/python:3.12
```

### View Results

```bash
open chainscan_*/comparison_report.html
```

## Usage

```bash
./chainscan.sh <image1> <image2> [depth]
```

**Depth Options:**
- `basic` (default) - Compare and download only different packages
- `full` - Download complete APK files for archival
- `diff-only` - Minimal extraction, differences only

## Examples

```bash
# Compare Python versions
./chainscan.sh cgr.dev/chainguard/python:3.13 cgr.dev/chainguard/python:3.12

# Compare Node.js with full analysis
./chainscan.sh cgr.dev/chainguard/node:latest cgr.dev/chainguard/node:18 full

# Compare specific tagged versions
./chainscan.sh \
  cgr.dev/chainguard/python:3.12-20240115 \
  cgr.dev/chainguard/python:3.12-20240201
```

## How It Works

1. **Generate SBOMs** - Syft analyzes image layers
2. **Compare packages** - Find differences in APK packages
3. **Download configs** - Get melange.yaml from packages.wolfi.dev
4. **Compare builds** - Show pipeline and source changes
5. **Create reports** - HTML and Markdown output

No containers are run. Everything is downloaded from packages.wolfi.dev.

## Output

Each run creates a timestamped directory:

```
chainscan_20241008_143022/
├── comparison_report.html    # Interactive report (open this!)
├── comparison_report.md      # Markdown version
├── package_diff.txt          # Raw diff output
└── melange_comparisons/      # Per-package build comparisons
```

## What You'll See

### Package Changes
```diff
< package-name 1.0.0    # Only in image 1
> package-name 2.0.0    # Only in image 2
```

### Build Configuration Changes
- Source repository URL changes
- Version/commit/tag updates
- Build pipeline modifications
- Dependency changes

## Requirements

- **syft** - SBOM generation
- **jq** - JSON parsing
- **curl** - Download packages (usually pre-installed)
- **tar** - Extract archives (usually pre-installed)
- **yq** (optional) - Enhanced YAML comparison

## Limitations

- Only works with Chainguard/Wolfi images (APK-based)
- Very old packages may be unavailable in repository
- Requires network access to packages.wolfi.dev

## Tips

✅ Start with `basic` mode for quick analysis  
✅ Use `full` mode if you need complete APK archives  
✅ Old packages marked as "unavailable" are normal (removed from repo)  
✅ HTML report is interactive - click to expand comparisons  

## Troubleshooting

**"Package unavailable"** - Old packages removed from repository, normal behavior  
**"No APK packages found"** - Image may not be Chainguard/Wolfi-based  
**Slow downloads** - Large images with many differences take time  

---

**Made for Chainguard image analysis** • Downloads from packages.wolfi.dev • No containers required
