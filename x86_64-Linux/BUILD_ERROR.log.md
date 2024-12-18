```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

28514-
28515- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-12-16 (09:36:50 PM) UTC]
28516-
28517-remote: Support for password authentication was removed on August 13, 2021.
28518-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
28519:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
28520-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
28521-cp: cannot stat './certwatcher': No such file or directory
28522-
--
140631-go: downloading github.com/sourcegraph/conc v0.2.0
140632-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
140633-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
140634-	remote: Support for password authentication was removed on August 13, 2021.
140635-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
140636:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
140637-cp: cannot stat './gfx': No such file or directory
140638-
140639-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):06(Sec)
--
349039-
349040- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-12-17 (08:23:18 AM) UTC]
349041-
349042-remote: Support for password authentication was removed on August 13, 2021.
349043-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
349044:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
349045-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
349046-sed: can't read ./Cargo.toml: No such file or directory
349047-error: failed to parse manifest at `/tmp/toolpacks/k4pIYiZ_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

103257-
103258-
103259-
103260- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-12-16 (11:30:02 PM) UTC]
103261-
103262:asset `x86_64-bin.tar.xz` not found
103263:asset `x86_64-bin.tar.xz` not found
--
115342-
115343-
115344-
115345- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-12-17 (12:06:39 AM) UTC]
115346-
115347:asset `arm` not found
115348:asset `arm` not found
--
207221-
207222-
207223-
207224- [+] (Building | Fetching) mdcat :: https://github.com/swsnr/mdcat [Tuesday, 2024-12-17 (03:11:02 AM) UTC]
207225-
207226:asset `x86_64-unknown-linux-musl` not found
--
272077-
272078-
272079-
272080- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-12-17 (06:00:23 AM) UTC]
272081-
272082:asset `ruri` not found
--
292145-
292146-
292147-
292148- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-12-17 (06:15:05 AM) UTC]
292149-
292150:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

  0     0    0     0    0     0      0      0 --:--:--  0:00:10 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:11 --:--:--     0curl: (6) Could not resolve host: codeload.github.com
  0     0    0     0    0     0      0      0 --:--:--  0:00:04 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:04 --:--:--     0curl: (6) Could not resolve host: objects.githubusercontent.com


[-] command not found --> # Something failed to Install

64000:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: git: command not found
65496:vim-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: hostname: command not found
67503:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
68386:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
90644:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
90723:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
91233:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
91570:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
91946:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
92163:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
95794:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
97910:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
98390:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
98392:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
107101:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
114584:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
117366:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
121319:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
122810:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
124980:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
176221:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
176264:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
176550:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
177315:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
177476:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
178019:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
178242:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
178966:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
179014:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
179032:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
180115:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
180145:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
180191:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
187502:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
205396:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
205446:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
205464:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
206001:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
206002:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
206003:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: git: command not found
206126:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
206127:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
206128:masscan-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: git: command not found
211593:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
222755:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
227968:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228018:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228036:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
233819:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
234500:pigz-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: which: command not found
236876:procps-static-x86_64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
271375:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
273379:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
275806:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
279394:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
281931:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
286161:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
288717:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
308398:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
309253:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
309627:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
312839:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
315001:keyutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
315153:keyutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
315614:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
318126:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
319007:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
320272:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
322580:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
322754:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
322818:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
322876:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
322921:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
322975:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
332841:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
332892:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
332910:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
337687:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
345314:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
347469:vim-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: hostname: command not found
417955:pcre-static-x86_64-unknown-linux-musl> /build/pcre-8.45/libtool: line 1861: ldconfig: command not found


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

