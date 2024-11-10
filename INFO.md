<!-- This can be changed -->
<p align="center">
    <a href="https://github.com/pkgforge/soar">
        <img src="https://github.com/Azathothas/Toolpacks/assets/58171889/d226c553-1835-464c-8908-fe293d3aac3c" width="100"></a>
    <br>
    <b><strong> <a href="https://github.com/pkgforge/soar">Statically Compiled Binaries</a></code></strong></b>
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

> - ℹ️ As of `2024-11-05`, this repo is a part of [PkgForge](https://github.com/pkgforge).
> - [PkgForge](https://github.com/pkgforge) was created to fix the [disparate status of Linux Package Formats](https://www.linux-magazine.com/Online/Features/The-Status-of-Universal-Package-Systems).
> - Other than [Static Binaries](https://github.com/Azathothas/Toolpacks), we now also provide [prebuilts](https://github.com/pkgforge/pkgcache) & [build recipes](https://github.com/pkgforge/soarpkgs) for formats like [AppBundle](https://github.com/pkgforge/pkgcache/blob/main/Docs/APPBUNDLES.md), [AppImage](https://github.com/pkgforge/pkgcache/blob/main/Docs/APPIMAGES.md), [FlatImage](https://github.com/pkgforge/pkgcache/blob/main/Docs/FLATIMAGES.md), [GameImage](https://github.com/pkgforge/pkgcache/blob/main/Docs/GAMEIMAGES.md), [RunImage](https://github.com/pkgforge/pkgcache/blob/main/Docs/RUNIMAGES.md) & [More](https://github.com/pkgforge/pkgcache/tree/main/Docs)<br>
> - We also have our own [`Package-Manager`](https://github.com/pkgforge/soar) built in blazingly fast 🦀 rust called [Soar](https://github.com/pkgforge/soar)
> - [Repo Migration was Attempted but proved unsuccessful.](https://github.com/pkgforge/bincache/issues/1)
---
#### Contents
> - [**📖 Docs & FAQs 📖**](https://github.com/Azathothas/Toolpacks/tree/main/Docs)
> > - [**`What? & Why?`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#what--why)
> > - [**`How does it all actually work?`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-does-it-all-work)
> > - [**`Request a new PKG/Tool`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-add-request-a-new-a-pkgtool)
> > - [**`📦 Frontend Package Managers`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#-frontend-package-managers-)
> > - [**`Notes On Building`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md)
> > - [**`Typos, Grammatical Errors & Bad Documentation`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#typos-grammatical-errors--bad-documentation)
> > - [**`Additional Build Targets($ARCH-$OS)`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#supporting-more-architectures--os)
> > - [**`How To Contribute/Donate`**](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-contribute)
> > - [**`Why NOT Host On GitHub`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#why-not-host-on-github)
> > - [**`Why RESET ALL GIT Commits`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#why-reset-all-git-commits)
> > - [**`Where can I find the code for bin.ajam.dev?`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#webui-binajamdev)
> > - [**`UPX Binaries ⏬`**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/README.md#-upx-)
> > - [**`🏜️ GUI PKGs 📀`**](https://github.com/pkgforge/pkgcache)
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
> - [**Community 💬**](https://t.me/official_loonix/63949)
> > - <a href="https://t.me/official_loonix/63949"><img src="https://github.com/user-attachments/assets/2edc90b9-606e-4bfc-89f3-2a758b2f0377" width="18" height="18"><code>Loonix (<img src="https://github.com/user-attachments/assets/abc35eee-c9c9-4023-9035-d440b56cac4c" width="18" height="18">) Telegram</code></a> `➼` [`https://t.me/official_loonix/63949`](https://t.me/official_loonix/63949)
> > - <a href="https://matrix.to/#/#loonix:matrix.org"><img src="https://github.com/user-attachments/assets/1dcd4a64-2fec-4f4f-926a-e61313b6b646" width="18" height="18"><code>Loonix (<img src="https://github.com/user-attachments/assets/abc35eee-c9c9-4023-9035-d440b56cac4c" width="18" height="18">) Matrix </code></a> `➼` [`https://matrix.to/#/#loonix:matrix.org`](https://matrix.to/#/#loonix:matrix.org) **`ABANDONED & NOT ACTIVE`** 
---
<!-- DO NOT CHANGE -->
- #### [📦 Status 🔖](https://trello.com/b/rxIHO8Zj/toolpacks-status)
| 🧰 Architecture 🧰 | 📦 Total Binaries 📦 | 🇨🇭 WorkFlows 🇨🇭 | 🧾Logs|
|---------------------|-----------------------|-----------------|------------------|
|[ **Android `arm64-v8a`**](https://github.com/Azathothas/Toolpacks/tree/main/arm64_v8a_Android)|PLACEHOLDER_arm64_v8a_Android| [![🛍️ Build 📦 (toolpack_arm64_v8a_Android) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_arm64_v8a_Android.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_arm64_v8a_Android.yaml)|[BUILD.log](https://bin.ajam.dev/arm64_v8a_Android/BUILD.BIN.log.txt)|
|[ **Linux `aarch64 // arm64`**](https://github.com/Azathothas/Toolpacks/tree/main/aarch64_arm64_Linux)|PLACEHOLDER_aarch64_arm64_Linux| [![🛍️ Build 📦 (toolpack_aarch64_Linux) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_aarch64_Linux.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_aarch64_Linux.yaml)|[BUILD.log](https://bin.ajam.dev/aarch64_arm64_Linux/BUILD.BIN.log.txt)|
|[ **Linux `amd // x86_64`**](https://github.com/Azathothas/Toolpacks/tree/main/x86_64_Linux)|PLACEHOLDER_x86_64_Linux| [![🛍️ Build 📦 (toolpack_x86_64_Linux) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml)|[BUILD.log](https://bin.ajam.dev/x86_64_Linux/BUILD.BIN.log.txt)|
|[ **Windows `x64 // AMD64`**](https://github.com/Azathothas/Toolpacks/tree/main/x64_Windows)|PLACEHOLDER_x64_Windows| [![🛍️ Build 📦 (toolpack_x64_Windows) Binaries 📦🗄️](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x64_Windows.yaml/badge.svg)](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x64_Windows.yaml)|[BUILD.log](https://bin.ajam.dev/x64_Windows/BUILD.BIN.log.txt)|

> - Raw [**`metadata`**](https://bin.ajam.dev/METADATA.json) containing info for _sources_ etc is available as [**JSON**](https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md) on [bin.ajam.dev/METADATA.json](https://bin.ajam.dev/METADATA.json) & also as [**YAML**](https://raw.githubusercontent.com/Azathothas/Toolpacks/main/METADATA.yaml).
> - See: [Parse METADATA.json](https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md#using-jq-to-parse-metadatajson) to learn how to parse using `jq`
---
#### 🔽 Download 🔽
- ##### `Package Managers` `RECOMMENDED`
> - [**`Soar`**<img src="https://github.com/user-attachments/assets/cc2f8c7c-fc40-4f8a-bbef-fef9d149dfc9" width="20" height="20">](https://github.com/pkgforge/soar)
> > - If you want a pkg-manager in [Rust](https://github.com/rust-unofficial/awesome-rust) 🦀, Choose this.
> > [Details](https://github.com/pkgforge/soar) ➣ [https://github.com/pkgforge/soar](https://github.com/pkgforge/soar)
> > ```bash
> > bash <(curl -qfsSL "https://raw.githubusercontent.com/pkgforge/soar/refs/heads/main/install.sh")
> > ```
> > 
> - [**`Dbin`**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/go/go-original-wordmark.svg" width="20" height="20">](https://github.com/xplshn/dbin) 
> > - If you want a pkg-manager in [Go](https://github.com/avelino/awesome-go), Choose this.
> > [Details](https://github.com/xplshn/dbin) ➣ [https://github.com/xplshn/dbin](https://github.com/xplshn/dbin)
> > ```bash
> > wget -qO- "https://raw.githubusercontent.com/xplshn/dbin/master/stubdl" | sh -s -- --install "${HOME}/.local/bin/dbin"
> > ```
> > 
---

- ##### `CLI`
> - It's also possible to use `"$(uname -m)"`
> > SEE: https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md#url-redirects
> > 
> > ```bash
> > !# curl needs the `-L, --location` flag to Follow redirects
> > !# wget works without any flags
> > 
> > !# Example
> > curl -qfsSLO "https://bin.ajam.dev/$(uname -m)/$BIN_OR_PATH_TO_BIN"
> >
> > ```
---

- ##### GUI `NOT RECOMMENDED`
> - Visit [bin.ajam.dev](https://bin.ajam.dev)
> > Note: If you notice slow loading, it is because it is <ins>not a real website.</ins><br>
> > It is a [r2 bucket](https://developers.cloudflare.com/r2/), and <ins>loads all objects upon each request</ins>.
> ![bin](https://github.com/user-attachments/assets/775f0022-9932-4d7c-8d25-3a9df2bde78d)
> ![bin x86_64_Linux](https://github.com/user-attachments/assets/8dfb6f89-6129-4692-a918-23a6b18876d7)
---

- #### 🚧 Security ⚙️
It is _NEVER a good idea_ to **install random binaries** from **random sources**. 
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
> - If it still doesn't inspire confidence, there's a [Docker Image](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-setup--configure-local-build-environment) you can Configure to [<ins>Run & Reproduce</ins>](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-setup--configure-local-build-environment) any [Binary/Build Script](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) on your own Secure System.
> > - Dockerfiles: https://github.com/Azathothas/Toolpacks/tree/main/.github/runners
> > - Note: <ins>Checksums may not be reproduced reliably (See Reason Below)</ins>
>
- Reasons **NOT to trust this Repo**
> - Repos that already publish pre-compiled static binaries, nothing is changed (Other than stripping Debug Symbols & Comments). You can compare checksums.
> - However, for repos that don't publish releases or at least not statically linked binaries, there is ***no way for you to end up with the same binary even when you use the same build scripts***. In this case, `checksums` are meaningless as **each build will produce different checksums**. Your only option is to `trust me bro` or:
> > - [Fork this repo](https://github.com/Azathothas/Toolpacks/fork) : https://github.com/Azathothas/Toolpacks/fork
> > - Read & Verify everything : [Scripts](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) & [Workflows](https://github.com/Azathothas/Toolpacks/tree/main/.github/workflows)
> > - Read the [DOCS](https://github.com/Azathothas/Toolpacks/tree/main/Docs) & Setup your own Infrastructure.
> > > - You may contact me at: [https://ajam.dev/contact](https://ajam.dev/contact) if you need help setting up your own.
>
- [**Backdoors, Malwares & Viruses**](https://book.hacktricks.xyz/generic-methodologies-and-resources/basic-forensic-methodology/malware-analysis)
> - First, it's important to verify that the alert is [NOT a False Positive](https://web.archive.org/web/2/https://www.majorgeeks.com/content/page/how_to_tell_the_difference_between_a_virus_and_a_false_positive.html) and **truly confirm** that indeed the [Binary is Malicious](https://www.reddit.com/r/linux4noobs/comments/18pbfv1/how_can_i_determine_a_elf_executable_is_malicious/)
> - Second, check the affected [Binary's Build Script](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts), the [latest BUILD.log](https://github.com/Azathothas/Toolpacks#-status-) & finally [CHECKSUMS](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-verify-checksums)
> - Third, if you find everything is as it should be, [create an Issue](https://github.com/Azathothas/Toolpacks/issues/new/choose) & attach Verifiable and Reproducible Proof.
> - It's important to NOTE that **<ins>I DO NOT WRITE/OWN the binaries I compile and CAN NOT BE HELD RESPONSIBLE if the `Devloper` has DELIBERATELY made it Malicious</ins>**. If that's the case, it's best to **Notify Me ([Create an Issue](https://github.com/Azathothas/Toolpacks/issues/new/choose) OR [Contact Me](https://ajam.dev/contact)) & also [Report To Github the Original Repo](https://docs.github.com/en/communities/maintaining-your-safety-on-github/reporting-abuse-or-spam)** like here: https://github.com/orgs/community/discussions/63603
> - All of the [Build Servers](https://github.com/Azathothas/Toolpacks/actions) follow [Standard Security Hardening](https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions) to mitigate [Supply Chain Attacks](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-supply-chain-security), so <ins>a single Malicious Binary is more probable than ALL of the binaries being Infected</ins>.
> - Once again to reiterate, the source code of the packages or tools compiled here is not controlled in anyway.
> > - The process involves fetching the code and following standard [build procedures](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md) which are [well documented](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-does-it-all-work) and the [scripts available to audit](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts).
> > - In the case of binaries, whose upstream developers <ins>do not provide source code</ins> ([ngrok](https://ngrok.com/), [Twingate](https://www.twingate.com/), etc.) OR <ins>themselves provide a pre-compiled static binary</ins> (Github Releases), the binary is simply fetched AS-IS (Other than stripping Debug Symbols).
> > - <ins>It cannot be guaranteed that the upstream source is entirely safe or legitimate. It's upto you to exercise basic common sense and vigilance when using these binaries.</ins>
---
