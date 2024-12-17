```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

30044-
30045- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-12-09 (09:38:30 PM) UTC]
30046-
30047-remote: Support for password authentication was removed on August 13, 2021.
30048-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
30049:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
30050-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
30051-cp: cannot stat './certwatcher': No such file or directory
30052-
--
154770-go: downloading github.com/sourcegraph/conc v0.2.0
154771-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
154772-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
154773-	remote: Support for password authentication was removed on August 13, 2021.
154774-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
154775:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
154776-cp: cannot stat './gfx': No such file or directory
154777-
154778-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):03(Sec)
--
415347-
415348- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-12-10 (08:58:39 AM) UTC]
415349-
415350-remote: Support for password authentication was removed on August 13, 2021.
415351-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
415352:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
415353-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
415354-sed: can't read ./Cargo.toml: No such file or directory
415355-error: failed to parse manifest at `/tmp/toolpacks/YTiRp3S_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

109450-
109451-
109452-
109453- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-12-09 (11:33:18 PM) UTC]
109454-
109455:asset `x86_64-bin.tar.xz` not found
109456:asset `x86_64-bin.tar.xz` not found
--
124893-
124894-
124895-
124896- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-12-10 (12:11:50 AM) UTC]
124897-
124898:asset `arm` not found
124899:asset `arm` not found
--
229823-
229824-
229825-
229826- [+] (Building | Fetching) mdcat :: https://github.com/swsnr/mdcat [Tuesday, 2024-12-10 (03:19:51 AM) UTC]
229827-
229828:asset `x86_64-unknown-linux-musl` not found
--
326452-
326453-
326454-
326455- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-12-10 (06:22:31 AM) UTC]
326456-
326457:asset `ruri` not found
--
346524-
346525-
346526-
346527- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-12-10 (06:37:36 AM) UTC]
346528-
346529:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):29(Sec)


[-] command not found --> # Something failed to Install

65459:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: git: command not found
70504:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
71015:vim-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: hostname: command not found
73027:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
73903:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
96934:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
97016:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
97512:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
97832:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
98222:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
98441:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
102072:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
104178:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
104658:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
104660:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
113290:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
124135:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
126054:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
128403:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
133581:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
136222:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
139121:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
194563:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
194606:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
194892:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
195689:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
195860:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
196907:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
197166:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
197969:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
198023:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
198041:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
199980:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
200010:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
200056:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
207431:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
227999:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228048:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228066:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228603:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
228604:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
228605:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: git: command not found
228728:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
228729:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
228730:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: git: command not found
237324:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
252008:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
260383:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
260432:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
260450:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
264958:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
265020:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
277251:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
277930:pigz-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
280292:procps-static-x86_64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
305342:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
305401:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
325730:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
327755:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
330182:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
333770:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
336307:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
340537:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
343093:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
367164:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
368019:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
368393:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
371602:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
373764:keyutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
373905:keyutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
374732:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
376529:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
376646:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
377244:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
377586:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
380017:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
381673:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
381717:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
381756:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
381801:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
381852:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
381912:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
391155:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
391204:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
391223:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
399602:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
400854:bash: line 18: staticx: command not found
400866:bash: line 22: staticx: command not found
400867:bash: line 23: staticx: command not found
400868:bash: line 24: staticx: command not found
400869:bash: line 25: staticx: command not found
407592:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
413284:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
413789:vim-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: hostname: command not found
485238:pcre-static-x86_64-unknown-linux-musl> /build/pcre-8.45/libtool: line 1861: ldconfig: command not found


[-] Dynamically Linked --> # Not Statically Linked

68:./bed:                               ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=ZvrO9t6lXppTO_qt5ijM/BJX0gvF_VuQG8wqDpIBC/X4XRGR_J-ZrbL9bLF_O3/UAKnTebEwUdrLjpw3I7d, stripped
75:./binfetch:                          ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
666:./netexec_dynamic:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=8485f6953c06d12b9865185ba3466fdbf9b4a65c, for GNU/Linux 2.6.32, stripped
737:./pathbuster:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
777:./promtail:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=e4f40943216c9829e415503f868ecec92b296b1c, for GNU/Linux 3.2.0, stripped
884:./rqbit:                             ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
1152:./woofwoof:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=30e06184968532b6a9aa36f44ada39e4af0bda56, for GNU/Linux 2.6.32, stripped


[-] Incorrect Arch --> # Not for x86_64

