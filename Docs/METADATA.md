- #### Metadata
> - A Machine Consumable & Automation Friendly dataset is published & kept [`UP To Date`](https://github.com/Azathothas/Toolpacks/actions/workflows/healthchecks_housekeeping.yaml)
> - It's available as [JSON](https://github.com/Azathothas/Toolpacks/blob/main/METADATA.json): [../METADATA.json](https://github.com/Azathothas/Toolpacks/blob/main/METADATA.json)
> - As [YAML](https://github.com/Azathothas/Toolpacks/blob/main/METADATA.yaml): [../METADATA.yaml](https://github.com/Azathothas/Toolpacks/blob/main/METADATA.yaml)
> - These contain fields like:
> > ```YAML
> > name: "#Contains the Name of the $BINARY itself",
> > description: "#Contains the Description of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > download_url: "#Contains the Raw Direct Download URL of the $BINARY",
> > size: "#Contains the Total Size of the $BINARY",
> > b3sum: "#Contains the Exact Blake3sum of the $BINARY",
> > sha256: "#Contains the Exact Sha256sum of the $BINARY",
> > build_date: "#Contains the Exact Date the $BINARY was Built(Fetched) & Uploaded",
> > repo_url: "#Contains the Github/Gitlab/$GIT_SRC URL of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_author: "#Contains the Repo's Author (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_info: "#Contains the Repo's Description (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_updated: "#Contains the Repo's Last Commit Date (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_released: "#Contains the Repo's Latest Release Date (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_version: "#Contains the Repo's Latest Release Version (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_stars: "#Contains the Repo's Total Stars (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_language: "#Contains the Repo's Language (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_license: "#Contains the Repo's License (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > repo_topics: "#Contains the Repo's Topics/Tags (Only if REPO = Github) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > web_url: "#Contains the Website/Project Page URL of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]",
> > extra_bins: "#Contains names of related binaries (Only if they belong to same $PKG_FAMILY) of the $BINARY/$PKG_FAMILY [Otherwise EMPTY]"
> > ```
> - You can use this data to automate downloading, updating or even build a full fledged *📦 Package Manager* like [`@xplshn/bigdl`](https://github.com/xplshn/bigdl) & [`@pwnwriter/hysp`](https://github.com/pwnwriter/hysp)
> - Though there's no Official `Schema/Specification` for the structure of this dataset, a de facto [`SPEC FREEZE`](https://en.wikipedia.org/wiki/Freeze_(software_engineering)) is already in place:
> > - [[Request] Rename sha256 to sha in Metadata files](https://github.com/Azathothas/Toolpacks/issues/22)
> > - [[R] Re-structure directories for consistency](https://github.com/Azathothas/Toolpacks/issues/18)
---

- #### Using [JQ](https://jqlang.github.io/jq/manual/) to Parse [METADATA.json](https://bin.ajam.dev/METADATA.json)
> - This is a basic example demonstrating how easy it is to work with the Metadata
> ```bash
> #-----------------------------------------------------------------------------#
> !# Android
> # Host Triplet
> ADBShell : adb shell echo "$(getprop ro.product.cpu.abi)-Android"
> Termux   : echo "$(getprop ro.product.cpu.abi)-Android"
> #---------------------#
> ↣ !# (arm64-v8a)
> # To Extract : https://bin.ajam.dev/arm64_v8a_Android/METADATA.json (Replace .main with .baseutils to extract Baseutils JSON)
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "arm64-v8a-Android") | .main'
> 
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> # Example : List all Bins (Main)
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "arm64-v8a-Android") | .main' | jq -r '.[].name' | sort -u
> # Example : List all Bins (Baseutils)
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "arm64-v8a-Android") | .baseutils' | jq -r '.[].name' | sort -u
> # This applies to the rest
> #-----------------------------------------------------------------------------#
> 
> #-----------------------------------------------------------------------------#
> # Host Triplet
> !# Linux
> echo "$(uname -m)-$(uname -s)"
> #---------------------#
> ↣ !# (aarch64 | arm64)
> # https://bin.ajam.dev/aarch64_arm64_Linux/METADATA.json
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "aarch64-Linux") | .main'
> 
> # https://bin.ajam.dev/aarch64_arm64_Linux/Baseutils/METADATA.json
> # Append | jq -r '.[].$PROPERTY' to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "aarch64-Linux") | .baseutils'
> 
> #---------------------#
> ↣ !# (amd64 | x86_64)
> # https://bin.ajam.dev/x86_64_Linux/METADATA.json
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "x86_64-Linux") | .main'
> 
> # https://bin.ajam.dev/x86_64_Linux/Baseutils/METADATA.json
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "x86_64-Linux") | .baseutils'
> #-----------------------------------------------------------------------------#
> 
> #-----------------------------------------------------------------------------#
> !# Windows
> # Host Triplet
> PowerShell : echo "$env:PROCESSOR_ARCHITECTURE-$env:OS"
> cmd.exe    : echo %PROCESSOR_ARCHITECTURE%-%OS%
> #---------------------#
> ↣ !# AMD64 Windows
> # https://bin.ajam.dev/x64_Windows/METADATA.json
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[] | select(.host == "AMD64-Windows_NT") | .main'
> #-----------------------------------------------------------------------------#
> ```
---

- #### URL Redirects
> - People [often ask](https://github.com/Azathothas/Toolpacks/issues/18) why there's `weird/ugly` naming scheme like `aarch64_arm64_Linux`.
> - Though, at the time I had my reasons (Take a look at any 3-4 cli tools' naming schema that do Github Releases), I admit it's a pain now.
> - Hence, I have set `URL` Redirects, so as long as your client follows a `301`, you can basically use any of these to reach to any `$ARCH/$HOST`
> - The ones in the Left will Redirect you to Correct `Location/Link` (Ones in the Right)
> > Examples:
> > ```bash
> > !# curl needs the `-L, --location` flag to Follow redirects
> > !# wget works without any flags
> > !# *Nix --> $(uname -m) will print aarch64/x86_64 [Better: "$(uname -m)-$(uname -s)" ]
> > !# ADB/Termux --> getprop ro.product.cpu.abi will print arm64-v8a on Android [Better: "$(getprop ro.product.cpu.abi)-$(getprop ro.board.platform)" ]
> > !# powershell --> $env:PROCESSOR_ARCHITECTURE || cmd.exe --> echo %PROCESSOR_ARCHITECTURE% [Better: "$env:PROCESSOR_ARCHITECTURE-$env:OS" ]
> > 
> > !# Example on Android
> > curl -qfsSLO "https://bin.ajam.dev/$(getprop ro.product.cpu.abi)/$BIN_OR_PATH_TO_BIN"
> > 
> > !# Example on Linux
> > curl -qfsSLO "https://bin.ajam.dev/$(uname -m)/$BIN_OR_PATH_TO_BIN"
> >
> > !# Example on Windows
> > Invoke-WebRequest -Uri "https://bin.ajam.dev/$env:PROCESSOR_ARCHITECTURE/$BIN_OR_PATH_TO_BIN.exe" -OutFile "$BIN.exe"
> >
> > ```
> ![image](https://github.com/user-attachments/assets/4e29a9ad-b68f-483f-acd6-faff3011bbdb)
