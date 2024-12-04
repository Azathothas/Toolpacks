```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

26135-
26136- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-11-25 (11:52:58 PM) UTC]
26137-
26138-remote: Support for password authentication was removed on August 13, 2021.
26139-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
26140:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
26141-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
26142-cp: cannot stat './certwatcher': No such file or directory
26143-
--
160522-go: downloading github.com/gobwas/glob v0.2.3
160523-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
160524-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
160525-	remote: Support for password authentication was removed on August 13, 2021.
160526-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
160527:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
160528-cp: cannot stat './gfx': No such file or directory
160529-
160530-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):04(Sec)
--
426428-
426429- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-11-26 (07:21:51 PM) UTC]
426430-
426431-remote: Support for password authentication was removed on August 13, 2021.
426432-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
426433:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
426434-info: component 'rust-std' for target 'aarch64-unknown-linux-musl' is up to date
426435-sed: can't read ./Cargo.toml: No such file or directory
426436-error: failed to parse manifest at `/tmp/toolpacks/bDao2qs_linux_aarch64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

215821-
215822-
215823-
215824- [+] (Building | Fetching) linutil :: https://github.com/ChrisTitusTech/linutil [Tuesday, 2024-11-26 (09:43:45 AM) UTC]
215825-
215826:asset `aarch64` not found
--
334853-
334854-
334855-
334856- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-11-26 (03:26:47 PM) UTC]
334857-
334858:asset `ruri` not found
--
355053-
355054-
355055-
355056- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-11-26 (03:55:55 PM) UTC]
355057-
355058:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):43(Sec)


[-] command not found --> # Something failed to Install

63590:cpufetch-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: git: command not found
68626:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
69134:vim-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: hostname: command not found
71137:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
72008:cryptsetup-static-aarch64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
95307:libXau-static-aarch64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
95386:libXdmcp-static-aarch64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
95840:libICE-static-aarch64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
96109:libapparmor-static-aarch64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
96561:libSM-static-aarch64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
96763:libxcb-static-aarch64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
100397:dbus-static-aarch64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
102222:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
102449:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
102645:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
108136:ck-static-aarch64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
108624:ldns-static-aarch64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
108626:ldns-static-aarch64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
117601:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
130496:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
132434:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
134649:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
138618:mpfr-static-aarch64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
141594:libmpc-static-aarch64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
145561:source-highlight-static-aarch64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
200003:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
200046:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
200329:iperf-static-aarch64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
201492:libmnl-static-aarch64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
201669:libnfnetlink-static-aarch64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
202361:libnftnl-static-aarch64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
202606:libnetfilter_conntrack-static-aarch64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
203345:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
203394:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
203412:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
205373:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
205404:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
205451:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
213027:kmod-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
235653:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
235706:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
235724:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
236257:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
236258:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
236259:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: git: command not found
236382:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
236383:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
236384:masscan-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: git: command not found
245216:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
260131:numactl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
268652:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
268708:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
268726:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
273401:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
273549:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
273610:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
285684:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
286376:pigz-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: which: command not found
288752:procps-static-aarch64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
314076:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
314217:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
314278:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
334110:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
336406:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
338826:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
342407:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
344935:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
349156:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
351704:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
360533:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
360816:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
360967:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
373596:squashfs-tools-ng-static-aarch64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
374438:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
374809:squashfuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
377993:libunwind-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
380298:keyutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
380534:keyutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
380919:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
383945:libomxil-bellagio-static-aarch64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
384557:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
384675:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
384702:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
385493:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
396814:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
396866:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
396885:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
401251:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
401562:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
401783:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
410580:libevent-static-aarch64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
418696:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
424377:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
424907:vim-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

166:./cron:                              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
170:./crontab:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
303:./filan:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
527:./linuxdeploy.no_strip:              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=0cb09c8cecdebf11ffcbb472525d94d86d6400b9, stripped
650:./netexec_dynamic:                   ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=96cd4340140dd6191e2262b89ec10aaa90765c38, for GNU/Linux 3.7.0, stripped
750:./procan:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
753:./promtail:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=e999f13cace2c4766e1c5826f975b91fb226de82, for GNU/Linux 3.7.0, stripped
856:./rqbit:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
927:./socat:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
1088:./websocat:                          ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /system/bin/linker64, stripped


[-] Incorrect Arch --> # Not for aarch64

