<!-- This can be changed -->
<p align="center">
    <a href="https://bin.ajam.dev">
        <img src="https://github.com/Azathothas/Toolpacks/assets/58171889/d226c553-1835-464c-8908-fe293d3aac3c" width="100"></a>
    <br>
    <b><strong> <a href="https://github.com/Azathothas/Toolpacks">Statically Compiled Binaries</a></code></strong></b>
    <br>
  <img src="https://github.com/Azathothas/Toolpacks/assets/58171889/dbb447ce-19f9-4a3a-8b56-b21eeba470d7" width="200" />
</p>

<!-- Crude Attempt at Humor -->
<details>
  <summary><b><i>raison d'être</i></b></summary>
  <a href="https://www.reddit.com/r/github/comments/1at9br4/i_am_new_to_github_and_i_have_lots_to_say/" target="_blank">
    <img src="https://github.com/user-attachments/assets/c8b22bea-a88d-48f8-b4d2-61284320d87f" alt="Inspiration Image">
  </a>
  <a href="https://github.com/sherlock-project/sherlock/issues/2011" target="_blank">
    <img src="https://github.com/user-attachments/assets/5a08ecaa-a412-4eaf-a9e8-1214455a6368" alt="Inspiration Image">
  </a>    
</details>

---
#### Contents
> - [**📖 Docs & FAQs 📖**](https://github.com/Azathothas/Toolpacks/tree/main/Docs)
> > - [**`What? & Why?`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#what--why)
> > - [**`How does it all actually work?`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-does-it-all-work)
> > - [**`Request a new PKG/Tool`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-add-request-a-new-a-pkgtool)
> > - [**`📦 Frontend Package Managers`**](https://github.com/Azathothas/Toolpacks/main/Docs/README.md#-frontend-package-managers-)
> > - [**`Notes On Building`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md)
> > - [**`Additional Build Targets($ARCH-$OS)`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#supporting-more-architectures--os)
> > - [**`How To Contribute/Donate`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-contribute)
> > - [**`Why NOT Host On GitHub`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#why-not-host-on-github)
> > - [**`Why RESET ALL GIT Commits`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#why-reset-all-git-commits)
> > - [**`Where can I find the code for bin.ajam.dev?`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#webui-binajamdev)
> > - [**`UPX Binaries ⏬`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#-upx-)
> > - [**`Caching & Rebuilds`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#cache--rebuild)
> > - [**`Current Problems & Setbacks`**](https://github.com/Azathothas/Toolpacks/issues?q=is%3Aissue+is%3Aopen+label%3AInfra)
> > - [**`DMCA & Copyright`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#dmca-copyright--cease--desist)
> > - [**`Contact Me`**](https://ajam.dev/contact)
> - [**🔽 Download 🔽**](https://github.com/Azathothas/Toolpacks/tree/main#-download-)
> > - [**`📦Linux x86_64📦`**](https://bin.ajam.dev/x86_64_Linux/)
> > - [**`📦Linux aarch64📦`**](https://bin.ajam.dev/aarch64_arm64_Linux/)
> > - [**`📦Windows_NT AMD64📦`**](https://bin.ajam.dev/x64_Windows/)
> > - [**`📦Android arm64-v8a📦`**](https://bin.ajam.dev/arm64_v8a_Android/)
> - [**📦 Status 🔖**](https://github.com/Azathothas/Toolpacks/tree/main#-status-)
> - [**🚧 Security ⚙️**](https://github.com/Azathothas/Toolpacks#-security-%EF%B8%8F)
---
<!-- DO NOT CHANGE -->
- #### 📦 Status 🔖
| 🧰 Architecture 🧰 | 📦 Total Binaries 📦 | 🇨🇭 WorkFlows 🇨🇭 | 🧾Logs|
|---------------------|-----------------------|-----------------|------------------|
|[ **Android `arm64-v8a`**](https://github.com/Azathothas/Toolpacks/tree/main/arm64_v8a_Android)|PLACEHOLDER_arm64_v8a_Android| [![🛍️ Build 📦 (toolpack_arm64_v8a_Android) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_arm64_v8a_Android.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_arm64_v8a_Android.yaml)|[BUILD.log](https://bin.ajam.dev/arm64_v8a_Android/BUILD.log.txt)|
|[ **Linux `aarch64 // arm64`**](https://github.com/Azathothas/Toolpacks/tree/main/aarch64_arm64_Linux)|PLACEHOLDER_aarch64_arm64_Linux| [![🛍️ Build 📦 (toolpack_aarch64_Linux) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_aarch64_Linux.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_aarch64_Linux.yaml)|[BUILD.log](https://bin.ajam.dev/aarch64_arm64_Linux/BUILD.log.txt)|
|[ **Linux `amd // x86_64`**](https://github.com/Azathothas/Toolpacks/tree/main/x86_64_Linux)|PLACEHOLDER_x86_64_Linux| [![🛍️ Build 📦 (toolpack_x86_64_Linux) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml)|[BUILD.log](https://bin.ajam.dev/x86_64_Linux/BUILD.log.txt)|
|[ **Windows `x64 // AMD64`**](https://github.com/Azathothas/Toolpacks/tree/main/x64_Windows)|PLACEHOLDER_x64_Windows| [![🛍️ Build 📦 (toolpack_x64_Windows) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x64_Windows.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x64_Windows.yaml)|[BUILD.log](https://bin.ajam.dev/x64_Windows/BUILD.log.txt)|

> - Raw [**`metadata`**](https://bin.ajam.dev/METADATA.json) containing info for _sources_ etc is available as [**JSON**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md) on [bin.ajam.dev/METADATA.json](https://bin.ajam.dev/METADATA.json) & also as [**YAML**](https://raw.githubusercontent.com/Azathothas/Toolpacks/main/METADATA.yaml).
> - See: [Parse METADATA.json](https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md#using-jq-to-parse-metadatajson) to learn how to parse using `jq`
---
#### 🔽 Download 🔽
- ##### GUI
> - Visit [bin.ajam.dev](https://bin.ajam.dev)
> > Note: The dir listing may not list everything. Make **sure to check [`METADATA.json`](https://bin.ajam.dev/METADATA.json)**
> ![bin](https://github.com/user-attachments/assets/775f0022-9932-4d7c-8d25-3a9df2bde78d)
> ![bin x86_64_Linux](https://github.com/user-attachments/assets/8dfb6f89-6129-4692-a918-23a6b18876d7)
> 
---
- ##### CLI
> ℹ️ Recommended ℹ️ : Use [**`Bigdl`**](https://github.com/xplshn/bigdl) if you want to skip everything below, since `bigdl` already [uses this repo as it's Source.](https://github.com/xplshn/bigdl#where-do-these-binaries-come-from-)
> - It's also possible to use `"$(uname -m)"` | `$env:PROCESSOR_ARCHITECTURE` | `adb shell getprop ro.product.cpu.abi` variations
> > SEE: https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md#url-redirects
> > 
> > ```bash
> > !# curl needs the `-L, --location` flag to Follow redirects
> > !# wget works without any flags
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
>
> <details><summary>Install <b><a href="https://github.com/zyedidia/eget"><code>eget</code></a></b></summary>
>
> ```bash
> #--------------------------------------------------------------------------------------------#
> ❯ amd || x86_64 (Linux) 
> 
> !# As $USER
> mkdir -p "$HOME/bin" ; export PATH="$HOME/bin:$PATH"
> curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/eget" -o "$HOME/bin/eget" && chmod +xwr "$HOME/bin/eget"
> wget -q "https://bin.ajam.dev/x86_64_Linux/eget" -O "$HOME/bin/eget" && chmod +xwr "$HOME/bin/eget"
> 
> !# As ROOT
> sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/eget" -o "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
> sudo wget -q "https://bin.ajam.dev/x86_64_Linux/eget" -O "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
> #--------------------------------------------------------------------------------------------#
> 
> #--------------------------------------------------------------------------------------------#
> ❯ arm64 || aarch64 (Linux) 
> 
> !# As $USER
> mkdir -p "$HOME/bin" ; export PATH="$HOME/bin:$PATH"
> curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/eget" -o "$HOME/bin/eget" && chmod +xwr "$HOME/bin/eget"
> wget -q "https://bin.ajam.dev/aarch64_arm64_Linux/eget" -O "$HOME/bin/eget" && chmod +xwr "$HOME/bin/eget"
> 
> !# As ROOT
> sudo curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/eget" -o "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
> sudo wget -q "https://bin.ajam.dev/aarch64_arm64_Linux/eget" -O "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
> #--------------------------------------------------------------------------------------------#
>
> #--------------------------------------------------------------------------------------------#
> ❯ arm64-v8a (Android) 
> 
> !# As $USER (TERMUX)
> # $PREFIX:/data/data/com.termux/files/usr
> curl -qfSL "https://bin.ajam.dev/arm64_v8a_Android/eget" -o "$PREFIX/bin/eget" && chmod +xwr "$PREFIX/bin/eget"
> wget -q "https://bin.ajam.dev/arm64_v8a_Android/eget" -O "$PREFIX/bin/eget" && chmod +xwr "$PREFIX/bin/eget"
> !# Root requires remounting /system/bin as RWR (NOT RECOMMENDED)
> #--------------------------------------------------------------------------------------------#
> ```
> </details>
>
> <details><summary>Install <b><a href="https://www.7-zip.org/"><code>7z</code></a></b></summary>
>    
> ```bash
> #--------------------------------------------------------------------------------------------#
> ❯ amd || x86_64 (Linux) 
> 
> !# As $USER
> eget "https://bin.ajam.dev/x86_64_Linux/7z" --to "$HOME/bin/7z"
> 
> !# As ROOT
> sudo eget "https://bin.ajam.dev/x86_64_Linux/7z" --to "/usr/local/bin/7z"
> #--------------------------------------------------------------------------------------------#
> 
> #--------------------------------------------------------------------------------------------#
> ❯ arm64 || aarch64 (Linux) 
> 
> !# As $USER
> eget "https://bin.ajam.dev/aarch64_arm64_Linux/7z" --to "$HOME/bin/7z"
> 
> !# As ROOT
> sudo eget "https://bin.ajam.dev/aarch64_arm64_Linux/7z" --to "/usr/local/bin/7z"
> ```
> --- 
> </details>
>
> <details><summary>Info <b><a href="https://github.com/Azathothas/Toolpacks/tree/main/x86_64_Linux"><code>(amd | x86_64) Linux</code></a></b></summary>
>
> ```bash
> #--------------------------------------------------------------------------------------------#
> ❯ Single/Individual Binaries
> 
> !# $USER
> eget "https://bin.ajam.dev/x86_64_Linux/$BINARY_NAME" --to "$HOME/bin"
>
> !# ROOT
> sudo eget "https://bin.ajam.dev/x86_64_Linux/$BINARY_NAME" --to "/usr/local/bin"
> 
> #--------------------------------------------------------------------------------------------#
> ❯ Everything All at once
> !# $USER
> !#Download .7z archive
>  wget --quiet --show-progress --progress="dot:giga" "https://bin.ajam.dev/x86_64_Linux/_toolpack_x86_64.7z" -O "./toolpack_x86_64.7z"
> 
> !# $USER
>  mkdir -p "$HOME/bin" ; 7z e "./toolpack_x86_64.7z" -o"$HOME/bin" -y ; rm -rf "$HOME/bin/toolpack_x86_64" 2>/dev/null ; rm -rf "./toolpack_x86_64.7z" ; chmod +xwr $HOME/bin/*
> 
> !# ROOT [NOT-RECOMMENDED]
>  sudo 7z e "./toolpack_x86_64.7z" -o"/usr/local/bin" -y ; sudo rm -rf "/usr/local/bin/toolpack_x86_64" 2>/dev/null ; rm -rf "./toolpack_x86_64.7z" ; sudo chmod +xwr /usr/local/bin/* 2>/dev/null
> #--------------------------------------------------------------------------------------------#
> ```
> ---
> </details>
>
> <details><summary>Info <b><a href="https://github.com/Azathothas/Toolpacks/tree/main/aarch64_arm64_Linux"><code>(aarch64 | arm64) Linux</code></a></b></summary>    
>
> ```bash
> #--------------------------------------------------------------------------------------------#
> ❯ Single/Individual Binaries
> 
> !# $USER
> eget "https://bin.ajam.dev/aarch64_arm64_Linux/$BINARY_NAME" --to "$HOME/bin"
>
> !# ROOT
> sudo eget "https://bin.ajam.dev/aarch64_arm64_Linux/$BINARY_NAME" --to "/usr/local/bin"
> 
> #--------------------------------------------------------------------------------------------#
> ❯ Everything All at once
> !# $USER
> !#Download .7z archive
>  wget --quiet --show-progress --progress="dot:giga" "https://bin.ajam.dev/aarch64_arm64_Linux/_toolpack_aarch64_arm64.7z" -O "./toolpack_aarch64_arm64.7z"
> 
> !# $USER
>  mkdir -p "$HOME/bin" ; 7z e "./toolpack_aarch64_arm64.7z" -o"$HOME/bin" -y ; rm -rf "$HOME/bin/toolpack_aarch64_arm64" 2>/dev/null ; rm -rf "./toolpack_aarch64_arm64.7z" ; chmod +xwr $HOME/bin/*
> 
> !# ROOT [NOT-RECOMMENDED]
>  sudo 7z e "./toolpack_aarch64_arm64.7z" -o"/usr/local/bin" -y ; sudo rm -rf "/usr/local/bin/toolpack_aarch64_arm64" 2>/dev/null ; rm -rf "./toolpack_aarch64_arm64.7z" ; sudo chmod +xwr /usr/local/bin/* 2>/dev/null
> #--------------------------------------------------------------------------------------------#
> ```
> ---
> </details>
>
> <details><summary>Info <b><a href="https://github.com/Azathothas/Toolpacks/tree/main/arm64_v8a_Android"><code>(arm64-v8a) Android</code></a></b></summary> 
>
> ```bash
> #--------------------------------------------------------------------------------------------#
> ❯ Single/Individual Binaries
>
> eget "https://bin.ajam.dev/arm64_v8a_Android/$BINARY_NAME" --to "$PREFIX/bin/$BINARY_NAME"
> 
> #--------------------------------------------------------------------------------------------#
> ❯ Everything All at once
>
> !# Create tmp dir
> pushd "$(mktemp -d)"
> !# Download all bins
> for url in $(curl -qfsSL "https://bin.ajam.dev/arm64_v8a_Android/METADATA.json" | jq -r '.[].Source' | grep -v "BLAKE3SUM\|FILE\.txt\|METADATA.json\|README\.md\|SHA256SUM"); do echo -e "\n[+] $url\n" && curl -qfLJO "$url"; done
>
> !# Move all to "$PREFIX/bin"
> # $PREFIX=/data/data/com.termux/files/usr
> find . -maxdepth 1 -type f ! -name '*.md' -exec mv {} "$PREFIX/bin/" \; 2>/dev/null
> #chmod
> chmod +xwr $PREFIX/bin/*
> #list
> ls "$PREFIX/bin" | column -t ; popd
> #--------------------------------------------------------------------------------------------#
> ```
> </details>
>
---
- #### 🚧 Security ⚙️
It is _never a good idea_ to **install random binaries** from **random sources**. 
- Check these `HackerNews Discussions`
> - [A cautionary tale from the decline of SourceForge](https://news.ycombinator.com/item?id=31110206)
> - [Downloading PuTTY Safely Is Nearly Impossible (2014)](https://news.ycombinator.com/item?id=9577861)
> - [Post-xz backdoor, how to know when to trust niche-distro binaries?](https://www.reddit.com/r/DistroHopping/comments/1bu5mri/postxz_backdoor_how_to_know_when_to_trust/)
> - A number of FAQs were also answered when [Hysp (Frontend PKG Manager)](https://github.com/pwnwriter/hysp) was [featured on HN](https://news.ycombinator.com/item?id=38457926): [https://news.ycombinator.com/item?id=38457926](https://news.ycombinator.com/item?id=38457926)
- [The XZ Backdoor](https://gist.github.com/thesamesam/223949d5a074ebc3dce9ee78baad9e27)
- [Reproducible Builds](https://reproducible-builds.org/docs/definition/)
> The amount of work and the near impossibility to ensure that every source used, provide reproducibility, is infeasibly impractical.
> Even if it were practical, not every `pkg/tool` provides source code, so this is impractical.
> 
- Reasons to **Trust this Repo**
> - All the [Build Scripts](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) & [workflows](https://github.com/Azathothas/Toolpacks/tree/main/.github/workflows) are completely open-source. You are free to audit & scrutinize everything.
> ```bash
> # Everything is automated via Github Actions & Build Scripts
> WorkFlows --> https://github.com/Azathothas/Toolpacks/tree/main/.github/workflows
> Build Scripts --> https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts
>
> # Build LOGS (BUILD.log] are generated at Build Time & Pushed both to Github & R2
> ```
> - Complete `RAW` **Build Logs** is made available with the **exception of `Personal Access Tokens`** [everytime the Workflows are run.](https://github.com/Azathothas/Toolpacks/actions)
> - Both `SHA256SUM` & `BLAKE3SUM` are automatically generated right after build script finishes.
> 
- Reasons **NOT to trust this Repo**
> - Repos that already publish pre-compiled static binaries, nothing is changed (Other than stripping Debug Symbols & Comments). You can compare checksums.
> - However, for repos that don't publish releases or at least not statically linked binaries, there is ***no way for you to end up with the same binary even when you use the same build scripts***. In this case, `checksums` are meaningless as **each build will produce different checksums**. Your only option is to `trust me bro` or:
> > - [Fork this repo](https://github.com/Azathothas/Toolpacks/fork) : https://github.com/Azathothas/Toolpacks/fork
> > - Read & Verify everything : [Scripts](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) & [Workflows](https://github.com/Azathothas/Toolpacks/tree/main/.github/workflows)
> > - Read the [DOCS](https://github.com/Azathothas/Toolpacks/tree/main/Docs) & Setup your own Infrastructure.
> > > - You may contact me at: [https://ajam.dev/contact](https://ajam.dev/contact) if you need help setting up your own.
---