5483:cp: cannot stat './aptly-bin': No such file or directory
5485:./aptly: cannot open `./aptly' (No such file or directory)
5486:du: cannot access './aptly': No such file or directory
5487:cp: cannot stat './aptly': No such file or directory
14320:binutils-static-x86_64-unknown-linux-musl> checking whether byte ordering is bigendian... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
14321:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
14341:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
14342:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/27zwn8wxxdwlzgrn5qy423w7cfj8nwa7-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
14362:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
15649:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
15987:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
16152:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
28521:cp: cannot stat './certwatcher': No such file or directory
35935:cp: cannot stat './cobalt': No such file or directory
35936:./cobalt: cannot open `./cobalt' (No such file or directory)
35937:du: cannot access './cobalt': No such file or directory
35938:cp: cannot stat './cobalt': No such file or directory
41933:cmp: .git/hooks/applypatch-msg: No such file or directory
41934:cmp: .git/hooks/commit-msg: No such file or directory
41935:cmp: .git/hooks/pre-applypatch: No such file or directory
41936:cmp: .git/hooks/pre-commit: No such file or directory
53877:cmp: .git/hooks/applypatch-msg: No such file or directory
53878:cmp: .git/hooks/commit-msg: No such file or directory
53879:cmp: .git/hooks/pre-applypatch: No such file or directory
53880:cmp: .git/hooks/pre-commit: No such file or directory
72226:dateutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
72229:dateutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
72232:dateutils-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
89011:cp: cannot stat './dblab': No such file or directory
89012:./dblab: cannot open `./dblab' (No such file or directory)
89013:du: cannot access './dblab': No such file or directory
89014:cp: cannot stat './dblab': No such file or directory
98874:cp: cannot stat './dnspyre': No such file or directory
98876:./dnspyre: cannot open `./dnspyre' (No such file or directory)
98877:du: cannot access './dnspyre': No such file or directory
98878:cp: cannot stat './dnspyre': No such file or directory
99288:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
102926:cp: cannot stat './eget': No such file or directory
102927:./eget: cannot open `./eget' (No such file or directory)
102928:du: cannot access './eget': No such file or directory
102929:cp: cannot stat './eget': No such file or directory
106232:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
106806:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
114098:rsync: [sender] change_dir "/tmp/toolpacks/VfU4NnC_linux_x86_64/./result/bin" failed: No such file or directory (2)
114295:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
114681:rsync: [sender] change_dir "/tmp/toolpacks/D8xfSMw_linux_x86_64/./result/bin" failed: No such file or directory (2)
116085:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/r183v8ry613pi415njf0c5012fgm4j7d-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
118210:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/27zwn8wxxdwlzgrn5qy423w7cfj8nwa7-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
118227:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
118244:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
118248:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
118264:binutils-static-x86_64-unknown-linux-musl> checking for catalogs to be installed... checking for sys/file.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
121100:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
122271:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
122624:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
124311:gcc-static-x86_64-unknown-linux-musl> /nix/store/2hkzf0w9w6x02vmd0lgkh9x40bc2ia9v-stdenv-linux/setup: line 261: /nix/store/x9as7x6f7cdgcskvvn3yp02m662krr7y-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
124312:gcc-static-x86_64-unknown-linux-musl> /nix/store/2hkzf0w9w6x02vmd0lgkh9x40bc2ia9v-stdenv-linux/setup: line 261: /nix/store/f2q2m6kksxngkb5h535l5a2n51cx01wc-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
125782:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
128568:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
128758:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
130932:gcc-static-x86_64-unknown-linux-musl> checking for ANSI C header files... /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
130933:gcc-static-x86_64-unknown-linux-musl> checking how to run the C preprocessor... /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
131016:gcc-static-x86_64-unknown-linux-musl> checking fcntl.h usability... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
131127:gcc-static-x86_64-unknown-linux-musl> checking sys/sysctl.h presence... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
132226:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
133404:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
133471:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
135350:gdb-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/27zwn8wxxdwlzgrn5qy423w7cfj8nwa7-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/gdb-15.2/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
135363:gdb-static-x86_64-unknown-linux-musl> checking for xlocale.h... /build/gdb-15.2/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
136628:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/bfd/configure: line 6938: /usr/bin/file: No such file or directory
137541:gdb-static-x86_64-unknown-linux-musl> checking sys/ptrace.h usability... /build/gdb-15.2/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
138201:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/gdb/configure: line 7248: /usr/bin/file: No such file or directory
138255:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/libctf/configure: line 9376: /usr/bin/file: No such file or directory
139550:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
139761:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
139763:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
139764:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
139765:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
139766:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
140637:cp: cannot stat './gfx': No such file or directory
154804:cp: cannot stat './gocryptfs': No such file or directory
154805:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
154808:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
154809:du: cannot access './gocryptfs': No such file or directory
154810:cp: cannot stat './gocryptfs': No such file or directory
154811:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
154812:du: cannot access './gocryptfs-xray': No such file or directory
154813:cp: cannot stat './gocryptfs-xray': No such file or directory
156989:cp: cannot stat './gost-bin': No such file or directory
158057:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
158312:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158350:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158386:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158410:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
174655:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
174658:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
174659:du: cannot access '/build-bins/*': No such file or directory
176623:cp: cannot stat './ipinfo-bin': No such file or directory
176624:./ipinfo: cannot open `./ipinfo' (No such file or directory)
176625:du: cannot access './ipinfo': No such file or directory
176626:cp: cannot stat './ipinfo': No such file or directory
176627:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
180255:iptables-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
182756:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
182758:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
182759:du: cannot access './ironrdp-client': No such file or directory
182760:cp: cannot stat './ironrdp-client': No such file or directory
186820:cp: cannot stat './katana': No such file or directory
186821:./katana: cannot open `./katana' (No such file or directory)
186822:du: cannot access './katana': No such file or directory
186823:cp: cannot stat './katana': No such file or directory
187225:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
187227:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
187720:cp: cannot stat './ksubdomain': No such file or directory
187721:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
187722:du: cannot access './ksubdomain': No such file or directory
187723:cp: cannot stat './ksubdomain': No such file or directory
189825:cp: cannot stat './libaws': No such file or directory
189827:./libaws: cannot open `./libaws' (No such file or directory)
189828:du: cannot access './libaws': No such file or directory
189829:cp: cannot stat './libaws': No such file or directory
189830:cp: cannot stat './libaws': No such file or directory
199506:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
203464:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
203466:rsync: [sender] link_stat "/tmp/toolpacks/HG5Kb4L_linux_x86_64/magick_appbundle.no_strip" failed: No such file or directory (2)
207774:cp: cannot stat './mirrorbits': No such file or directory
207776:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
207777:du: cannot access './mirrorbits': No such file or directory
207778:cp: cannot stat './mirrorbits': No such file or directory
212349:rsync: [sender] change_dir "/tmp/toolpacks/RqcQpHH_linux_x86_64/./result/bin" failed: No such file or directory (2)
212355:rsync: [sender] change_dir "/tmp/toolpacks/RqcQpHH_linux_x86_64/./result/libexec/mtd-utils" failed: No such file or directory (2)
213523:sh: cd: line 5: can't cd to ./naabu/v2: No such file or directory
213526:cp: cannot stat './naabu-bin': No such file or directory
213527:./naabu: cannot open `./naabu' (No such file or directory)
213528:du: cannot access './naabu': No such file or directory
213529:cp: cannot stat './naabu': No such file or directory
213628:/tmp/QaCVa_build.sh: line 30: /download/ncdu-2.7-linux-x86_64.tar.gz: No such file or directory
219147:cp: cannot stat './nezha-dashboard': No such file or directory
219152:cp: cannot stat './nezha-agent': No such file or directory
219153:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
219154:du: cannot access './nezha-dashboard': No such file or directory
219155:cp: cannot stat './nezha-dashboard': No such file or directory
219156:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
219157:du: cannot access './nezha-agent': No such file or directory
219158:cp: cannot stat './nezha-agent': No such file or directory
219520:/tmp/toolpack_x86_64/ngrok: cannot open `/tmp/toolpack_x86_64/ngrok' (No such file or directory)
219521:du: cannot access '/tmp/toolpack_x86_64/ngrok': No such file or directory
220776:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
220777:du: cannot access './result/bin/ncat': No such file or directory
220779:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
220780:du: cannot access './result/bin/nmap': No such file or directory
220782:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
220783:du: cannot access './result/bin/nping': No such file or directory
220784:cp: cannot stat './result/bin/ncat': No such file or directory
220785:cp: cannot stat './result/bin/nmap': No such file or directory
220786:cp: cannot stat './result/bin/nping': No such file or directory
222307:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
222310:cp: cannot stat '/build-bins/notify-send-rs': No such file or directory
222311:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
222312:du: cannot access '/build-bins/*': No such file or directory
226531:find: ‘./bin’: No such file or directory
226532:find: ‘./bin’: No such file or directory
226533:find: ‘./bin’: No such file or directory
226535:rsync: [sender] change_dir "/tmp/toolpacks/uTYrjnQ_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
226541:rsync: [sender] change_dir "/tmp/toolpacks/uTYrjnQ_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
226547:rsync: [sender] change_dir "/tmp/toolpacks/uTYrjnQ_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
226553:rsync: [sender] change_dir "/tmp/toolpacks/uTYrjnQ_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
228729:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
228730:du: cannot access './result/bin/openvpn': No such file or directory
228731:cp: cannot stat './result/bin/openvpn': No such file or directory
230527:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
232075:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
232076:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
232079:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
232080:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
232083:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
232084:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
235184:cp: cannot stat './pktstat': No such file or directory
235186:./pktstat: cannot open `./pktstat' (No such file or directory)
235187:du: cannot access './pktstat': No such file or directory
235188:cp: cannot stat './pktstat': No such file or directory
254815:/usr/lib/gcc/x86_64-alpine-linux-musl/14.2.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
254819:/usr/lib/gcc/x86_64-alpine-linux-musl/14.2.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
255745:find: ‘’: No such file or directory
255750:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
255751:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
256884:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
256885:./pwait: cannot open `./pwait' (No such file or directory)
256886:du: cannot access './pwait': No such file or directory
256887:cp: cannot stat './pwait': No such file or directory
257278:cp: cannot stat '': No such file or directory
257328:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
262481:cp: cannot stat './bin/qemu-cris': No such file or directory
262482:cp: cannot stat './bin/qemu-nios2': No such file or directory
264047:chown: cannot access '/tmp/baseutils_x86_64/radare2/': No such file or directory
267130:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
267131:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
267485:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
267486:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
269158:cp: cannot stat './rescope': No such file or directory
269712:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/ripgen': No such file or directory
270719:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
271954:cp: cannot stat './target/x86_64-unknown-linux-musl/release/Run': No such file or directory
271955:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
271956:du: cannot access '/build-bins/*': No such file or directory
272085:find: ‘/tmp/toolpack_x86_64/ruri’: No such file or directory
291902:./samu: cannot open `./samu' (No such file or directory)
291903:du: cannot access './samu': No such file or directory
291904:cp: cannot stat './samu': No such file or directory
291905:cp: cannot stat './samu': No such file or directory
292138:cp: cannot stat './sbase': No such file or directory
292139:cp: cannot stat './sbase': No such file or directory
292249:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
292252:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
292253:du: cannot access '/build-bins/*': No such file or directory
293835:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
297146:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
297148:./smenu: cannot open `./smenu' (No such file or directory)
297149:du: cannot access './smenu': No such file or directory
297150:cp: cannot stat './smenu': No such file or directory
307045:cp: cannot stat './spoof-dpi': No such file or directory
308958:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
312338:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
314999:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
315051:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/r183v8ry613pi415njf0c5012fgm4j7d-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
316847:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
318491:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
318597:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
318954:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
318957:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
319004:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
319012:libpfm-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
319392:binutils-static-x86_64-unknown-linux-musl> checking for sys/file.h... checking command to parse /nix/store/27zwn8wxxdwlzgrn5qy423w7cfj8nwa7-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
319394:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
319423:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
319432:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
319463:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
320865:libpfm-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
321868:lm-sensors-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
321984:lm-sensors-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
322355:lm-sensors-static-x86_64-unknown-linux-musl> /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
323866:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
323867:du: cannot access './result/bin/stress-ng': No such file or directory
323868:cp: cannot stat './result/bin/stress-ng': No such file or directory
327938:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
327947:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
328793:cp: cannot stat './tailscale': No such file or directory
328794:cp: cannot stat './tailscaled': No such file or directory
328795:cp: cannot stat './tailscale_bb': No such file or directory
328796:./tailscale: cannot open `./tailscale' (No such file or directory)
328797:du: cannot access './tailscale': No such file or directory
328798:cp: cannot stat './tailscale': No such file or directory
328799:./tailscaled: cannot open `./tailscaled' (No such file or directory)
328800:du: cannot access './tailscaled': No such file or directory
328801:cp: cannot stat './tailscaled': No such file or directory
328802:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
328803:du: cannot access './tailscale_bb': No such file or directory
328804:cp: cannot stat './tailscale_bb': No such file or directory
328805:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
328806:du: cannot access './tailscale_bb': No such file or directory
328807:cp: cannot stat './tailscale_bb': No such file or directory
339784:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
339785:du: cannot access '/build-bins/*': No such file or directory
340341:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
340343:./tracexec: cannot open `./tracexec' (No such file or directory)
340344:du: cannot access './tracexec': No such file or directory
340345:cp: cannot stat './tracexec': No such file or directory
340482:sed: can't read ./Cargo.toml: No such file or directory
340487:cp: cannot stat './target/x86_64-unknown-linux-musl/release/trip': No such file or directory
341631:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
341633:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
341634:du: cannot access './tun2proxy': No such file or directory
341635:cp: cannot stat './tun2proxy': No such file or directory
342653:cp: cannot stat './ubase': No such file or directory
342654:cp: cannot stat './ubase': No such file or directory
343031:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
343034:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
343035:du: cannot access '/build-bins/*': No such file or directory
349046:sed: can't read ./Cargo.toml: No such file or directory
349051:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
352435:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
352445:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
352446:du: cannot access './wezterm-gui': No such file or directory
352447:cp: cannot stat './wezterm-gui': No such file or directory
415032:cp: cannot stat './yggdrasil': No such file or directory
415033:cp: cannot stat './yggdrasilctl': No such file or directory
415036:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
415037:du: cannot access './yggdrasil': No such file or directory
415038:cp: cannot stat './yggdrasil': No such file or directory
415039:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
415040:du: cannot access './yggdrasilctl': No such file or directory
415041:cp: cannot stat './yggdrasilctl': No such file or directory
415613:cp: cannot stat './yq': No such file or directory
415615:./yq: cannot open `./yq' (No such file or directory)
415616:du: cannot access './yq': No such file or directory
415617:cp: cannot stat './yq': No such file or directory
419343:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/3150i9skqzyp4a031364y0s7l4dfjxd2-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
419355:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/3150i9skqzyp4a031364y0s7l4dfjxd2-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

