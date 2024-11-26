```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

33742-
33743- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-11-18 (10:11:58 PM) UTC]
33744-
33745-remote: Support for password authentication was removed on August 13, 2021.
33746-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
33747:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
33748-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
33749-cp: cannot stat './certwatcher': No such file or directory
33750-
--
155100-go: downloading github.com/sourcegraph/conc v0.2.0
155101-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
155102-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
155103-	remote: Support for password authentication was removed on August 13, 2021.
155104-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
155105:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
155106-cp: cannot stat './gfx': No such file or directory
155107-
155108-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):03(Sec)
--
406110-
406111- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-11-19 (10:19:50 AM) UTC]
406112-
406113-remote: Support for password authentication was removed on August 13, 2021.
406114-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
406115:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
406116-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
406117-sed: can't read ./Cargo.toml: No such file or directory
406118-error: failed to parse manifest at `/tmp/toolpacks/RbGJlFU_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

109409-
109410-
109411-
109412- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Tuesday, 2024-11-19 (12:22:45 AM) UTC]
109413-
109414:asset `x86_64-bin.tar.xz` not found
109415:asset `x86_64-bin.tar.xz` not found
--
125220-
125221-
125222-
125223- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-11-19 (01:05:07 AM) UTC]
125224-
125225:asset `arm` not found
125226:asset `arm` not found
--
232321-
232322-
232323-
232324- [+] (Building | Fetching) mdcat :: https://github.com/swsnr/mdcat [Tuesday, 2024-11-19 (04:31:57 AM) UTC]
232325-
232326:asset `x86_64-unknown-linux-musl` not found
--
324554-
324555-
324556-
324557- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-11-19 (07:42:46 AM) UTC]
324558-
324559:asset `ruri` not found
--
344625-
344626-
344627-
344628- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-11-19 (07:58:57 AM) UTC]
344629-
344630:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):33(Sec)


[-] command not found --> # Something failed to Install

66585:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: git: command not found
71624:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
72137:vim-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: hostname: command not found
74149:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
75023:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
96839:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
96972:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
97411:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
97583:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
98082:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
98325:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
101953:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
104106:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
104606:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
104608:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
113744:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
124462:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
126381:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
128681:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
133873:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
136448:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
139461:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
194926:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
194969:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
195255:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
196051:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
196223:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
197281:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
197537:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
198339:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
198390:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
198408:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
200346:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
200376:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
200423:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
207812:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
230499:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
230549:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
230567:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
231104:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
231105:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
231106:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: git: command not found
231229:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
231230:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
231231:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: git: command not found
239834:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
254211:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
262565:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
262616:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
262634:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
267103:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
267161:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
279354:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
280030:pigz-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
282407:procps-static-x86_64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
307407:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
307470:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
323797:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
325859:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
328286:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
331874:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
334411:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
338641:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
341197:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
358091:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
358940:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
359314:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
361691:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
364128:keyutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
364208:keyutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
365403:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
366995:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
367160:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
368628:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
368854:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
369534:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
371828:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
371904:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
371941:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
372058:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
372173:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
372326:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
381500:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
381552:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
381571:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
389943:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
398345:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
404045:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
404547:vim-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

68:./bed:                               ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=W54xB5ittyUb-PUwu_hA/f7IaId-zbTyq9ZEIRtmf/4WRL_Zqfp5RUUDnoYPzj/IC00C39jHPu-hlSanNn2, stripped
75:./binfetch:                          ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
658:./netexec_dynamic:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=8485f6953c06d12b9865185ba3466fdbf9b4a65c, for GNU/Linux 2.6.32, stripped
728:./pathbuster:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
768:./promtail:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=e4f40943216c9829e415503f868ecec92b296b1c, for GNU/Linux 3.2.0, stripped
872:./rqbit:                             ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
1140:./woofwoof:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=30e06184968532b6a9aa36f44ada39e4af0bda56, for GNU/Linux 2.6.32, stripped


