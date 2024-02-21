- #### How does It All Work?
> Either [Github-Runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners/about-github-hosted-runners) OR [Self-Hosted Runners](https://github.com/Azathothas/Toolpacks/tree/main/.github/runners) are configured and kicked off every 2-3 Days.
> These Runners are based on [Ubuntu (Debian)](https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/ubuntu-systemd-base.dockerfile). Each Runner then uses the Build Script ([x86_64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/x86_64_Linux/build_debian.sh) | [aarch64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/aarch64_Linux/build_debian.sh)).
> The [Build Script](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts) runs the Init Script ([x86_64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/x86_64_Linux/init_debian.sh) | [aarch64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/aarch64_Linux/init_debian.sh)) which sets up all the required env & tooling.
> And then, each and every script under `bins` ([x86_64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/x86_64_Linux/bins) | [aarch64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/aarch64_Linux/bins)) is run.
> These `bin` scripts are what's responsible for actually `building/compiling/fetching` the binaries.
> After this is completed, some additional housekeeping such as stripping debug symbols etc is done.
> Finally, all the binaries are uploaded to [bin.ajam.dev](https://bin.ajam.dev/). This is a [Cloudflare R2 Bucket](https://developers.cloudflare.com/r2/) and is managed using [rClone](https://github.com/rclone/rclone). All the binaries are also [compressed using 7z](https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/TIPS_TRICKS.md#archive--compress-dir--all-its-subfolders-with-best-possible-compression-7z) & uploaded to [R2](https://bin.ajam.dev/).

---
- #### How to add (request) a new a PKG/Tool?
> 1. First & Foremost, make sure to check that it's **not already available**.
> ```bash
> #-----------------------------------------------------------------------------#
> ↣ x86_64 Linux
> curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/METADATA.json" | jq -r '.[] | "\(.Name) --> \(.Repo)"' | grep -v "\.7z$\|BLAKE3SUM\|\.txt$\|\.json$\|\.log$\|\.md$\|SHA256SUM" | sort -u
>
> #Detailed (May not Contain Everything)  : https://github.com/Azathothas/Toolpacks/blob/main/x86_64_Linux/README.md
>
> #-----------------------------------------------------------------------------#
> ↣ aarch64 || arm64 Linux
> curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/METADATA.json" | jq -r '.[] | "\(.Name) --> \(.Repo)"' | grep -v "\.7z$\|BLAKE3SUM\|\.txt$\|\.json$\|\.log$\|\.md$\|SHA256SUM" | sort -u
>
> #Detailed (May not Contain Everything)  : https://github.com/Azathothas/Toolpacks/blob/main/aarch64_arm64_Linux/README.md
> 
> ```
> 
> 2. After you are really sure that it's not available, Read [BUILD_NOTES.md](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md).
> This contains notes on compiling static binaries. However, if there's already a static binary that's released, you can [just use eget to fetch it.](https://github.com/zyedidia/eget)
> 3. After you have successfully `built/compiled/fetched` a **static** binary, you must check that it's truly static : [Tests](https://github.com/Azathothas/Toolpacks/blob/main/Docs/BUILD_NOTES.md#tests)
> 4. After all this, finally describe & provide step-by-step instruction by [creating a new issue](https://github.com/Azathothas/Toolpacks/issues/new)
> Make sure to include **ALL Steps** (Including getting source code). Be as verbose as possible. Include output of `file` | `ldd` | `readelf`. Optionally, also test the binary with `qemu-$ARCH-static` or a minimal VM/Docker Image (Preferably alpine) to ensure that it really does work.
> 5. ***If you don't put effort into requesting a tool/pkg to be added here, neither will I.***

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
> - Essentially [Baseutils is a collection](https://github.com/Azathothas/Static-Binaries/tree/main/baseutils) of `Bins from CoreUtils` + `BusyBox` + `FindUtils` + `OpenSSH` + `Procps` + `ToyBox` + `UtilLinux` + `XZ-Utils` & [`More`](https://github.com/Azathothas/Static-Binaries/tree/main/baseutils).
> Mostly meant for restricted environments like ephemeral [AWS Lambda](https://medium.com/clog/ssh-ing-into-your-aws-lambda-functions-c940cebf7646), [Google Cloud Functions](https://cloud.google.com/functions?hl=en) or anywhere really where there's a lack of coreutils or no privs to use pkg managers.
> This could also be _theoretically_ used to [bootstrap a linux distro](https://www.youtube.com/watch?v=0vOEcw_sPaM), however, some binaries may not work as I haven't tested all of them comprehensively. Stability & Reliability isn't Guaranteed.

- #### How to contribute?
> To contribute, you **first must read & understand this entire repo**. After that, follow similar code/script style to make changes & then create a pull request.
> 
> This means, if your changes/pull request is not compatible with how I would do it, I will NOT ACCEPT it.
> 
> Hence, if all you want to do is request for some packages/tools to be added, you are better off creating an Issue instead. Read: https://github.com/Azathothas/Toolpacks/tree/main/Docs#how-to-add-request-a-new-a-pkgtool
>
> However, if it's not related to `code | asking for more packages` to be included, you can **contribute/help me by donating a build server**. Either `arm (Preferred)` or `amd x86_64`.
> Servers & Storage cost money, right now I pay for arm based runners & R2 Bucket. I am at the mercy of Github for x86-64 Servers.
