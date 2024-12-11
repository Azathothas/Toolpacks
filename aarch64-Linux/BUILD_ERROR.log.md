```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

26178-
26179- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Tuesday, 2024-12-03 (12:06:38 AM) UTC]
26180-
26181-remote: Support for password authentication was removed on August 13, 2021.
26182-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
26183:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
26184-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
26185-cp: cannot stat './certwatcher': No such file or directory
26186-
--
157910-go: downloading github.com/gobwas/glob v0.2.3
157911-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
157912-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
157913-	remote: Support for password authentication was removed on August 13, 2021.
157914-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
157915:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
157916-cp: cannot stat './gfx': No such file or directory
157917-
157918-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):05(Sec)
--
426532-
426533- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-12-03 (06:37:29 PM) UTC]
426534-
426535-remote: Support for password authentication was removed on August 13, 2021.
426536-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
426537:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
426538-info: component 'rust-std' for target 'aarch64-unknown-linux-musl' is up to date
426539-sed: can't read ./Cargo.toml: No such file or directory
426540-error: failed to parse manifest at `/tmp/toolpacks/BDl9vbA_linux_aarch64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

213077-
213078-
213079-
213080- [+] (Building | Fetching) linutil :: https://github.com/ChrisTitusTech/linutil [Tuesday, 2024-12-03 (09:42:04 AM) UTC]
213081-
213082:asset `aarch64` not found
--
327382-
327383-
327384-
327385- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-12-03 (02:52:49 PM) UTC]
327386-
327387:asset `ruri` not found
--
347608-
347609-
347610-
347611- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-12-03 (03:21:26 PM) UTC]
347612-
347613:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):39(Sec)


[-] command not found --> # Something failed to Install

62920:cpufetch-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: git: command not found
67956:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
68474:vim-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: hostname: command not found
70505:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
71338:cryptsetup-static-aarch64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
92702:libXau-static-aarch64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
92784:libXdmcp-static-aarch64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
93240:libICE-static-aarch64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
93509:libapparmor-static-aarch64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
93949:libSM-static-aarch64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
94162:libxcb-static-aarch64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
97796:dbus-static-aarch64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
99637:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
99829:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
100048:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
105534:ck-static-aarch64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
106018:ldns-static-aarch64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
106020:ldns-static-aarch64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
114990:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
127890:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
129819:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
131997:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
135975:mpfr-static-aarch64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
138835:libmpc-static-aarch64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
142947:source-highlight-static-aarch64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
197260:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
197303:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
197586:iperf-static-aarch64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
198749:libmnl-static-aarch64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
198909:libnfnetlink-static-aarch64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
199669:libnftnl-static-aarch64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
199861:libnetfilter_conntrack-static-aarch64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
200601:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
200651:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
200669:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
202632:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
202662:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
202708:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
210285:kmod-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
232917:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
232966:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
232984:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
233517:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
233518:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
233519:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: git: command not found
233642:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
233643:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
233644:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: git: command not found
242460:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
257439:numactl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
266024:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
266073:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
266091:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
270892:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
271032:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
271092:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
283310:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
283990:pigz-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
286326:procps-static-aarch64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
311676:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
311817:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
311875:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
326671:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
328937:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
331357:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
334938:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
337466:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
341687:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
344235:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
353266:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
353592:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
353710:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
373419:squashfs-tools-ng-static-aarch64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
374261:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
374632:squashfuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
377817:libunwind-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
380119:keyutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
380327:keyutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
380780:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
383873:libomxil-bellagio-static-aarch64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
384505:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
384588:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
384629:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
385595:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
396887:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
396942:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
396960:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
401273:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
401619:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
401851:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
410637:libevent-static-aarch64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
418798:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
424481:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
424998:vim-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

166:./cron:                              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
170:./crontab:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
303:./filan:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
528:./linuxdeploy.no_strip:              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=0cb09c8cecdebf11ffcbb472525d94d86d6400b9, stripped
651:./netexec_dynamic:                   ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=9ebfef2954efdd37251584cede0b0210b9675c20, for GNU/Linux 3.7.0, stripped
751:./procan:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
754:./promtail:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=e999f13cace2c4766e1c5826f975b91fb226de82, for GNU/Linux 3.7.0, stripped
857:./rqbit:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
928:./socat:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
1089:./websocat:                          ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /system/bin/linker64, stripped