404:./gost:                              ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
589:./METADATA.AIO.db:                   SQLite 3.x database, last written using SQLite version 3046000, file counter 6, database pages 1231, cookie 0x3, schema 4, UTF-8, version-valid-for 6
591:./METADATA.AIO.db.xz:                7-zip archive data, version 0.4
593:./METADATA.AIO.db.zstd:              Zstandard compressed data (v0.8+), Dictionary ID: None
596:./METADATA.AIO.json.xz:              7-zip archive data, version 0.4
598:./METADATA.AIO.json.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
601:./METADATA.AIO.min.json.xz:          7-zip archive data, version 0.4
603:./METADATA.AIO.min.json.zstd:        Zstandard compressed data (v0.8+), Dictionary ID: None
605:./METADATA.AIO.soar.capnp:           data
607:./METADATA.AIO.soar.capnp.xz:        7-zip archive data, version 0.4
609:./METADATA.AIO.soar.capnp.zstd:      Zstandard compressed data (v0.8+), Dictionary ID: None
613:./METADATA.AIO.toml.xz:              7-zip archive data, version 0.4
615:./METADATA.AIO.toml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
619:./METADATA.AIO.yaml.xz:              7-zip archive data, version 0.4
621:./METADATA.AIO.yaml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
872:./rippkgs-index.sqlite:              SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2


[-] No such file or directory # Usually Because Build Failures