[-] Incorrect Arch --> # Not for x86_64

402:./gost:                              ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
588:./METADATA.AIO.json.xz:              7-zip archive data, version 0.4
590:./METADATA.AIO.json.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
593:./METADATA.AIO.min.json.xz:          7-zip archive data, version 0.4
595:./METADATA.AIO.min.json.zstd:        Zstandard compressed data (v0.8+), Dictionary ID: None
597:./METADATA.AIO.soar.capnp:           data
599:./METADATA.AIO.soar.capnp.xz:        7-zip archive data, version 0.4
601:./METADATA.AIO.soar.capnp.zstd:      Zstandard compressed data (v0.8+), Dictionary ID: None
605:./METADATA.AIO.toml.xz:              7-zip archive data, version 0.4
607:./METADATA.AIO.toml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
611:./METADATA.AIO.yaml.xz:              7-zip archive data, version 0.4
613:./METADATA.AIO.yaml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
860:./rippkgs-index.sqlite:              SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2


[-] No such file or directory # Usually Because Build Failures

6585:cp: cannot stat './aptly-bin': No such file or directory
6587:./aptly: cannot open `./aptly' (No such file or directory)
6588:du: cannot access './aptly': No such file or directory
6589:cp: cannot stat './aptly': No such file or directory
19830:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
19832:binutils-static-x86_64-unknown-linux-musl> checking for ld used by GCC... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
19840:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
19841:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
19883:binutils-static-x86_64-unknown-linux-musl> checking for limits.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
21163:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
21501:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
21665:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
33749:cp: cannot stat './certwatcher': No such file or directory
38626:cp: cannot stat './cobalt': No such file or directory
38627:./cobalt: cannot open `./cobalt' (No such file or directory)
38628:du: cannot access './cobalt': No such file or directory
38629:cp: cannot stat './cobalt': No such file or directory
44599:cmp: .git/hooks/applypatch-msg: No such file or directory
44600:cmp: .git/hooks/commit-msg: No such file or directory
44601:cmp: .git/hooks/pre-applypatch: No such file or directory
44602:cmp: .git/hooks/pre-commit: No such file or directory
56530:cmp: .git/hooks/applypatch-msg: No such file or directory
56531:cmp: .git/hooks/commit-msg: No such file or directory
56532:cmp: .git/hooks/pre-applypatch: No such file or directory
56533:cmp: .git/hooks/pre-commit: No such file or directory
79334:dateutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
79337:dateutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
79340:dateutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
95157:cp: cannot stat './dbin': No such file or directory
95175:cp: cannot stat './dblab': No such file or directory
95176:./dblab: cannot open `./dblab' (No such file or directory)
95177:du: cannot access './dblab': No such file or directory
95178:cp: cannot stat './dblab': No such file or directory
105090:cp: cannot stat './dnspyre': No such file or directory
105092:./dnspyre: cannot open `./dnspyre' (No such file or directory)
105093:du: cannot access './dnspyre': No such file or directory
105094:cp: cannot stat './dnspyre': No such file or directory
105501:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
109078:cp: cannot stat './eget': No such file or directory
109079:./eget: cannot open `./eget' (No such file or directory)
109080:du: cannot access './eget': No such file or directory
109081:cp: cannot stat './eget': No such file or directory
112869:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
113455:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
123961:rsync: [sender] change_dir "/tmp/toolpacks/HSV7N7H_linux_x86_64/./result/bin" failed: No such file or directory (2)
124173:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
124559:rsync: [sender] change_dir "/tmp/toolpacks/DdDLJp4_linux_x86_64/./result/bin" failed: No such file or directory (2)
126951:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/2qllbipkqkvgr5i1s7bl1azxixcyk80a-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
129436:binutils-static-x86_64-unknown-linux-musl> checking for ld used by GCC... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
129457:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
129478:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
129482:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
129524:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc supports -c -o file.o... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
133063:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
135375:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
135908:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
137659:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
137665:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
137670:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
138771:gcc-static-x86_64-unknown-linux-musl> /nix/store/mpfl88dxjw7864kkiyy2vp8310fdl2jl-stdenv-linux/setup: line 261: /nix/store/9bacph866qhmr2zfib1h49jixq5hhd01-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
138772:gcc-static-x86_64-unknown-linux-musl> /nix/store/mpfl88dxjw7864kkiyy2vp8310fdl2jl-stdenv-linux/setup: line 261: /nix/store/0axcnz5g1b5rgynjwgshlh8npda18f2r-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
140226:gcc-static-x86_64-unknown-linux-musl> checking whether x86_64-unknown-linux-musl-gcc supports -pedantic ... checking whether gcc supports -Wmissing-prototypes... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
143038:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
143228:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
145396:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
145401:gcc-static-x86_64-unknown-linux-musl> checking for ANSI C header files... /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
145490:gcc-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc -O2 -I/nix/store/xc6i8vx53v90qb9jai6rnacizhs5lg38-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -B/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ -idirafter /nix/store/xc6i8vx53v90qb9jai6rnacizhs5lg38-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -idirafter /nix/store/80y7mzkpjb14m9ybc2ilijpm01pjdp3w-x86_64-unknown-linux-musl-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-musl/13.3.0/include-fixed -isystem /nix/store/3vd96xjszd1i7crhhyiary61dqlfxnx8-fortify-headers-1.1alpine3/include -Wl,-rpath,/nix/store/nyxay788ca24ak9q5pl0d1pr319w3194-gcc-static-x86_64-unknown-linux-musl-13.3.0-lib/lib -Wl,-L/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-rpath -Wl,/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-dynamic-linker=/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ld-musl-x86_64.so.1 --sysroot=/   PIC flag -fPIC -DPIC works... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
145597:gcc-static-x86_64-unknown-linux-musl> checking what to include in gstdint.h... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
146695:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
147878:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
147940:gcc-static-x86_64-unknown-linux-musl> checking dynamic linker characteristics... /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
149823:gdb-static-x86_64-unknown-linux-musl> checking whether byte ordering is bigendian... /build/gdb-15.2/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
149831:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
151144:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/bfd/configure: line 6938: /usr/bin/file: No such file or directory
152020:gdb-static-x86_64-unknown-linux-musl> checking for libxxhash... /build/gdb-15.2/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
152745:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/libctf/configure: line 9376: /usr/bin/file: No such file or directory
152748:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/gdb/configure: line 7248: /usr/bin/file: No such file or directory
154021:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
154233:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
154234:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
154236:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
154237:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
154239:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
155106:cp: cannot stat './gfx': No such file or directory
169275:cp: cannot stat './gocryptfs': No such file or directory
169276:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
169279:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
169280:du: cannot access './gocryptfs': No such file or directory
169281:cp: cannot stat './gocryptfs': No such file or directory
169282:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
169283:du: cannot access './gocryptfs-xray': No such file or directory
169284:cp: cannot stat './gocryptfs-xray': No such file or directory
171445:cp: cannot stat './gost-bin': No such file or directory
172502:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
172761:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
172795:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
172830:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
172856:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
195328:cp: cannot stat './ipinfo-bin': No such file or directory
195329:./ipinfo: cannot open `./ipinfo' (No such file or directory)
195330:du: cannot access './ipinfo': No such file or directory
195331:cp: cannot stat './ipinfo': No such file or directory
195332:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
200489:iptables-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
203025:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
203027:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
203028:du: cannot access './ironrdp-client': No such file or directory
203029:cp: cannot stat './ironrdp-client': No such file or directory
207130:cp: cannot stat './katana': No such file or directory
207131:./katana: cannot open `./katana' (No such file or directory)
207132:du: cannot access './katana': No such file or directory
207133:cp: cannot stat './katana': No such file or directory
207535:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
207537:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
208039:cp: cannot stat './ksubdomain': No such file or directory
208040:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
208041:du: cannot access './ksubdomain': No such file or directory
208042:cp: cannot stat './ksubdomain': No such file or directory
209722:cp: cannot stat './libaws': No such file or directory
209724:./libaws: cannot open `./libaws' (No such file or directory)
209725:du: cannot access './libaws': No such file or directory
209726:cp: cannot stat './libaws': No such file or directory
209727:cp: cannot stat './libaws': No such file or directory
224614:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
228573:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
228575:rsync: [sender] link_stat "/tmp/toolpacks/MJb6YMS_linux_x86_64/magick_appbundle.no_strip" failed: No such file or directory (2)
232892:cp: cannot stat './mirrorbits': No such file or directory
232894:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
232895:du: cannot access './mirrorbits': No such file or directory
232896:cp: cannot stat './mirrorbits': No such file or directory
240592:rsync: [sender] change_dir "/tmp/toolpacks/0OE9JWr_linux_x86_64/./result/bin" failed: No such file or directory (2)
240598:rsync: [sender] change_dir "/tmp/toolpacks/0OE9JWr_linux_x86_64/./result/libexec/mtd-utils" failed: No such file or directory (2)
244895:cp: cannot stat './naabu-bin': No such file or directory
244896:./naabu: cannot open `./naabu' (No such file or directory)
244897:du: cannot access './naabu': No such file or directory
244898:cp: cannot stat './naabu': No such file or directory
245012:/tmp/pNtih_build.sh: line 30: /download/ncdu-2.6-linux-x86_64.tar.gz: No such file or directory
250449:cp: cannot stat './nezha-dashboard': No such file or directory
250454:cp: cannot stat './nezha-agent': No such file or directory
250455:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
250456:du: cannot access './nezha-dashboard': No such file or directory
250457:cp: cannot stat './nezha-dashboard': No such file or directory
250458:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
250459:du: cannot access './nezha-agent': No such file or directory
250460:cp: cannot stat './nezha-agent': No such file or directory
250820:/tmp/toolpack_x86_64/ngrok: cannot open `/tmp/toolpack_x86_64/ngrok' (No such file or directory)
250821:du: cannot access '/tmp/toolpack_x86_64/ngrok': No such file or directory
252225:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
252226:du: cannot access './result/bin/ncat': No such file or directory
252228:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
252229:du: cannot access './result/bin/nmap': No such file or directory
252231:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
252232:du: cannot access './result/bin/nping': No such file or directory
252233:cp: cannot stat './result/bin/ncat': No such file or directory
252234:cp: cannot stat './result/bin/nmap': No such file or directory
252235:cp: cannot stat './result/bin/nping': No such file or directory
252604:rsync: [sender] link_stat "/tmp/tmp.r3FIj1JEYm/a-utils/cmd/noroot-do/noroot-do" failed: No such file or directory (2)
252609:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
252610:du: cannot access '/build-bins/*': No such file or directory
261137:find: ‘./bin’: No such file or directory
261138:find: ‘./bin’: No such file or directory
261139:find: ‘./bin’: No such file or directory
261141:rsync: [sender] change_dir "/tmp/toolpacks/h5Wh5mP_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
261147:rsync: [sender] change_dir "/tmp/toolpacks/h5Wh5mP_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
261153:rsync: [sender] change_dir "/tmp/toolpacks/h5Wh5mP_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
261159:rsync: [sender] change_dir "/tmp/toolpacks/h5Wh5mP_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
263327:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
263328:du: cannot access './result/bin/openvpn': No such file or directory
263329:cp: cannot stat './result/bin/openvpn': No such file or directory
265075:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
270554:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
270559:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
270564:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
277723:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
277724:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
277727:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
277728:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
277731:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
277732:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
280677:cp: cannot stat './pktstat': No such file or directory
280679:./pktstat: cannot open `./pktstat' (No such file or directory)
280680:du: cannot access './pktstat': No such file or directory
280681:cp: cannot stat './pktstat': No such file or directory
300232:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
300236:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
300286:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
301166:find: ‘’: No such file or directory
301171:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
301172:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
305471:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
305472:./pwait: cannot open `./pwait' (No such file or directory)
305473:du: cannot access './pwait': No such file or directory
305474:cp: cannot stat './pwait': No such file or directory
307733:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
307738:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
307743:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
313938:cp: cannot stat '': No such file or directory
313988:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
314285:cat: qemu.cid: No such file or directory
314287:cat: qemu.cid: No such file or directory
314289:rm: cannot remove './qemu.cid': No such file or directory
314292:./bin/*: cannot open `./bin/*' (No such file or directory)
314293:du: cannot access './bin/*': No such file or directory
314294:cp: cannot stat './bin/qemu-aarch64': No such file or directory
314295:cp: cannot stat './bin/qemu-aarch64_be': No such file or directory
314296:cp: cannot stat './bin/qemu-alpha': No such file or directory
314297:cp: cannot stat './bin/qemu-arm': No such file or directory
314298:cp: cannot stat './bin/qemu-armeb': No such file or directory
314299:cp: cannot stat './bin/qemu-cris': No such file or directory
314300:cp: cannot stat './bin/qemu-hexagon': No such file or directory
314301:cp: cannot stat './bin/qemu-hppa': No such file or directory
314302:cp: cannot stat './bin/qemu-i386': No such file or directory
314303:cp: cannot stat './bin/qemu-loongarch64': No such file or directory
314304:cp: cannot stat './bin/qemu-m68k': No such file or directory
314305:cp: cannot stat './bin/qemu-microblaze': No such file or directory
314306:cp: cannot stat './bin/qemu-microblazeel': No such file or directory
314307:cp: cannot stat './bin/qemu-mips': No such file or directory
314308:cp: cannot stat './bin/qemu-mips64': No such file or directory
314309:cp: cannot stat './bin/qemu-mips64el': No such file or directory
314310:cp: cannot stat './bin/qemu-mipsel': No such file or directory
314311:cp: cannot stat './bin/qemu-mipsn32': No such file or directory
314312:cp: cannot stat './bin/qemu-mipsn32el': No such file or directory
314313:cp: cannot stat './bin/qemu-nios2': No such file or directory
314314:cp: cannot stat './bin/qemu-or1k': No such file or directory
314315:cp: cannot stat './bin/qemu-ppc': No such file or directory
314316:cp: cannot stat './bin/qemu-ppc64': No such file or directory
314317:cp: cannot stat './bin/qemu-ppc64le': No such file or directory
314318:cp: cannot stat './bin/qemu-riscv32': No such file or directory
314319:cp: cannot stat './bin/qemu-riscv64': No such file or directory
314320:cp: cannot stat './bin/qemu-s390x': No such file or directory
314321:cp: cannot stat './bin/qemu-sh4': No such file or directory
314322:cp: cannot stat './bin/qemu-sh4eb': No such file or directory
314323:cp: cannot stat './bin/qemu-sparc': No such file or directory
314324:cp: cannot stat './bin/qemu-sparc32plus': No such file or directory
314325:cp: cannot stat './bin/qemu-sparc64': No such file or directory
314326:cp: cannot stat './bin/qemu-x86_64': No such file or directory
314327:cp: cannot stat './bin/qemu-xtensa': No such file or directory
314328:cp: cannot stat './bin/qemu-xtensaeb': No such file or directory
319621:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
319622:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
319954:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
320001:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
320002:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
321598:cp: cannot stat './rescope': No such file or directory
323133:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
324562:find: ‘/tmp/toolpack_x86_64/ruri’: No such file or directory
344382:./samu: cannot open `./samu' (No such file or directory)
344383:du: cannot access './samu': No such file or directory
344384:cp: cannot stat './samu': No such file or directory
344385:cp: cannot stat './samu': No such file or directory
344618:cp: cannot stat './sbase': No such file or directory
344619:cp: cannot stat './sbase': No such file or directory
350349:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
350351:./smenu: cannot open `./smenu' (No such file or directory)
350352:du: cannot access './smenu': No such file or directory
350353:cp: cannot stat './smenu': No such file or directory
355233:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
355238:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
355243:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
356729:cp: cannot stat './spoof-dpi': No such file or directory
358651:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
361190:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
364043:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/2qllbipkqkvgr5i1s7bl1azxixcyk80a-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
364127:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
366089:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
367758:binutils-static-x86_64-unknown-linux-musl> checking for CFPreferencesCopyAppValue... checking command to parse /nix/store/n386c06iy63cgf36vxd1if9r9qlcc8ij-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
367765:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
367782:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
367809:binutils-static-x86_64-unknown-linux-musl> checking for objdir... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
367811:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
367921:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
367938:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
367945:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... checking for objdir... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
367961:binutils-static-x86_64-unknown-linux-musl> checking the maximum length of command line arguments... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
368065:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
370804:libpfm-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
371664:libpfm-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
372476:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
372477:du: cannot access './result/bin/stress-ng': No such file or directory
372478:cp: cannot stat './result/bin/stress-ng': No such file or directory
376572:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
376581:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
377403:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
377404:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
377462:cp: cannot stat './tailscale': No such file or directory
377463:cp: cannot stat './tailscaled': No such file or directory
377464:cp: cannot stat './tailscale_bb': No such file or directory
377465:./tailscale: cannot open `./tailscale' (No such file or directory)
377466:du: cannot access './tailscale': No such file or directory
377467:cp: cannot stat './tailscale': No such file or directory
377468:./tailscaled: cannot open `./tailscaled' (No such file or directory)
377469:du: cannot access './tailscaled': No such file or directory
377470:cp: cannot stat './tailscaled': No such file or directory
377471:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
377472:du: cannot access './tailscale_bb': No such file or directory
377473:cp: cannot stat './tailscale_bb': No such file or directory
377474:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
377475:du: cannot access './tailscale_bb': No such file or directory
377476:cp: cannot stat './tailscale_bb': No such file or directory
388540:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
388545:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
388550:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
393075:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
393077:./tracexec: cannot open `./tracexec' (No such file or directory)
393078:du: cannot access './tracexec': No such file or directory
393079:cp: cannot stat './tracexec': No such file or directory
394585:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
394587:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
394588:du: cannot access './tun2proxy': No such file or directory
394589:cp: cannot stat './tun2proxy': No such file or directory
395587:cp: cannot stat './ubase': No such file or directory
395588:cp: cannot stat './ubase': No such file or directory
406117:sed: can't read ./Cargo.toml: No such file or directory
406122:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
409469:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
409479:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
409480:du: cannot access './wezterm-gui': No such file or directory
409481:cp: cannot stat './wezterm-gui': No such file or directory
471517:cp: cannot stat './yggdrasil': No such file or directory
471518:cp: cannot stat './yggdrasilctl': No such file or directory
471521:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
471522:du: cannot access './yggdrasil': No such file or directory
471523:cp: cannot stat './yggdrasil': No such file or directory
471524:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
471525:du: cannot access './yggdrasilctl': No such file or directory
471526:cp: cannot stat './yggdrasilctl': No such file or directory
472098:cp: cannot stat './yq': No such file or directory
472100:./yq: cannot open `./yq' (No such file or directory)
472101:du: cannot access './yq': No such file or directory
472102:cp: cannot stat './yq': No such file or directory
478467:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/8mmriia5njgp50pxncfc8qc6ncdxgmlj-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
478479:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/8mmriia5njgp50pxncfc8qc6ncdxgmlj-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

