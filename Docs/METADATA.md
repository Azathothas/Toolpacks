- #### Using [JQ](https://jqlang.github.io/jq/manual/) to Parse [METADATA.json](https://bin.ajam.dev/METADATA.json)
> ```bash
> #-----------------------------------------------------------------------------#
> !# Android
> # Host Triplet
> ADBShell : adb shell echo "$(getprop ro.product.cpu.abi)-Android"
> Termux   : echo "$(getprop ro.product.cpu.abi)-Android"
> #---------------------#
> ↣ !# (arm64-v8a)
> # https://bin.ajam.dev/arm64_v8a_Android/METADATA.json
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "arm64-v8a-Android")' | jq -s .
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> # Example : List all Bins
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "arm64-v8a-Android")' | jq -s . | jq -r '.[].Name' | sort -u
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
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "aarch64-Linux") | .Main'
> 
> # https://bin.ajam.dev/aarch64_arm64_Linux/Baseutils/METADATA.json
> # Append | jq -r '.[].$PROPERTY' to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "aarch64-Linux") | .Baseutils'
> 
> #---------------------#
> ↣ !# (amd64 | x86_64)
> # https://bin.ajam.dev/x86_64_Linux/METADATA.json
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "x86_64-Linux") | .Main'
> 
> # https://bin.ajam.dev/x86_64_Linux/Baseutils/METADATA.json
> # Append `| jq -r '.[].$PROPERTY'` to filter them
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "x86_64-Linux") | .Baseutils'
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
> curl -qfsSL "https://bin.ajam.dev/METADATA.json" | jq '.[][] | select(.host == "AMD64-Windows_NT")' | jq -s .
> #-----------------------------------------------------------------------------#
> ```
