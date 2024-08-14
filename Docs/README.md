- #### What? & Why?
> - This, at the time of writing is, the **<ins>largest collection</ins>** of [*`downloadable`* (without requiring compilation)](https://bin.ajam.dev/) & [*`up-to-date`*](https://github.com/Azathothas/Toolpacks/commits/main/) [static binaries](https://en.wikipedia.org/wiki/Static_build) available on the public web.
> > **`More >`** than all of these *COMBINED*: [andrew-d/static-binaries](https://github.com/andrew-d/static-binaries), [s.minos.io/archive/](https://github.com/minos-org/minos-static), [polaco1782/linux-static-binaries](https://github.com/polaco1782/linux-static-binaries), [borestad/static-binaries](https://github.com/borestad/static-binaries), [files.serverless.industries/bin/](https://github.com/perryflynn/static-binaries), [mosajjal/binary-tools](https://github.com/mosajjal/binary-tools), [ryanwoodsmall/static-binaries](https://github.com/ryanwoodsmall/static-binaries), [bol-van/bins](https://github.com/bol-van/bins)
> - I recommend reading ["Static Linking Considered Harmful" Considered Harmful](https://gavinhoward.com/2021/10/static-linking-considered-harmful-considered-harmful/)
> - [Oasis Linux](https://github.com/oasislinux/oasis) & [Anton Samokhvalov](https://github.com/pg83)'s [Stalix](https://stal-ix.github.io/STALIX.html) both are distros specifically using only Static Binaries. Check their project page to learn Why.
> - And then we have things like [Cosmopolitan Libc](https://github.com/jart/cosmopolitan) & [T2 SDE](https://t2sde.org/about.html), they are very different from a Static Binary pov, but their rationale for doing so applies to why Static Binaries must exist.
---
- #### How does It All Work?
> - Either [Github-Runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners/about-github-hosted-runners) OR [Self-Hosted Runners](https://github.com/Azathothas/Toolpacks/tree/main/.github/runners) are configured and kicked off every 2-3 Days.
> - These Runners are based on [Ubuntu (Debian)](https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/ubuntu-systemd-base.dockerfile). Each Runner then uses the Build Script ([x86_64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/x86_64_Linux/build_debian.sh) | [aarch64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/aarch64_Linux/build_debian.sh)).
> - The [Build Script](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) runs the Init Script ([x86_64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/x86_64_Linux/init_debian.sh) | [aarch64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/aarch64_Linux/init_debian.sh)) which sets up all the required env & tooling.
> - And then, each and every script under `bins` ([x86_64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/x86_64_Linux/bins) | [aarch64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/aarch64_Linux/bins)) is run.
> - These `bin` scripts are what's responsible for actually `building/compiling/fetching` the binaries.
> - After this is completed, some additional housekeeping such as stripping debug symbols etc is done.
> - Finally, all the binaries are uploaded to [bin.ajam.dev](https://bin.ajam.dev/). This is a [Cloudflare R2 Bucket](https://developers.cloudflare.com/r2/) and is managed using [rClone](https://github.com/rclone/rclone). All the binaries are also [compressed using 7z](https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/TIPS_TRICKS.md#archive--compress-dir--all-its-subfolders-with-best-possible-compression-7z) & uploaded to [R2](https://bin.ajam.dev/).
> - These steps are same when compiling for other `$ARCH/$OS`

---
- #### How to add (request) a new a PKG/Tool?
> 1. First & Foremost, make sure to check that it's **not already available**.
> ```bash
> #-----------------------------------------------------------------------------#
> ↣ x86_64 Linux
> curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/METADATA.json" | jq -r '.[] | "\(.name) --> \((if .repo_url == null or .repo_url == "" then .web_url else .repo_url end))"' | sort -u
>
> #Detailed (May not Contain Everything)  : https://github.com/Azathothas/Toolpacks/blob/main/x86_64_Linux/DETAILED.md
>
> #-----------------------------------------------------------------------------#
> ↣ aarch64 || arm64 Linux
> curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/METADATA.json" | jq -r '.[] | "\(.name) --> \((if .repo_url == null or .repo_url == "" then .web_url else .repo_url end))"' | sort -u
>
> #Detailed (May not Contain Everything)  : https://github.com/Azathothas/Toolpacks/blob/main/aarch64_arm64_Linux/DETAILED.md
> 
> ```
> 
> 2. After you are really sure that it's not available, Read [BUILD_NOTES.md](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md).
> This contains notes on compiling static binaries. However, if there's already a static binary that's released, you can [just use eget to fetch it.](https://github.com/zyedidia/eget)
> 3. After you have successfully `built/compiled/fetched` a **static** binary, you must check that it's truly static : [Tests](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md#tests)
> 4. After all this, finally describe & provide step-by-step instruction by [creating a new issue](https://github.com/Azathothas/Toolpacks/issues/new)
> Make sure to include **ALL Steps** (Including getting source code). Be as verbose as possible. Include output of `file` | `ldd` | `readelf`. Optionally, also test the binary with `qemu-$ARCH-static` or a minimal VM/Docker Image (Preferably alpine) to ensure that it really does work.
> 5. If you can not (don't know how to) compile, [create a new issue](https://github.com/Azathothas/Toolpacks/issues/new) with links to the PKG/Tool's homepage/source-code along with a brief description on what it does.
> 6. ***If you don't put effort into requesting a tool/pkg to be added here, neither will I.***
> > - A [list of PKG/Tool to be Added](https://github.com/stars/Azathothas/lists/toolpacks-tba): https://github.com/stars/Azathothas/lists/toolpacks-tba
---

- #### Why not many Android Binaries?
> - Android is [weird & very different from Linux](https://wiki.termux.com/wiki/Differences_from_Linux).
> - Android has [known issues that are `won't fix | by design`](https://github.com/termux/termux-packages/wiki/Common-porting-problems)
> - Android binaries [`CAN NOT BE COMPILED STATICALLY`](https://github.com/Zackptg5/Cross-Compiled-Binaries-Android/tree/master/build_script#dns-issues) without signifcant efforts & manual patching for each & every binary. This is not Automatable.
> - [Termux](https://termux.dev/en/) already [ports thousands of packages](https://github.com/termux/termux-packages), Check the [Issues for your `pkg`](https://github.com/termux/termux-packages/issues). There's also a [**near-complete** list of all packages offically available on Termux](https://github.com/Azathothas/Termux-Packages)
> - [bin.ajam.dev/arm64_v8a_Android](https://bin.ajam.dev/arm64_v8a_Android/) Only provides Tools/Pkgs (Only for `arm64-v8a`) that I personally use but aren't already available in termux-pkgs or broken or just for lulz. I will probably not accept request for android binaries.
> - Check these : [Zackptg5/Cross-Compiled-Binaries-Android](https://github.com/Zackptg5/Cross-Compiled-Binaries-Android) & [bol-van/bins](https://github.com/bol-van/bins) 
---

- #### What is `Baseutils`?
> - Essentially [Baseutils is a collection](https://bin.ajam.dev/x86_64_Linux/Baseutils/) of `Bins from CoreUtils` + `BusyBox` + `FindUtils` + `OpenSSH` + `Procps` + `ToyBox` + `UtilLinux` + `XZ-Utils` & [`More`](https://bin.ajam.dev/x86_64_Linux/Baseutils/).
> Mostly meant for restricted environments like ephemeral [AWS Lambda](https://medium.com/clog/ssh-ing-into-your-aws-lambda-functions-c940cebf7646), [Google Cloud Functions](https://cloud.google.com/functions?hl=en) or anywhere really where there's a lack of coreutils or no privs to use pkg managers.
> This could also be _theoretically_ used to [bootstrap a linux distro](https://www.youtube.com/watch?v=0vOEcw_sPaM), however, some binaries may not work as I haven't tested all of them comprehensively. Stability & Reliability isn't Guaranteed.
---

- #### `Broken | NOT Statically Linked` Binaries
> - If you find a binary that doesn't work (`segfaults/crashes`) or is `dynamically linked`, it will be treated as a bug.
> - There's an automated step which checks for these: [aarch64-Linux](https://github.com/Azathothas/Toolpacks/blob/main/aarch64_arm64_Linux/BUILD_ERROR.log.md) [arm64-v8a-Android](https://github.com/Azathothas/Toolpacks/tree/main/arm64_v8a_Android/BUILD_ERROR.log.md) [x86_64-Linux](https://github.com/Azathothas/Toolpacks/blob/main/x86_64_Linux/BUILD_ERROR.log.md) [x64-Windows](https://github.com/Azathothas/Toolpacks/tree/main/x64_Windows)
> - So if it's already there, it will eventually be fixed.
> - If it's NOT Or you would like me to fix it ASAP [please create an Issue](https://github.com/Azathothas/Toolpacks/issues/new)
> > - `Title`: Summary of Issue along with `Binary` & `Platfrom` Name
> > - `Description`: Show me `crash/segfault` screenshot or provide `file/ldd/readelf` output along with what would be the correct behaviour
> > - `Tag`: `BUG` + `$PLATFORM`
---

- #### Why not host on GitHub?
> - Actually, I used to do just that back when there were only a few hundred binaries. All binaries were hosted on GitHub along with weekly releases containing all Binaries packed in tar/7z.
> > You can find this on the [WayBack Archive](https://web.archive.org/web/*/https://github.com/Azathothas/Toolpacks): https://web.archive.org/web/*/https://github.com/Azathothas/Toolpacks
> - As number of packages grew, Git turned out to be not the right tool: https://www.reddit.com/r/git/comments/ek4kv2/git_is_bad_at_binary_file_management_but_is_it/
> - GitHub also has limits: https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github
> - Last but not least, to avoid https://github.com/Azathothas/Toolpacks/edit/main/Docs/README.md#dmca-copyright--cease--desist
---

- #### Why reset ALL Git Commits?
> - The entire repo is reset back to 1 commit as soon as Total Number of Commits reaches `>1000`
> - This is because 95% of these commits are automated, and on average there's `50-100` commits/Day.
> - This quickly spams the entire git history rendering backtracking changes very hard.
> - Thus to keep it all clean and actually useful, a purge is committed every `>1000` Commits (~2-3 Weeks)
---

- #### How to verify checksums?
> - [**SHA256SUM**](https://linux.die.net/man/1/sha256sum)
> ```bash
> ❯ Linux (curl + jq + sha256sum) [RECOMMENDED]
> !#path= should be exact location to $BIN, so if it's in cwd, path="./$BIN" [REPLACE $BIN with literal Value)
> echo "$(curl -qfsSL "https://bin.ajam.dev/$(uname -m)/METADATA.json" | jq -r '.[] | select(.name == "$BIN") | .sha256')  $PATH_TO_BIN" | sha256sum -c -
> !#If you downloaded from Baseutils/*, URL: https://bin.ajam.dev/$(uname -m)/Baseutils/METADATA.json"
>  
> ❯ Linux (curl + awk + sha256sum)
> !#path= should be exact location to $BIN, so if it's in cwd, path="./$BIN" [REPLACE $BIN with literal Value)
> curl -qfsSL "https://bin.ajam.dev/$(uname -m)/SHA256SUM.txt" | awk -v path="$PATH_TO_BIN" '/ $BIN$/{print $1, path}' | sha256sum -c -
> !#If you downloaded from Baseutils/* etc, you must pass the correct URL: https://bin.ajam.dev/$(uname -m)/Baseutils/$PATH/SHA256SUM.txt
>
> ```
---

- #### Supporting More [`Architectures`](https://wiki.debian.org/SupportedArchitectures) & [`OS`](https://en.wikipedia.org/wiki/List_of_operating_systems)
> - I would like to build binaries for other architectures like [`riscv64`](https://en.wikipedia.org/wiki/RISC-V), and the [BSD Family of OSes](https://en.wikipedia.org/wiki/Comparison_of_BSD_operating_systems), however my time & especially **`RESOURCES`** are limited.
> - If you would like to see additional build targets prioritized, donating a [Dedicated Build Server](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-contribute) would be the optimal encouragement.
> - Note: `32-Bit` Binaries will likely never be Supported/Added since that's now ancient and even embedded devices now ship with `64-Bit` **ARCH**
---

- #### [Cache & Rebuild](https://github.com/marketplace/actions/cache)
> - It's often been suggested to use a [caching system](https://github.com/cachix/cachix) to <ins>Decrease Build Time</ins> & <ins>Avoid Rebuilding OutDated Repos</ins>
> - While this suggestion is sound and seems like a no-brainer to implement, potential pain-points:
> > - This would involve rewriting all of the [build recipes (`~ >5000`)](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) or at the very least adding some new logic to the process.
> > - This would also require [New infra & Servers](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-contribute) which will <ins>increase Cost & Maintenance.</ins>
> > - Using [Cached Artefacts](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows) & [Non-Ephemeral Containers](https://github.com/ephemeralenvironments/ephemeralenvironments) will mean an increase in [Attack Vectors via Supply Chain](https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions).
> > - Thus, this is quite impractical and is unlikely to ever be implemented.
---

- #### **`📦 Frontend Package Managers 📦`**
> - Here are some fantastic package managers 📦 [developed](https://antonz.org/writing-package-manager/) by talented individuals that [utilize this project](https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md):
> > - [`@xplshn/BigDL`](https://github.com/xplshn/bigdl) is the current de-facto, recommended one you should use.
> > - [`@pwnwriter/hysp`](https://github.com/pwnwriter/hysp) was <ins>archived</ins> is no longer recommended.
---

- #### [⏬ **`UPX`** ⏬](https://upx.github.io/)
> - Binaries are also packed using [`upx --best`](https://github.com/upx/upx/blob/devel/doc/upx-doc.txt#L114) after a [CI Build is Complete.](https://github.com/Azathothas/Toolpacks/actions)
> - These can be downloaded by either using the [GUI Button](https://bin.ajam.dev/)⏬ or by simply adding a `.upx` to any binary.
> > Example:
> > ```bash
> > #This will download upx packed version of curl
> > curl -qfsSL "https://bin.ajam.dev/$(uname -m)/curl.upx" -o "./curl"
> > ```
> - There is no entry for `UPX` Binaries in [METADATA](https://github.com/Azathothas/Toolpacks/blob/main/Docs/METADATA.md) & also no [`CHECKSUMS`](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-verify-checksums)
> - `UPX` Binaries can still be decompressed `upx -d $BIN.upx` & then checked for original [`CHECKSUMS`](https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-verify-checksums)
> - Note: If a build was completed recently, it's `UPX` packed version may need some time to show up (Because it's done as post-build)
> > - Hence, raw binary may be a newer version while it's `UPX` may still be from the old one. In this case, using `UPX` to decompress & verify checksum will fail.
> > - `UPX` counterparts generally take **5-10** hrs to show up, packed fresh from the latest batch.
> - Note: ALL Binaries (Platforms) may NOT have `UPX` Versions even if they show in [GUI Button](https://bin.ajam.dev/)⏬
---

- #### [`DMCA`](https://opensource.guide/legal/), [`Copyright`](https://opensource.guide/legal/) & [`Cease & Desist`](https://opensource.guide/legal/)
> - If you/your project/software uses a license which forbids binary distribution, and you would like to take down the binary:
> > - First, having such clause and disallowing people to distribute binaries, will harm only your own popularity/ potential user increment
> > - Second, this repo is intentionally licensed as [`unlicense`](https://unlicense.org/) which is essentially Public Domain/Do whatever you want.
> > - Third, if you have no problems with any major package managers like [brew](https://brew.sh/), [NixPKGs](https://search.nixos.org/packages), [pkgsrc](https://pkgsrc.org/) etc, you shouldn't have an Issue with this repo.
> > - In summary, all `DMCA | CopyRight` **Notices will be Ignored & Not Complied With.**
> > > All Binaries are hosted on Cloudflare, and NOT GitHub. GitHub only contains scripts & source code.
---

- #### How to Setup & Configure Local Build Environment
> > Currently this is very easy for Linux, but will require additional steps for Android & Windows
> - Install [Docker](https://github.com/docker/docker-install) + [Podman](https://github.com/Azathothas/Toolpacks/tree/main/.github/runners#additional-notes--refs)
> - Run (May Differ based on Your Host)
> > ```bash
> > !#Automatically picks up correct $ARCH & $IMAGE based on Host
> > sudo mkdir -p "/var/lib/containers/tmp"
> > sudo podman run --detach --privileged --network="bridge" --publish "22222:22" --systemd="always" --ulimit="host" --volume="/var/lib/containers/tmp:/tmp" --tz="UTC" --pull="always" --name="toolpacker-dbg" "docker.io/azathothas/ubuntu-systemd-base:latest"
> >
> > !#Add SSH Keys (Replace with yours)
> > sudo podman exec -it -u "runner" "toolpacker-dbg" bash -c 'bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/install_bb_tools.sh")'
> > sudo podman exec -it -u "runner" "toolpacker-dbg" bash -c 'sudo curl -qfsSL "https://github.com/Azathothas.keys" | sudo sort -u -o "/etc/ssh/authorized_keys" ; sudo systemctl restart sshd'
> >
> > !#SSH IN
> > echo -e "\n[+] HOST_IP : $(ip -4 addr show $(ip route | grep default | awk '{print $5}') | grep -oP '(?<=inet\s)\d+(\.\d+){3}')\n"
> > ssh "runner@$HOST_IP" -p "22222" -o "StrictHostKeyChecking=no" -i "$PATH_TO_SSH_KEY"
> > #After SSH, the source script sets up ENV & PATH
> > source <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/scripts/$(uname -m)_Linux/env.sh")
> >
> > !#STOP/DEL
> > sudo podman stop "toolpacker-dbg"
> > sudo podman rm "toolpacker-dbg" --force 2>/dev/null
> > ```
---

- #### How to contribute?
> To contribute, you **first must read & understand this entire repo**. After that, follow similar code/script style to make changes & then create a pull request.
> 
> This means, if your changes/pull request is not compatible with how I would do it, it will probably involve a lot of back & forth (Merge/Squashing)
> 
> Hence, if all you want to do is request for some packages/tools to be added, you are better off creating an Issue instead. Read: https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-add-request-a-new-a-pkgtool
>
> - However, if it's not related to `code | asking for more packages` to be included, you can **contribute/help me by donating a build server**. Either `arm (Preferred)` or `amd x86_64`.
> - Servers & Storage cost money, right now I pay for [Self Hosted Github Runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners) & R2 Bucket (`70-100$/Month`).
> > | Builder | Specs| Host | Dedicated ? | Build Time | Cost |
> > | ------- | ---- | ---- | --------- | ---------- | ---- |
> > | [`x86_64` `Linux`](https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml) | `8 vCPU (AMD EPYC™ 9634)` `+` `16 GB RAM (DDR5 ECC)` `+` `512 GB SSD` `+` `Unmetered Bandwidth` | [`Netcup`](https://www.netcup.eu/bestellen/produkt.php?produkt=3694) | [`Semi-Dedicated`](https://www.netcup.eu/vserver/vergleich-root-server-vps.php) | `20-25` `Hrs` | `$18.50/Mo` |
> > | [`aarch64` `Linux`](https://github.com/Azathothas/Toolpacks/actions/workflows/build_aarch64_Linux.yaml) | `12 vCPU (Ampere Altra)` `+` `24 GB RAM (??)` `+` `768 GB SSD` `+` `Unmetered Bandwidth` | [`Netcup`](https://www.netcup.eu/bestellen/produkt.php?produkt=3991) | `NO` | `35-40` `Hrs` | `$16.70/Mo` | 
---

- #### [WebUI (bin.ajam.dev)](https://bin.ajam.dev/)
> - There's no public source code for the web frontend powering https://bin.ajam.dev/
> > - [bin.ajam.dev](https://bin.ajam.dev/) is **<ins>NOT a web server</ins>**. It's a [web proxy](https://developers.cloudflare.com/r2/buckets/public-buckets/#connect-a-bucket-to-a-custom-domain) to an [R2 Bucket](https://developers.cloudflare.com/r2/buckets/public-buckets/)
> > - Internally, it uses a fork of [cmj2002/r2-dir-list](https://github.com/cmj2002/r2-dir-list) with [<ins>Hardcoded Cloudflare Credentials</ins>](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/)
> > - The content can always <ins>be verified by comparing **CHECKSUMS**</ins>, Published both here on [Github (via Publicly Auditable & Log Viewable) Actions & on the Site.](https://github.com/Azathothas/Toolpacks/tree/main#-security-%EF%B8%8F)
---

- #### Typos, Grammatical Errors & Bad Documentation
> - Unfortunately, English is NOT my Native Tongue & neither do I have the patience or time to extensibly review & double check what I write!
> - As a result, there's higher than usual frequency of typos & grammatical errors. And the Documentation is rather obscure and not well written.
> - That's why, I welcome any and all efforts to correct me. Please [submit PRs](https://github.com/Azathothas/Toolpacks/pulls) and I will merge them.
---

- #### How do I find new Tools to add?
> - [GitHub Search](https://github.com/search?q=is%3Apublic+archived%3Afalse+template%3Afalse+lang%3Ac+lang%3Acrystal+lang%3Ago+lang%3Anim+lang%3Arust+lang%3Azig+stars%3A%3E5+cli+OR+tool+OR+utility&type=repositories&s=updated&o=desc): `is:public archived:false template:false lang:c lang:crystal lang:go lang:nim lang:rust lang:zig stars:>5 cli OR tool OR utility` (Sorted By: `Recently Updated`)
> - [GitHub Issues](https://github.com/Azathothas/Toolpacks/blob/main/.github/pub_issues.txt): [https://github.com/Azathothas/Toolpacks/blob/main/.github/pub_issues.txt](https://github.com/Azathothas/Toolpacks/blob/main/.github/pub_issues.txt)
---

- #### Public Code Search
> - [GitHub Search](https://github.com/search?q=NOT+user%3AAzathothas+NOT+user%3Axplshn+NOT+user%3Ametis-os+NOT+user%3Ahackerschoice+NOT+is%3Afork+bin.ajam.dev&type=code&s=updated&o=desc): `NOT user:Azathothas NOT user:xplshn NOT user:metis-os NOT user:hackerschoice NOT is:fork bin.ajam.dev`
> - [Google](https://www.google.com)|[Bing](https://www.bing.com/)|[Baidu](https://www.baidu.com): `"*.bin.ajam.dev" -site:ajam.dev`
---

- #### [Contact](https://ajam.dev/contact)
> - If you find your question hasn't been answered here OR you would like to seek clarification OR just say Hi : https://ajam.dev/contact
