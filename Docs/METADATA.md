- #### Metadata
ℹ️ Please refer to https://github.com/pkgforge/pkgcache/blob/main/Docs/METADATA.md as the Official source of documentation on parsing & using the metadata.<br>
The information below is outdated & stale


---

- #### Using [JQ](https://jqlang.github.io/jq/manual/) to Parse [METADATA.json](https://bin.ajam.dev/METADATA.json)
> - This is a basic example demonstrating how easy it is to work with the Metadata
> ```bash
> #-----------------------------------------------------------------------------#
> # Host Triplet
> echo "$(uname -m)" #either x86_64 or aarch64
> #---------------------#
> # Append `| jq -r '.$TYPE[].$PROPERTY'` to filter them, for example:
> !# Simple example to: list all Pkgs in .bin
> curl -qfsSL "https://bin.ajam.dev/$(uname -m)/METADATA.AIO.json" | jq -r '.bin[] | .name'
>
> !#To pretty print anything that matches qbittorrent from .pkg
> curl -qfsSL "https://bin.ajam.dev/$(uname -m)/METADATA.AIO.json" | jq -r '.bin[] | select(.name | test("qbittorrent"; "i")) | "---------------------------\n" + (. | to_entries | map("\(.key): \(.value)") | join("\n"))'
> ```
> ![image](https://github.com/user-attachments/assets/85ba4eb1-8b63-40f2-a524-25576d9a4762)
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
> ![image](https://github.com/user-attachments/assets/10579cc7-bee5-4695-87c1-61942610a9da)