[-] Incorrect Arch --> # Not for aarch64

267:./elinks:                            ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
268:./elinks-lite:                       ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
458:./hypervisor-fw:                     Linux kernel ARM64 boot executable Image, little-endian
572:./METADATA.AIO.db:                   SQLite 3.x database, last written using SQLite version 3046000, file counter 6, database pages 1181, cookie 0x3, schema 4, UTF-8, version-valid-for 6
574:./METADATA.AIO.db.xz:                7-zip archive data, version 0.4
576:./METADATA.AIO.db.zstd:              Zstandard compressed data (v0.8+), Dictionary ID: None
579:./METADATA.AIO.json.xz:              7-zip archive data, version 0.4
581:./METADATA.AIO.json.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
584:./METADATA.AIO.min.json.xz:          7-zip archive data, version 0.4
586:./METADATA.AIO.min.json.zstd:        Zstandard compressed data (v0.8+), Dictionary ID: None
588:./METADATA.AIO.soar.capnp:           data
590:./METADATA.AIO.soar.capnp.xz:        7-zip archive data, version 0.4
592:./METADATA.AIO.soar.capnp.zstd:      Zstandard compressed data (v0.8+), Dictionary ID: None
596:./METADATA.AIO.toml.xz:              7-zip archive data, version 0.4
598:./METADATA.AIO.toml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
602:./METADATA.AIO.yaml.xz:              7-zip archive data, version 0.4
604:./METADATA.AIO.yaml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
870:./rust-hypervisor-firmware:          Linux kernel ARM64 boot executable Image, little-endian
881:./sadf:                              ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