267:./elinks:                            ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
268:./elinks-lite:                       ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
457:./hypervisor-fw:                     Linux kernel ARM64 boot executable Image, little-endian
571:./METADATA.AIO.db:                   SQLite 3.x database, last written using SQLite version 3046000, file counter 6, database pages 1182, cookie 0x3, schema 4, UTF-8, version-valid-for 6
573:./METADATA.AIO.db.xz:                7-zip archive data, version 0.4
575:./METADATA.AIO.db.zstd:              Zstandard compressed data (v0.8+), Dictionary ID: None
578:./METADATA.AIO.json.xz:              7-zip archive data, version 0.4
580:./METADATA.AIO.json.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
583:./METADATA.AIO.min.json.xz:          7-zip archive data, version 0.4
585:./METADATA.AIO.min.json.zstd:        Zstandard compressed data (v0.8+), Dictionary ID: None
587:./METADATA.AIO.soar.capnp:           data
589:./METADATA.AIO.soar.capnp.xz:        7-zip archive data, version 0.4
591:./METADATA.AIO.soar.capnp.zstd:      Zstandard compressed data (v0.8+), Dictionary ID: None
595:./METADATA.AIO.toml.xz:              7-zip archive data, version 0.4
597:./METADATA.AIO.toml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
601:./METADATA.AIO.yaml.xz:              7-zip archive data, version 0.4
603:./METADATA.AIO.yaml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
869:./rust-hypervisor-firmware:          Linux kernel ARM64 boot executable Image, little-endian
880:./sadf:                              ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

