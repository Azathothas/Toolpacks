- #### How does It All Work?
> Either [Github-Runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners/about-github-hosted-runners) OR [Self-Hosted Runners](https://github.com/Azathothas/Toolpacks/tree/main/.github/runners) are confiured and kicked off every 2-3 Days.
> These Runners are based on [Ubuntu (Debian)](https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/ubuntu-systemd-base.dockerfile). Each Runner then uses the Build Script ([x86_64](https://github.com/Azathothas/Toolpacks/blob/main/.github/scripts/x86_64_Linux/build_debian.sh) | [aarch64](https://github.com/Azathothas/Toolpacks/tree/main/.github/scripts/aarch64_Linux)).
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
> Make sure to include **ALL Steps** (Including getting source code). Be as verbose as possible. Include output of `file` | `ldd` | `readelf`. ***If you don't put effort into requesting a tool/pkg to be added here, neither will I.***

---
- #### Why not many Android Binaries?
> - Android is [weird & very different from Linux](https://wiki.termux.com/wiki/Differences_from_Linux).
> - Android has [known issues that are `won't fix | by design`](https://github.com/termux/termux-packages/wiki/Common-porting-problems)
> - Android binaries [`CAN NOT BE COMPILED STATICALLY`](https://github.com/Zackptg5/Cross-Compiled-Binaries-Android/tree/master/build_script#dns-issues) without signifcant efforts & manual patching for each & every binary. This is not Automatable.
> - [Termux](https://termux.dev/en/) already [ports thousands of packages](https://github.com/termux/termux-packages), Check the [Issues for your `pkg`](https://github.com/termux/termux-packages/issues). There's also a [**near-complete** list of all packages offically available on Termux](https://github.com/Azathothas/Termux-Packages)
> - [bin.ajam.dev/arm64_v8a_Android](https://bin.ajam.dev/arm64_v8a_Android/) Only provides Tools/Pkgs (Only for `arm64-v8a`) that I personally use but aren't already available in termux-pkgs or broken or just for lulz. I will probably not accept request for android binaries.
---