951:cp: cannot stat './target//release/agrind': No such file or directory
3140:  No such file or directory (os error 2)
3141:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
3701:cp: cannot stat './aptly-bin': No such file or directory
3703:./aptly: cannot open `./aptly' (No such file or directory)
3704:du: cannot access './aptly': No such file or directory
3705:cp: cannot stat './aptly': No such file or directory
15637:Error: open /tmp/tmp.uHLRHZfHCC/temp.yaml: no such file or directory
15638:Error: open /tmp/tmp.uHLRHZfHCC/temp.yaml: no such file or directory
15639:Error: open /tmp/tmp.uHLRHZfHCC/temp.yaml: no such file or directory
15640:Error: open /tmp/tmp.uHLRHZfHCC/temp.yaml: no such file or directory
15641:Error: open /tmp/tmp.uHLRHZfHCC/temp.yaml: no such file or directory
15759:Error: open /tmp/tmp.6eaGNbrMIc/temp.yaml: no such file or directory
15760:Error: open /tmp/tmp.6eaGNbrMIc/temp.yaml: no such file or directory
15761:Error: open /tmp/tmp.6eaGNbrMIc/temp.yaml: no such file or directory
15762:Error: open /tmp/tmp.6eaGNbrMIc/temp.yaml: no such file or directory
15763:Error: open /tmp/tmp.6eaGNbrMIc/temp.yaml: no such file or directory
18162:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
26185:cp: cannot stat './certwatcher': No such file or directory
34793:cp: cannot stat './cloudfox': No such file or directory
34897:cp: cannot stat './cobalt': No such file or directory
34898:./cobalt: cannot open `./cobalt' (No such file or directory)
34899:du: cannot access './cobalt': No such file or directory
34900:cp: cannot stat './cobalt': No such file or directory
41037:cmp: .git/hooks/applypatch-msg: No such file or directory
41038:cmp: .git/hooks/commit-msg: No such file or directory
41039:cmp: .git/hooks/pre-applypatch: No such file or directory
41040:cmp: .git/hooks/pre-commit: No such file or directory
53043:cmp: .git/hooks/applypatch-msg: No such file or directory
53044:cmp: .git/hooks/commit-msg: No such file or directory
53045:cmp: .git/hooks/pre-applypatch: No such file or directory
53046:cmp: .git/hooks/pre-commit: No such file or directory
75752:dateutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
75755:dateutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
75758:dateutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
91042:cp: cannot stat './dblab': No such file or directory
91043:./dblab: cannot open `./dblab' (No such file or directory)
91044:du: cannot access './dblab': No such file or directory
91045:cp: cannot stat './dblab': No such file or directory
99187:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
105226:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/dizi': No such file or directory
106499:cp: cannot stat './dnspyre': No such file or directory
106501:./dnspyre: cannot open `./dnspyre' (No such file or directory)
106502:du: cannot access './dnspyre': No such file or directory
106503:cp: cannot stat './dnspyre': No such file or directory
106905:doas-static-aarch64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
110427:cp: cannot stat './eget': No such file or directory
110428:./eget: cannot open `./eget' (No such file or directory)
110429:du: cannot access './eget': No such file or directory
110430:cp: cannot stat './eget': No such file or directory
111636:cp: cannot stat './entropy': No such file or directory
111637:./entropy: cannot open `./entropy' (No such file or directory)
111638:du: cannot access './entropy': No such file or directory
111639:cp: cannot stat './entropy': No such file or directory
114132:exfatprogs-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
114704:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
127403:rsync: [sender] change_dir "/tmp/toolpacks/fFbH0cN_linux_aarch64/./result/bin" failed: No such file or directory (2)
127604:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
127987:rsync: [sender] change_dir "/tmp/toolpacks/zh7dhiZ_linux_aarch64/./result/bin" failed: No such file or directory (2)
130385:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/jlba49pqcd8gsfljvcmzky4jf6azdkk0-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
140912:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
140918:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
140923:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
142038:gcc-static-aarch64-unknown-linux-musl> /nix/store/yamaq80l2ahwd2qgzsawbcr0m8786kiy-stdenv-linux/setup: line 261: /nix/store/c782xli3smybhamvavyw6h2x5dqxbycr-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
142039:gcc-static-aarch64-unknown-linux-musl> /nix/store/yamaq80l2ahwd2qgzsawbcr0m8786kiy-stdenv-linux/setup: line 261: /nix/store/2vdkb8fm7x2yssvdwik1psajs9gnaihd-aarch64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
156825:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
157035:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
157038:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
157040:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
157041:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
157043:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
157916:cp: cannot stat './gfx': No such file or directory
171503:cp: cannot stat './go-audit': No such file or directory
171504:./go-audit: cannot open `./go-audit' (No such file or directory)
171505:du: cannot access './go-audit': No such file or directory
171506:cp: cannot stat './go-audit': No such file or directory
171741:cp: cannot stat './gocryptfs': No such file or directory
171742:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
171745:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
171746:du: cannot access './gocryptfs': No such file or directory
171747:cp: cannot stat './gocryptfs': No such file or directory
171748:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
171749:du: cannot access './gocryptfs-xray': No such file or directory
171750:cp: cannot stat './gocryptfs-xray': No such file or directory
174554:cp: cannot stat './gowitness': No such file or directory
174947:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/gpg-tui': No such file or directory
175206:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
175243:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
175283:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
175304:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
185064:cp: cannot stat './target/aarch64-unknown-linux-musl/release/horust': No such file or directory
189993:rm: cannot remove './rust-toolchain.toml': No such file or directory
197659:cp: cannot stat './ipinfo-bin': No such file or directory
197660:./ipinfo: cannot open `./ipinfo' (No such file or directory)
197661:du: cannot access './ipinfo': No such file or directory
197662:cp: cannot stat './ipinfo': No such file or directory
197663:cp: cannot stat '/tmp/toolpack_aarch64/ipinfo': No such file or directory
202774:iptables-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
205311:cp: cannot stat './target/aarch64-unknown-linux-musl/release/ironrdp-client': No such file or directory
205313:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
205314:du: cannot access './ironrdp-client': No such file or directory
205315:cp: cannot stat './ironrdp-client': No such file or directory
209622:cp: cannot stat './katana': No such file or directory
209623:./katana: cannot open `./katana' (No such file or directory)
209624:du: cannot access './katana': No such file or directory
209625:cp: cannot stat './katana': No such file or directory
210008:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
210010:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
210442:rm: cannot remove './rust-toolchain.toml': No such file or directory
210631:cp: cannot stat './ksubdomain': No such file or directory
210632:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
210633:du: cannot access './ksubdomain': No such file or directory
210634:cp: cannot stat './ksubdomain': No such file or directory
212310:cp: cannot stat './libaws': No such file or directory
212312:./libaws: cannot open `./libaws' (No such file or directory)
212313:du: cannot access './libaws': No such file or directory
212314:cp: cannot stat './libaws': No such file or directory
212315:cp: cannot stat './libaws': No such file or directory
227041:lsof-static-aarch64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
230985:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
230987:rsync: [sender] link_stat "/tmp/toolpacks/0N0NdMy_linux_aarch64/magick_appbundle.no_strip" failed: No such file or directory (2)
234716:cp: cannot stat './target/aarch64-unknown-linux-musl/release/mdcat': No such file or directory
235508:cp: cannot stat './mirrorbits': No such file or directory
235510:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
235511:du: cannot access './mirrorbits': No such file or directory
235512:cp: cannot stat './mirrorbits': No such file or directory
243219:rsync: [sender] change_dir "/tmp/toolpacks/U1xEfar_linux_aarch64/./result/bin" failed: No such file or directory (2)
243225:rsync: [sender] change_dir "/tmp/toolpacks/U1xEfar_linux_aarch64/./result/libexec/mtd-utils" failed: No such file or directory (2)
247517:sh: cd: line 5: can't cd to ./naabu/v2: No such file or directory
247520:cp: cannot stat './naabu-bin': No such file or directory
247521:./naabu: cannot open `./naabu' (No such file or directory)
247522:du: cannot access './naabu': No such file or directory
247523:cp: cannot stat './naabu': No such file or directory
247808:/tmp/RIVyG_build.sh: line 30: /download/ncdu-2.7-linux-aarch64.tar.gz: No such file or directory
253330:cp: cannot stat './nezha-dashboard': No such file or directory
253335:cp: cannot stat './nezha-agent': No such file or directory
253336:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
253337:du: cannot access './nezha-dashboard': No such file or directory
253338:cp: cannot stat './nezha-dashboard': No such file or directory
253339:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
253340:du: cannot access './nezha-agent': No such file or directory
253341:cp: cannot stat './nezha-agent': No such file or directory
253709:/tmp/toolpack_aarch64/ngrok: cannot open `/tmp/toolpack_aarch64/ngrok' (No such file or directory)
253710:du: cannot access '/tmp/toolpack_aarch64/ngrok': No such file or directory
254822:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
254823:du: cannot access './result/bin/ncat': No such file or directory
254825:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
254826:du: cannot access './result/bin/nmap': No such file or directory
254828:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
254829:du: cannot access './result/bin/nping': No such file or directory
254830:cp: cannot stat './result/bin/ncat': No such file or directory
254831:cp: cannot stat './result/bin/nmap': No such file or directory
254832:cp: cannot stat './result/bin/nping': No such file or directory
264601:find: ‘./bin’: No such file or directory
264602:find: ‘./bin’: No such file or directory
264603:find: ‘./bin’: No such file or directory
264605:rsync: [sender] change_dir "/tmp/toolpacks/mOfJsSH_linux_aarch64/static-cross-openssh/./bin" failed: No such file or directory (2)
264611:rsync: [sender] change_dir "/tmp/toolpacks/mOfJsSH_linux_aarch64/static-cross-openssh/./etc" failed: No such file or directory (2)
264617:rsync: [sender] change_dir "/tmp/toolpacks/mOfJsSH_linux_aarch64/static-cross-openssh/./libexec" failed: No such file or directory (2)
264623:rsync: [sender] change_dir "/tmp/toolpacks/mOfJsSH_linux_aarch64/static-cross-openssh/./sbin" failed: No such file or directory (2)
266781:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
266782:du: cannot access './result/bin/openvpn': No such file or directory
266783:cp: cannot stat './result/bin/openvpn': No such file or directory
268450:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
268451:du: cannot access '/build-bins/*': No such file or directory
274458:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
274463:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
274468:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
281575:/tmp/toolpack_aarch64/php: cannot open `/tmp/toolpack_aarch64/php' (No such file or directory)
281576:du: cannot access '/tmp/toolpack_aarch64/php': No such file or directory
281579:/tmp/toolpack_aarch64/php-fpm: cannot open `/tmp/toolpack_aarch64/php-fpm' (No such file or directory)
281580:du: cannot access '/tmp/toolpack_aarch64/php-fpm': No such file or directory
281583:/tmp/toolpack_aarch64/php-micro: cannot open `/tmp/toolpack_aarch64/php-micro' (No such file or directory)
281584:du: cannot access '/tmp/toolpack_aarch64/php-micro': No such file or directory
284640:cp: cannot stat './pktstat': No such file or directory
284642:./pktstat: cannot open `./pktstat' (No such file or directory)
284643:du: cannot access './pktstat': No such file or directory
284644:cp: cannot stat './pktstat': No such file or directory
304282:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
304286:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
304346:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
309582:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
309583:./pwait: cannot open `./pwait' (No such file or directory)
309584:du: cannot access './pwait': No such file or directory
309585:cp: cannot stat './pwait': No such file or directory
312147:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
312152:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
312157:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
318349:cp: cannot stat '': No such file or directory
318398:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
318649:cat: qemu.cid: No such file or directory
318651:cat: qemu.cid: No such file or directory
318653:rm: cannot remove './qemu.cid': No such file or directory
318656:./bin/*: cannot open `./bin/*' (No such file or directory)
318657:du: cannot access './bin/*': No such file or directory
318658:cp: cannot stat './bin/qemu-aarch64': No such file or directory
318659:cp: cannot stat './bin/qemu-aarch64_be': No such file or directory
318660:cp: cannot stat './bin/qemu-alpha': No such file or directory
318661:cp: cannot stat './bin/qemu-arm': No such file or directory
318662:cp: cannot stat './bin/qemu-armeb': No such file or directory
318663:cp: cannot stat './bin/qemu-cris': No such file or directory
318664:cp: cannot stat './bin/qemu-hexagon': No such file or directory
318665:cp: cannot stat './bin/qemu-hppa': No such file or directory
318666:cp: cannot stat './bin/qemu-i386': No such file or directory
318667:cp: cannot stat './bin/qemu-loongarch64': No such file or directory
318668:cp: cannot stat './bin/qemu-m68k': No such file or directory
318669:cp: cannot stat './bin/qemu-microblaze': No such file or directory
318670:cp: cannot stat './bin/qemu-microblazeel': No such file or directory
318671:cp: cannot stat './bin/qemu-mips': No such file or directory
318672:cp: cannot stat './bin/qemu-mips64': No such file or directory
318673:cp: cannot stat './bin/qemu-mips64el': No such file or directory
318674:cp: cannot stat './bin/qemu-mipsel': No such file or directory
318675:cp: cannot stat './bin/qemu-mipsn32': No such file or directory
318676:cp: cannot stat './bin/qemu-mipsn32el': No such file or directory
318677:cp: cannot stat './bin/qemu-nios2': No such file or directory
318678:cp: cannot stat './bin/qemu-or1k': No such file or directory
318679:cp: cannot stat './bin/qemu-ppc': No such file or directory
318680:cp: cannot stat './bin/qemu-ppc64': No such file or directory
318681:cp: cannot stat './bin/qemu-ppc64le': No such file or directory
318682:cp: cannot stat './bin/qemu-riscv32': No such file or directory
318683:cp: cannot stat './bin/qemu-riscv64': No such file or directory
318684:cp: cannot stat './bin/qemu-s390x': No such file or directory
318685:cp: cannot stat './bin/qemu-sh4': No such file or directory
318686:cp: cannot stat './bin/qemu-sh4eb': No such file or directory
318687:cp: cannot stat './bin/qemu-sparc': No such file or directory
318688:cp: cannot stat './bin/qemu-sparc32plus': No such file or directory
318689:cp: cannot stat './bin/qemu-sparc64': No such file or directory
318690:cp: cannot stat './bin/qemu-x86_64': No such file or directory
318691:cp: cannot stat './bin/qemu-xtensa': No such file or directory
318692:cp: cannot stat './bin/qemu-xtensaeb': No such file or directory
321146:chown: cannot access '/tmp/baseutils_aarch64/radare2/': No such file or directory
322654:cp: cannot stat './target/aarch64-unknown-linux-musl/release/golem': No such file or directory
322655:cp: cannot stat './target/aarch64-unknown-linux-musl/release/imix': No such file or directory
323003:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
323012:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
323013:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
324604:cp: cannot stat './rescope': No such file or directory
325145:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/ripgen': No such file or directory
326024:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
327390:find: ‘/tmp/toolpack_aarch64/ruri’: No such file or directory
347419:./samu: cannot open `./samu' (No such file or directory)
347420:du: cannot access './samu': No such file or directory
347421:cp: cannot stat './samu': No such file or directory
347422:cp: cannot stat './samu': No such file or directory
347597:./sbase-box: cannot open `./sbase-box' (No such file or directory)
347598:du: cannot access './sbase-box': No such file or directory
347599:cp: cannot stat './sbase-box': No such file or directory
347600:cp: cannot stat './sbase-box': No such file or directory
347601:cp: cannot stat './sbase': No such file or directory
347602:cp: cannot stat './sbase': No such file or directory
347712:find: ‘./target/aarch64-unknown-linux-musl/release’: No such file or directory
347715:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
347716:du: cannot access '/build-bins/*': No such file or directory
352771:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
358642:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
358644:./smenu: cannot open `./smenu' (No such file or directory)
358645:du: cannot access './smenu': No such file or directory
358646:cp: cannot stat './smenu': No such file or directory
370588:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
370593:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
370598:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
372078:cp: cannot stat './spoof-dpi': No such file or directory
373975:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
377308:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
380078:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/jlba49pqcd8gsfljvcmzky4jf6azdkk0-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
380118:keyutils-static-aarch64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
384113:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
385341:musl-obstack-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
387545:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
387546:du: cannot access './result/bin/stress-ng': No such file or directory
387547:cp: cannot stat './result/bin/stress-ng': No such file or directory
391521:find: ‘/usr/src/linux-headers-6.1.0-25-arm64’: No such file or directory
391530:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
393337:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/taplo': No such file or directory
400730:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
409169:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
409177:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
409186:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/chq6p3r5v09g6gi882i9jl328c5z0lg2-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
413398:  = note: No such file or directory (os error 2)
413550:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tracexec': No such file or directory
413552:./tracexec: cannot open `./tracexec' (No such file or directory)
413553:du: cannot access './tracexec': No such file or directory
413554:cp: cannot stat './tracexec': No such file or directory
415076:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tun2proxy': No such file or directory
415078:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
415079:du: cannot access './tun2proxy': No such file or directory
415080:cp: cannot stat './tun2proxy': No such file or directory
416066:cp: cannot stat './ubase': No such file or directory
416067:cp: cannot stat './ubase': No such file or directory
426539:sed: can't read ./Cargo.toml: No such file or directory
426544:cp: cannot stat './target/aarch64-unknown-linux-musl/release/vproxy': No such file or directory
429914:cp: cannot stat './target/aarch64-unknown-linux-musl/release/wezterm-gui': No such file or directory
429924:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
429925:du: cannot access './wezterm-gui': No such file or directory
429926:cp: cannot stat './wezterm-gui': No such file or directory
451259:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451260:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451261:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451262:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451263:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451264:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451265:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451266:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451267:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451268:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451269:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451270:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451271:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451272:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
491569:cp: cannot stat './target/aarch64-unknown-linux-musl/release/xplr': No such file or directory
492687:cp: cannot stat './yggdrasil': No such file or directory
492688:cp: cannot stat './yggdrasilctl': No such file or directory
492691:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
492692:du: cannot access './yggdrasil': No such file or directory
492693:cp: cannot stat './yggdrasil': No such file or directory
492694:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
492695:du: cannot access './yggdrasilctl': No such file or directory
492696:cp: cannot stat './yggdrasilctl': No such file or directory
493562:static-1  | Error loading shared library ld-musl-aarch64-99c589a2.so.1: No such file or directory (needed by /root/.local/share/pipx/venvs/pyinstaller/lib/python3.11/site-packages/curl_cffi.libs/libcurl-impersonate-chrome-6202098e.so.4.8.0)
499759:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/z1zhkib43rqxfnh6spkwyh6l06jhdq2n-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
499771:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/z1zhkib43rqxfnh6spkwyh6l06jhdq2n-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