3892:cp: cannot stat './aptly-bin': No such file or directory
3894:./aptly: cannot open `./aptly' (No such file or directory)
3895:du: cannot access './aptly': No such file or directory
3896:cp: cannot stat './aptly': No such file or directory
15204:binutils-static-x86_64-unknown-linux-musl> checking for inline... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
15205:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
15226:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
15230:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/27zwn8wxxdwlzgrn5qy423w7cfj8nwa7-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
15251:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
16537:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
16875:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
17055:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
30051:cp: cannot stat './certwatcher': No such file or directory
37427:cp: cannot stat './cobalt': No such file or directory
37428:./cobalt: cannot open `./cobalt' (No such file or directory)
37429:du: cannot access './cobalt': No such file or directory
37430:cp: cannot stat './cobalt': No such file or directory
43404:cmp: .git/hooks/applypatch-msg: No such file or directory
43405:cmp: .git/hooks/commit-msg: No such file or directory
43406:cmp: .git/hooks/pre-applypatch: No such file or directory
43407:cmp: .git/hooks/pre-commit: No such file or directory
55349:cmp: .git/hooks/applypatch-msg: No such file or directory
55350:cmp: .git/hooks/commit-msg: No such file or directory
55351:cmp: .git/hooks/pre-applypatch: No such file or directory
55352:cmp: .git/hooks/pre-commit: No such file or directory
78345:dateutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
78347:dateutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
78349:dateutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
95289:cp: cannot stat './dblab': No such file or directory
95290:./dblab: cannot open `./dblab' (No such file or directory)
95291:du: cannot access './dblab': No such file or directory
95292:cp: cannot stat './dblab': No such file or directory
105142:cp: cannot stat './dnspyre': No such file or directory
105144:./dnspyre: cannot open `./dnspyre' (No such file or directory)
105145:du: cannot access './dnspyre': No such file or directory
105146:cp: cannot stat './dnspyre': No such file or directory
105556:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
109119:cp: cannot stat './eget': No such file or directory
109120:./eget: cannot open `./eget' (No such file or directory)
109121:du: cannot access './eget': No such file or directory
109122:cp: cannot stat './eget': No such file or directory
112427:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
113001:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
123649:rsync: [sender] change_dir "/tmp/toolpacks/FG4ANHP_linux_x86_64/./result/bin" failed: No such file or directory (2)
123846:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
124232:rsync: [sender] change_dir "/tmp/toolpacks/TS7ckWD_linux_x86_64/./result/bin" failed: No such file or directory (2)
126697:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/r183v8ry613pi415njf0c5012fgm4j7d-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
129137:binutils-static-x86_64-unknown-linux-musl> checking for x86_64-unknown-linux-musl-ranlib... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
129139:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
129175:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
129183:binutils-static-x86_64-unknown-linux-musl> checking for CFLocaleCopyPreferredLanguages... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
129199:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
132828:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
135171:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
135541:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
137264:readline-static-x86_64-unknown-linux-musl> /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
137269:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
137274:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
138447:gcc-static-x86_64-unknown-linux-musl> /nix/store/2hkzf0w9w6x02vmd0lgkh9x40bc2ia9v-stdenv-linux/setup: line 261: /nix/store/x9as7x6f7cdgcskvvn3yp02m662krr7y-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
138448:gcc-static-x86_64-unknown-linux-musl> /nix/store/2hkzf0w9w6x02vmd0lgkh9x40bc2ia9v-stdenv-linux/setup: line 261: /nix/store/f2q2m6kksxngkb5h535l5a2n51cx01wc-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
139919:gcc-static-x86_64-unknown-linux-musl> checking for working alloca.h... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
142708:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
142898:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
145072:gcc-static-x86_64-unknown-linux-musl> checking for sys/stat.h... /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
145073:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
145156:gcc-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc -O2 -I/nix/store/nff0srdaidn13gm3pjl8ffs0kd2b44x1-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -B/nix/store/3fqz01f51aq3i37vhbijvfxrg8p5lczr-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ -idirafter /nix/store/nff0srdaidn13gm3pjl8ffs0kd2b44x1-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -idirafter /nix/store/43nzi56ran5b9vl5hc3d967wdbq06z38-x86_64-unknown-linux-musl-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-musl/13.3.0/include-fixed -isystem /nix/store/0y91j6n2nxpxd8p8rqgy605nzpfa7wgh-fortify-headers-1.1alpine3/include -Wl,-rpath,/nix/store/wflkc5r6bn101yk7674gs38q0glklv7b-gcc-static-x86_64-unknown-linux-musl-13.3.0-lib/lib -Wl,-L/nix/store/3fqz01f51aq3i37vhbijvfxrg8p5lczr-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-rpath -Wl,/nix/store/3fqz01f51aq3i37vhbijvfxrg8p5lczr-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-dynamic-linker=/nix/store/3fqz01f51aq3i37vhbijvfxrg8p5lczr-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ld-musl-x86_64.so.1 --sysroot=/   supports -fno-rtti -fno-exceptions... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
145267:gcc-static-x86_64-unknown-linux-musl> checking sys/sysctl.h presence... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
146366:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
147544:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
147611:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
149491:gdb-static-x86_64-unknown-linux-musl> checking for uintptr_t... checking for limits.h... /build/gdb-15.2/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
149503:gdb-static-x86_64-unknown-linux-musl> checking for xlocale.h... /build/gdb-15.2/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
150800:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/bfd/configure: line 6938: /usr/bin/file: No such file or directory
151707:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
152330:gdb-static-x86_64-unknown-linux-musl> checking for memory.h... /build/gdb-15.2/gdb/configure: line 7248: /usr/bin/file: No such file or directory
152440:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/libctf/configure: line 9376: /usr/bin/file: No such file or directory
153691:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
153901:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
153902:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
153904:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
153906:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
153907:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
154776:cp: cannot stat './gfx': No such file or directory
169102:cp: cannot stat './gocryptfs': No such file or directory
169103:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
169106:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
169107:du: cannot access './gocryptfs': No such file or directory
169108:cp: cannot stat './gocryptfs': No such file or directory
169109:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
169110:du: cannot access './gocryptfs-xray': No such file or directory
169111:cp: cannot stat './gocryptfs-xray': No such file or directory
171283:cp: cannot stat './gost-bin': No such file or directory
172336:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
172593:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
172630:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
172666:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
172690:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
194965:cp: cannot stat './ipinfo-bin': No such file or directory
194966:./ipinfo: cannot open `./ipinfo' (No such file or directory)
194967:du: cannot access './ipinfo': No such file or directory
194968:cp: cannot stat './ipinfo': No such file or directory
194969:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
200123:iptables-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
202659:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
202661:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
202662:du: cannot access './ironrdp-client': No such file or directory
202663:cp: cannot stat './ironrdp-client': No such file or directory
206749:cp: cannot stat './katana': No such file or directory
206750:./katana: cannot open `./katana' (No such file or directory)
206751:du: cannot access './katana': No such file or directory
206752:cp: cannot stat './katana': No such file or directory
207154:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
207156:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
207658:cp: cannot stat './ksubdomain': No such file or directory
207659:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
207660:du: cannot access './ksubdomain': No such file or directory
207661:cp: cannot stat './ksubdomain': No such file or directory
209326:cp: cannot stat './libaws': No such file or directory
209328:./libaws: cannot open `./libaws' (No such file or directory)
209329:du: cannot access './libaws': No such file or directory
209330:cp: cannot stat './libaws': No such file or directory
209331:cp: cannot stat './libaws': No such file or directory
222105:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
226064:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
226066:rsync: [sender] link_stat "/tmp/toolpacks/k9ytUAk_linux_x86_64/magick_appbundle.no_strip" failed: No such file or directory (2)
230389:cp: cannot stat './mirrorbits': No such file or directory
230391:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
230392:du: cannot access './mirrorbits': No such file or directory
230393:cp: cannot stat './mirrorbits': No such file or directory
238081:rsync: [sender] change_dir "/tmp/toolpacks/OvzipYh_linux_x86_64/./result/bin" failed: No such file or directory (2)
238087:rsync: [sender] change_dir "/tmp/toolpacks/OvzipYh_linux_x86_64/./result/libexec/mtd-utils" failed: No such file or directory (2)
242382:sh: cd: line 5: can't cd to ./naabu/v2: No such file or directory
242385:cp: cannot stat './naabu-bin': No such file or directory
242386:./naabu: cannot open `./naabu' (No such file or directory)
242387:du: cannot access './naabu': No such file or directory
242388:cp: cannot stat './naabu': No such file or directory
242487:/tmp/q3Adp_build.sh: line 30: /download/ncdu-2.7-linux-x86_64.tar.gz: No such file or directory
247996:cp: cannot stat './nezha-dashboard': No such file or directory
248001:cp: cannot stat './nezha-agent': No such file or directory
248002:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
248003:du: cannot access './nezha-dashboard': No such file or directory
248004:cp: cannot stat './nezha-dashboard': No such file or directory
248005:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
248006:du: cannot access './nezha-agent': No such file or directory
248007:cp: cannot stat './nezha-agent': No such file or directory
248375:/tmp/toolpack_x86_64/ngrok: cannot open `/tmp/toolpack_x86_64/ngrok' (No such file or directory)
248376:du: cannot access '/tmp/toolpack_x86_64/ngrok': No such file or directory
249789:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
249790:du: cannot access './result/bin/ncat': No such file or directory
249792:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
249793:du: cannot access './result/bin/nmap': No such file or directory
249795:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
249796:du: cannot access './result/bin/nping': No such file or directory
249797:cp: cannot stat './result/bin/ncat': No such file or directory
249798:cp: cannot stat './result/bin/nmap': No such file or directory
249799:cp: cannot stat './result/bin/nping': No such file or directory
258949:find: ‘./bin’: No such file or directory
258950:find: ‘./bin’: No such file or directory
258951:find: ‘./bin’: No such file or directory
258953:rsync: [sender] change_dir "/tmp/toolpacks/OVDpsdY_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
258959:rsync: [sender] change_dir "/tmp/toolpacks/OVDpsdY_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
258965:rsync: [sender] change_dir "/tmp/toolpacks/OVDpsdY_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
258971:rsync: [sender] change_dir "/tmp/toolpacks/OVDpsdY_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
261143:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
261144:du: cannot access './result/bin/openvpn': No such file or directory
261145:cp: cannot stat './result/bin/openvpn': No such file or directory
262906:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
268385:readline-static-x86_64-unknown-linux-musl> /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
268390:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
268395:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
275505:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
275506:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
275509:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
275510:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
275513:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
275514:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
278589:cp: cannot stat './pktstat': No such file or directory
278591:./pktstat: cannot open `./pktstat' (No such file or directory)
278592:du: cannot access './pktstat': No such file or directory
278593:cp: cannot stat './pktstat': No such file or directory
298147:/usr/lib/gcc/x86_64-alpine-linux-musl/14.2.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
298151:/usr/lib/gcc/x86_64-alpine-linux-musl/14.2.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
299088:find: ‘’: No such file or directory
299093:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
299094:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
303390:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
303391:./pwait: cannot open `./pwait' (No such file or directory)
303392:du: cannot access './pwait': No such file or directory
303393:cp: cannot stat './pwait': No such file or directory
305659:readline-static-x86_64-unknown-linux-musl> /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
305664:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
305669:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
311865:cp: cannot stat '': No such file or directory
311915:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
317067:cp: cannot stat './bin/qemu-cris': No such file or directory
317068:cp: cannot stat './bin/qemu-nios2': No such file or directory
318422:chown: cannot access '/tmp/baseutils_x86_64/radare2/': No such file or directory
321505:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
321506:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
321863:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
321864:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
323503:cp: cannot stat './rescope': No such file or directory
324060:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/ripgen': No such file or directory
325074:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
326460:find: ‘/tmp/toolpack_x86_64/ruri’: No such file or directory
346281:./samu: cannot open `./samu' (No such file or directory)
346282:du: cannot access './samu': No such file or directory
346283:cp: cannot stat './samu': No such file or directory
346284:cp: cannot stat './samu': No such file or directory
346517:cp: cannot stat './sbase': No such file or directory
346518:cp: cannot stat './sbase': No such file or directory
346628:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
346631:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
346632:du: cannot access '/build-bins/*': No such file or directory
352342:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
352344:./smenu: cannot open `./smenu' (No such file or directory)
352345:du: cannot access './smenu': No such file or directory
352346:cp: cannot stat './smenu': No such file or directory
364315:readline-static-x86_64-unknown-linux-musl> /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
364320:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
364325:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
365811:cp: cannot stat './spoof-dpi': No such file or directory
367724:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
371101:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
373760:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
373837:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/r183v8ry613pi415njf0c5012fgm4j7d-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
375648:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
377937:binutils-static-x86_64-unknown-linux-musl> checking if the linker (x86_64-unknown-linux-musl-ld) is GNU ld... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
377985:binutils-static-x86_64-unknown-linux-musl> checking for objdir... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
378012:binutils-static-x86_64-unknown-linux-musl> checking for CFLocaleCopyPreferredLanguages... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
378037:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
378068:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... checking for dlfcn.h... checking for sys/param.h... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
378073:binutils-static-x86_64-unknown-linux-musl> checking the maximum length of command line arguments... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
378128:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/27zwn8wxxdwlzgrn5qy423w7cfj8nwa7-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
378167:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... checking for sys/file.h... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
378175:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
378179:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... checking for dlfcn.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
380499:libpfm-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
381543:libpfm-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
382191:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
382192:du: cannot access './result/bin/stress-ng': No such file or directory
382193:cp: cannot stat './result/bin/stress-ng': No such file or directory
386257:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
386266:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
387110:cp: cannot stat './tailscale': No such file or directory
387111:cp: cannot stat './tailscaled': No such file or directory
387112:cp: cannot stat './tailscale_bb': No such file or directory
387113:./tailscale: cannot open `./tailscale' (No such file or directory)
387114:du: cannot access './tailscale': No such file or directory
387115:cp: cannot stat './tailscale': No such file or directory
387116:./tailscaled: cannot open `./tailscaled' (No such file or directory)
387117:du: cannot access './tailscaled': No such file or directory
387118:cp: cannot stat './tailscaled': No such file or directory
387119:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
387120:du: cannot access './tailscale_bb': No such file or directory
387121:cp: cannot stat './tailscale_bb': No such file or directory
387122:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
387123:du: cannot access './tailscale_bb': No such file or directory
387124:cp: cannot stat './tailscale_bb': No such file or directory
398195:readline-static-x86_64-unknown-linux-musl> /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
398200:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
398205:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/0hsgr9849iffhiq2vlmniq5rfz77wwc5-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
400851:find: ‘dist/’: No such file or directory
400852:find: ‘dist/’: No such file or directory
402201:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
402203:./tracexec: cannot open `./tracexec' (No such file or directory)
402204:du: cannot access './tracexec': No such file or directory
402205:cp: cannot stat './tracexec': No such file or directory
403722:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
403724:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
403725:du: cannot access './tun2proxy': No such file or directory
403726:cp: cannot stat './tun2proxy': No such file or directory
404826:cp: cannot stat './ubase': No such file or directory
404827:cp: cannot stat './ubase': No such file or directory
415354:sed: can't read ./Cargo.toml: No such file or directory
415359:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
418732:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
418742:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
418743:du: cannot access './wezterm-gui': No such file or directory
418744:cp: cannot stat './wezterm-gui': No such file or directory
481391:cp: cannot stat './yggdrasil': No such file or directory
481392:cp: cannot stat './yggdrasilctl': No such file or directory
481395:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
481396:du: cannot access './yggdrasil': No such file or directory
481397:cp: cannot stat './yggdrasil': No such file or directory
481398:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
481399:du: cannot access './yggdrasilctl': No such file or directory
481400:cp: cannot stat './yggdrasilctl': No such file or directory
481972:cp: cannot stat './yq': No such file or directory
481974:./yq: cannot open `./yq' (No such file or directory)
481975:du: cannot access './yq': No such file or directory
481976:cp: cannot stat './yq': No such file or directory
488822:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/3150i9skqzyp4a031364y0s7l4dfjxd2-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
488834:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/3150i9skqzyp4a031364y0s7l4dfjxd2-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