932:cp: cannot stat './target//release/agrind': No such file or directory
3113:  No such file or directory (os error 2)
3114:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
3674:cp: cannot stat './aptly-bin': No such file or directory
3676:./aptly: cannot open `./aptly' (No such file or directory)
3677:du: cannot access './aptly': No such file or directory
3678:cp: cannot stat './aptly': No such file or directory
15615:Error: open /tmp/tmp.JTSLOY5DTG/temp.yaml: no such file or directory
15616:Error: open /tmp/tmp.JTSLOY5DTG/temp.yaml: no such file or directory
15617:Error: open /tmp/tmp.JTSLOY5DTG/temp.yaml: no such file or directory
15618:Error: open /tmp/tmp.JTSLOY5DTG/temp.yaml: no such file or directory
15619:Error: open /tmp/tmp.JTSLOY5DTG/temp.yaml: no such file or directory
15737:Error: open /tmp/tmp.knemiIKtkM/temp.yaml: no such file or directory
15738:Error: open /tmp/tmp.knemiIKtkM/temp.yaml: no such file or directory
15739:Error: open /tmp/tmp.knemiIKtkM/temp.yaml: no such file or directory
15740:Error: open /tmp/tmp.knemiIKtkM/temp.yaml: no such file or directory
15741:Error: open /tmp/tmp.knemiIKtkM/temp.yaml: no such file or directory
18140:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
26142:cp: cannot stat './certwatcher': No such file or directory
35481:cp: cannot stat './cloudfox': No such file or directory
35591:cp: cannot stat './cobalt': No such file or directory
35592:./cobalt: cannot open `./cobalt' (No such file or directory)
35593:du: cannot access './cobalt': No such file or directory
35594:cp: cannot stat './cobalt': No such file or directory
41735:cmp: .git/hooks/applypatch-msg: No such file or directory
41736:cmp: .git/hooks/commit-msg: No such file or directory
41737:cmp: .git/hooks/pre-applypatch: No such file or directory
41738:cmp: .git/hooks/pre-commit: No such file or directory
53737:cmp: .git/hooks/applypatch-msg: No such file or directory
53738:cmp: .git/hooks/commit-msg: No such file or directory
53739:cmp: .git/hooks/pre-applypatch: No such file or directory
53740:cmp: .git/hooks/pre-commit: No such file or directory
76370:dateutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
76373:dateutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
76376:dateutils-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
93643:cp: cannot stat './dblab': No such file or directory
93644:./dblab: cannot open `./dblab' (No such file or directory)
93645:du: cannot access './dblab': No such file or directory
93646:cp: cannot stat './dblab': No such file or directory
101812:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
107832:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/dizi': No such file or directory
109105:cp: cannot stat './dnspyre': No such file or directory
109107:./dnspyre: cannot open `./dnspyre' (No such file or directory)
109108:du: cannot access './dnspyre': No such file or directory
109109:cp: cannot stat './dnspyre': No such file or directory
109511:doas-static-aarch64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
113024:cp: cannot stat './eget': No such file or directory
113025:./eget: cannot open `./eget' (No such file or directory)
113026:du: cannot access './eget': No such file or directory
113027:cp: cannot stat './eget': No such file or directory
114233:cp: cannot stat './entropy': No such file or directory
114234:./entropy: cannot open `./entropy' (No such file or directory)
114235:du: cannot access './entropy': No such file or directory
114236:cp: cannot stat './entropy': No such file or directory
116743:exfatprogs-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
117315:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
130009:rsync: [sender] change_dir "/tmp/toolpacks/HbGvXJL_linux_aarch64/./result/bin" failed: No such file or directory (2)
130210:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
130593:rsync: [sender] change_dir "/tmp/toolpacks/eyTAnZC_linux_aarch64/./result/bin" failed: No such file or directory (2)
133037:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iwwl2rn7kpfcz66y05lirbqw8v72dqfr-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
143591:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
143602:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
143607:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
144649:gcc-static-aarch64-unknown-linux-musl> /nix/store/a9if7xy7jifk1ajhnfjy66png8jni32s-stdenv-linux/setup: line 261: /nix/store/c782xli3smybhamvavyw6h2x5dqxbycr-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
144650:gcc-static-aarch64-unknown-linux-musl> /nix/store/a9if7xy7jifk1ajhnfjy66png8jni32s-stdenv-linux/setup: line 261: /nix/store/hwg9fjnjikh21i509mqa02f8qzfclcqi-aarch64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
159435:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159647:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159649:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159650:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159651:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159653:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160528:cp: cannot stat './gfx': No such file or directory
174090:cp: cannot stat './go-audit': No such file or directory
174091:./go-audit: cannot open `./go-audit' (No such file or directory)
174092:du: cannot access './go-audit': No such file or directory
174093:cp: cannot stat './go-audit': No such file or directory
174328:cp: cannot stat './gocryptfs': No such file or directory
174329:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
174332:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
174333:du: cannot access './gocryptfs': No such file or directory
174334:cp: cannot stat './gocryptfs': No such file or directory
174335:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
174336:du: cannot access './gocryptfs-xray': No such file or directory
174337:cp: cannot stat './gocryptfs-xray': No such file or directory
177558:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/gpg-tui': No such file or directory
177817:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
177856:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
177890:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
177915:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
187677:cp: cannot stat './target/aarch64-unknown-linux-musl/release/horust': No such file or directory
192737:rm: cannot remove './rust-toolchain.toml': No such file or directory
200402:cp: cannot stat './ipinfo-bin': No such file or directory
200403:./ipinfo: cannot open `./ipinfo' (No such file or directory)
200404:du: cannot access './ipinfo': No such file or directory
200405:cp: cannot stat './ipinfo': No such file or directory
200406:cp: cannot stat '/tmp/toolpack_aarch64/ipinfo': No such file or directory
205515:iptables-static-aarch64-unknown-linux-musl> /nix/store/4vvkmiq95x6zzz82lcsbq8607x5v7aws-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
208056:cp: cannot stat './target/aarch64-unknown-linux-musl/release/ironrdp-client': No such file or directory
208058:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
208059:du: cannot access './ironrdp-client': No such file or directory
208060:cp: cannot stat './ironrdp-client': No such file or directory
212367:cp: cannot stat './katana': No such file or directory
212368:./katana: cannot open `./katana' (No such file or directory)
212369:du: cannot access './katana': No such file or directory
212370:cp: cannot stat './katana': No such file or directory
212750:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
212752:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
213184:rm: cannot remove './rust-toolchain.toml': No such file or directory
213376:cp: cannot stat './ksubdomain': No such file or directory
213377:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
213378:du: cannot access './ksubdomain': No such file or directory
213379:cp: cannot stat './ksubdomain': No such file or directory
215054:cp: cannot stat './libaws': No such file or directory
215056:./libaws: cannot open `./libaws' (No such file or directory)
215057:du: cannot access './libaws': No such file or directory
215058:cp: cannot stat './libaws': No such file or directory
215059:cp: cannot stat './libaws': No such file or directory
229775:lsof-static-aarch64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
233725:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
233727:rsync: [sender] link_stat "/tmp/toolpacks/CXxcDct_linux_aarch64/magick_appbundle.no_strip" failed: No such file or directory (2)
237459:cp: cannot stat './target/aarch64-unknown-linux-musl/release/mdcat': No such file or directory
238264:cp: cannot stat './mirrorbits': No such file or directory
238266:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
238267:du: cannot access './mirrorbits': No such file or directory
238268:cp: cannot stat './mirrorbits': No such file or directory
245974:rsync: [sender] change_dir "/tmp/toolpacks/uz8p45V_linux_aarch64/./result/bin" failed: No such file or directory (2)
245980:rsync: [sender] change_dir "/tmp/toolpacks/uz8p45V_linux_aarch64/./result/libexec/mtd-utils" failed: No such file or directory (2)
250274:cp: cannot stat './naabu-bin': No such file or directory
250275:./naabu: cannot open `./naabu' (No such file or directory)
250276:du: cannot access './naabu': No such file or directory
250277:cp: cannot stat './naabu': No such file or directory
250562:/tmp/gXFWI_build.sh: line 30: /download/ncdu-2.7-linux-aarch64.tar.gz: No such file or directory
256065:cp: cannot stat './nezha-dashboard': No such file or directory
256070:cp: cannot stat './nezha-agent': No such file or directory
256071:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
256072:du: cannot access './nezha-dashboard': No such file or directory
256073:cp: cannot stat './nezha-dashboard': No such file or directory
256074:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
256075:du: cannot access './nezha-agent': No such file or directory
256076:cp: cannot stat './nezha-agent': No such file or directory
256442:/tmp/toolpack_aarch64/ngrok: cannot open `/tmp/toolpack_aarch64/ngrok' (No such file or directory)
256443:du: cannot access '/tmp/toolpack_aarch64/ngrok': No such file or directory
257554:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
257555:du: cannot access './result/bin/ncat': No such file or directory
257557:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
257558:du: cannot access './result/bin/nmap': No such file or directory
257560:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
257561:du: cannot access './result/bin/nping': No such file or directory
257562:cp: cannot stat './result/bin/ncat': No such file or directory
257563:cp: cannot stat './result/bin/nmap': No such file or directory
257564:cp: cannot stat './result/bin/nping': No such file or directory
258459:rsync: [sender] link_stat "/tmp/tmp.bqcd7pDdLu/a-utils/cmd/noroot-do/noroot-do" failed: No such file or directory (2)
258464:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
258465:du: cannot access '/build-bins/*': No such file or directory
267236:find: ‘./bin’: No such file or directory
267237:find: ‘./bin’: No such file or directory
267238:find: ‘./bin’: No such file or directory
267240:rsync: [sender] change_dir "/tmp/toolpacks/N2d0oma_linux_aarch64/static-cross-openssh/./bin" failed: No such file or directory (2)
267246:rsync: [sender] change_dir "/tmp/toolpacks/N2d0oma_linux_aarch64/static-cross-openssh/./etc" failed: No such file or directory (2)
267252:rsync: [sender] change_dir "/tmp/toolpacks/N2d0oma_linux_aarch64/static-cross-openssh/./libexec" failed: No such file or directory (2)
267258:rsync: [sender] change_dir "/tmp/toolpacks/N2d0oma_linux_aarch64/static-cross-openssh/./sbin" failed: No such file or directory (2)
269416:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
269417:du: cannot access './result/bin/openvpn': No such file or directory
269418:cp: cannot stat './result/bin/openvpn': No such file or directory
276953:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
276958:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
276963:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
284079:/tmp/toolpack_aarch64/php: cannot open `/tmp/toolpack_aarch64/php' (No such file or directory)
284080:du: cannot access '/tmp/toolpack_aarch64/php': No such file or directory
284083:/tmp/toolpack_aarch64/php-fpm: cannot open `/tmp/toolpack_aarch64/php-fpm' (No such file or directory)
284084:du: cannot access '/tmp/toolpack_aarch64/php-fpm': No such file or directory
284087:/tmp/toolpack_aarch64/php-micro: cannot open `/tmp/toolpack_aarch64/php-micro' (No such file or directory)
284088:du: cannot access '/tmp/toolpack_aarch64/php-micro': No such file or directory
287026:cp: cannot stat './pktstat': No such file or directory
287028:./pktstat: cannot open `./pktstat' (No such file or directory)
287029:du: cannot access './pktstat': No such file or directory
287030:cp: cannot stat './pktstat': No such file or directory
306686:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
306690:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
306750:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
311979:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
311980:./pwait: cannot open `./pwait' (No such file or directory)
311981:du: cannot access './pwait': No such file or directory
311982:cp: cannot stat './pwait': No such file or directory
314541:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
314546:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
314551:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
320742:cp: cannot stat '': No such file or directory
320791:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
325942:cp: cannot stat './bin/qemu-cris': No such file or directory
325943:cp: cannot stat './bin/qemu-nios2': No such file or directory
330077:cp: cannot stat './target/aarch64-unknown-linux-musl/release/golem': No such file or directory
330078:cp: cannot stat './target/aarch64-unknown-linux-musl/release/imix': No such file or directory
330419:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
330475:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
330476:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
332036:cp: cannot stat './rescope': No such file or directory
333463:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
334861:find: ‘/tmp/toolpack_aarch64/ruri’: No such file or directory
354888:./samu: cannot open `./samu' (No such file or directory)
354889:du: cannot access './samu': No such file or directory
354890:cp: cannot stat './samu': No such file or directory
354891:cp: cannot stat './samu': No such file or directory
355042:./sbase-box: cannot open `./sbase-box' (No such file or directory)
355043:du: cannot access './sbase-box': No such file or directory
355044:cp: cannot stat './sbase-box': No such file or directory
355045:cp: cannot stat './sbase-box': No such file or directory
355046:cp: cannot stat './sbase': No such file or directory
355047:cp: cannot stat './sbase': No such file or directory
360035:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
365898:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
365900:./smenu: cannot open `./smenu' (No such file or directory)
365901:du: cannot access './smenu': No such file or directory
365902:cp: cannot stat './smenu': No such file or directory
370762:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
370767:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
370772:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
372255:cp: cannot stat './spoof-dpi': No such file or directory
374152:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
377484:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
380255:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iwwl2rn7kpfcz66y05lirbqw8v72dqfr-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
380297:keyutils-static-aarch64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
384062:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
385291:musl-obstack-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
387431:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
387432:du: cannot access './result/bin/stress-ng': No such file or directory
387433:cp: cannot stat './result/bin/stress-ng': No such file or directory
391440:find: ‘/usr/src/linux-headers-6.1.0-25-arm64’: No such file or directory
391449:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
392256:cp: cannot stat './target/aarch64-unknown-linux-musl/release/system_info_collector': No such file or directory
392257:cp: cannot stat './target/aarch64-unknown-linux-musl/release/system_info_collector': No such file or directory
393277:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/taplo': No such file or directory
400675:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
408492:readline-static-aarch64-unknown-linux-musl> /nix/store/g5manmr2a4jc9m06cf2lpnx1092wvvjh-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
408508:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
408524:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/jagmqnd1mnawsy80nvn10lgfjqla2gzd-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
413337:  = note: No such file or directory (os error 2)
413491:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tracexec': No such file or directory
413493:./tracexec: cannot open `./tracexec' (No such file or directory)
413494:du: cannot access './tracexec': No such file or directory
413495:cp: cannot stat './tracexec': No such file or directory
414987:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tun2proxy': No such file or directory
414989:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
414990:du: cannot access './tun2proxy': No such file or directory
414991:cp: cannot stat './tun2proxy': No such file or directory
415956:cp: cannot stat './ubase': No such file or directory
415957:cp: cannot stat './ubase': No such file or directory
426435:sed: can't read ./Cargo.toml: No such file or directory
426440:cp: cannot stat './target/aarch64-unknown-linux-musl/release/vproxy': No such file or directory
429765:cp: cannot stat './target/aarch64-unknown-linux-musl/release/wezterm-gui': No such file or directory
429775:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
429776:du: cannot access './wezterm-gui': No such file or directory
429777:cp: cannot stat './wezterm-gui': No such file or directory
451102:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451103:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451104:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451105:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451106:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451107:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451108:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451109:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451110:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451111:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451112:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451113:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
451114:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
451115:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
491028:cp: cannot stat './target/aarch64-unknown-linux-musl/release/xplr': No such file or directory
492113:cp: cannot stat './yggdrasil': No such file or directory
492114:cp: cannot stat './yggdrasilctl': No such file or directory
492117:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
492118:du: cannot access './yggdrasil': No such file or directory
492119:cp: cannot stat './yggdrasil': No such file or directory
492120:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
492121:du: cannot access './yggdrasilctl': No such file or directory
492122:cp: cannot stat './yggdrasilctl': No such file or directory
492988:static-1  | Error loading shared library ld-musl-aarch64-99c589a2.so.1: No such file or directory (needed by /root/.local/share/pipx/venvs/pyinstaller/lib/python3.11/site-packages/curl_cffi.libs/libcurl-impersonate-chrome-6202098e.so.4.8.0)
499185:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/z1zhkib43rqxfnh6spkwyh6l06jhdq2n-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
499197:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/z1zhkib43rqxfnh6spkwyh6l06jhdq2n-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

