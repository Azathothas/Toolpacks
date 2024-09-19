```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

36819-
36820- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
36821-
36822-remote: Support for password authentication was removed on August 13, 2021.
36823-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
36824:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
36825-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
36826-cp: cannot stat './certwatcher': No such file or directory
36827-
--
136527-go: downloading github.com/sourcegraph/conc v0.2.0
136528-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
136529-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
136530-	remote: Support for password authentication was removed on August 13, 2021.
136531-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
136532:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
136533-cp: cannot stat './gfx': No such file or directory
136534-
136535-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):03(Sec)
--
401153-
401154- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy
401155-
401156-remote: Support for password authentication was removed on August 13, 2021.
401157-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
401158:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
401159-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
401160-sed: can't read ./Cargo.toml: No such file or directory
401161-error: failed to parse manifest at `/tmp/toolpacks/gyqYpDD_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

110121-
110122-
110123-
110124- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm
110125-
110126:asset `arm` not found
110127:asset `arm` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

Elapsed time:        24.5s


[-] command not found --> # Something failed to Install

3775:/tmp/en2Wk_init.sh: line 183: nuitka3: command not found
31082:musl-fts-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
54602:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
56458:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
56955:vim-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: hostname: command not found
59030:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
59876:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.3/libtool: line 1888: ldconfig: command not found
80611:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
83393:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
83499:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
83956:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
84219:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
84642:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
84884:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
88534:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
89804:gnum4-static-x86_64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
90027:musl-fts-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
94613:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
95105:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.3/libtool: line 1719: ldconfig: command not found
95107:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1719: ldconfig: command not found
103416:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
108665:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
111257:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
113490:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
117499:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
118995:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
121164:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
162820:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
170524:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
170567:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
170853:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
171843:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
172014:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
173046:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.7/libtool: line 1886: ldconfig: command not found
173872:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.0.9/libtool: line 1719: ldconfig: command not found
174146:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
174199:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
174217:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
176219:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
176249:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
176298:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
184454:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
185337:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
186450:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
188692:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
219991:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
224541:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
224590:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
224608:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
225172:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
225173:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
225174:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
225297:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
225298:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
225299:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
228579:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
238210:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
241088:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
244330:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
247330:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
247381:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
247399:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
251068:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
251130:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
260812:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
261492:pigz-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
263366:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
264412:procps-static-x86_64-unknown-linux-musl> /build/procps-3.3.17/libtool: line 1719: ldconfig: command not found
299048:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
301000:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
301069:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
323183:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
325091:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
327511:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
331092:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
333622:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
337845:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
340394:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
348250:gnum4-static-x86_64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
348568:musl-fts-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
357396:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.1/libtool: line 1890: ldconfig: command not found
358254:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
358617:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
360736:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
363150:keyutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
363226:keyutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
364354:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
365654:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
365849:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
367183:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
367525:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
368356:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
370773:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
370853:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
370924:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
371013:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
371105:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
380996:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
381049:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
381067:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
384401:gnum4-static-x86_64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
384773:musl-fts-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
390325:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
394898:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
396753:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
399245:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
399744:vim-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: hostname: command not found
501299:pcre-static-x86_64-unknown-linux-musl> /build/pcre-8.45/libtool: line 1861: ldconfig: command not found


[-] Dynamically Linked --> # Not Statically Linked

63:binfetch:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
566:netexec_dynamic:                 ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=04804d3c31218f938502cbed5cdd1af09d59a8f0, for GNU/Linux 2.6.32, stripped
625:pathbuster:                      ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
663:promtail:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=40740f81c49565dcf5634273162551ef921c8e5c, for GNU/Linux 3.2.0, stripped
762:rqbit:                           ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped


[-] Incorrect Arch --> # Not for x86_64

360:gost:                            ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
752:rippkgs-index.sqlite:            SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2


[-] No such file or directory # Usually Because Build Failures

20284:cp: cannot stat './berty': No such file or directory
21362:binutils-static-x86_64-unknown-linux-musl> checking if the linker (x86_64-unknown-linux-musl-ld) is GNU ld... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
21363:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
21367:binutils-static-x86_64-unknown-linux-musl> checking the name lister (/nix/store/kgc6yccw7qf063fyjjjql4qk4mnmscdd-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm) interface... /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
21388:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
21411:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
22693:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/bfd/configure: line 6938: /usr/bin/file: No such file or directory
23030:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
23229:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libctf/configure: line 9376: /usr/bin/file: No such file or directory
29742:musl-fts-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
36826:cp: cannot stat './certwatcher': No such file or directory
45324:cmp: .git/hooks/applypatch-msg: No such file or directory
45325:cmp: .git/hooks/commit-msg: No such file or directory
45326:cmp: .git/hooks/pre-applypatch: No such file or directory
45327:cmp: .git/hooks/pre-commit: No such file or directory
51349:bash: line 17: ./configure: No such file or directory
51350:bash: line 25: ./configure: No such file or directory
51352:bash: line 30: ./configure: No such file or directory
51353:bash: line 38: ./configure: No such file or directory
63634:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
63637:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
63640:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
89627:musl-fts-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
96362:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
100060:cp: cannot stat './elvish': No such file or directory
102538:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
103126:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
111812:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iyi8z1j8vljd6fbiizhyc09567j86cgz-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
114236:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
114251:binutils-static-x86_64-unknown-linux-musl> checking for shared library run path origin... /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
114256:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
114268:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
114284:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... checking for limits.h... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
114738:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
114745:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
114751:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
117182:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/bfd/configure: line 6938: /usr/bin/file: No such file or directory
118428:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
118806:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libctf/configure: line 9376: /usr/bin/file: No such file or directory
120966:gcc-static-x86_64-unknown-linux-musl> /nix/store/dwhbqwrvr5dj76xf28smnfrfxv8arx90-stdenv-linux/setup: line 258: /nix/store/b74nxf0yn2dzha02mgdxyklaqjaijzqp-binutils-wrapper-2.42/nix-support/libc-ldflags-before: No such file or directory
120967:gcc-static-x86_64-unknown-linux-musl> /nix/store/dwhbqwrvr5dj76xf28smnfrfxv8arx90-stdenv-linux/setup: line 258: /nix/store/8k1rdgsbvc3mgi2xdsafiymvf6bzgxnl-x86_64-unknown-linux-musl-binutils-wrapper-2.42/nix-support/libc-ldflags-before: No such file or directory
121953:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
124753:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
124943:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
127129:gcc-static-x86_64-unknown-linux-musl> checking for sys/stat.h... /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
127130:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
127215:gcc-static-x86_64-unknown-linux-musl> checking fcntl.h usability... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
127327:gcc-static-x86_64-unknown-linux-musl> checking sys/sysctl.h presence... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
128423:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
129601:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
129668:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
131549:gdb-static-x86_64-unknown-linux-musl> checking for int_least32_t... /build/gdb-15.1/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
131552:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
132878:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/bfd/configure: line 6938: /usr/bin/file: No such file or directory
133763:gdb-static-x86_64-unknown-linux-musl> checking ptrace.h presence... /build/gdb-15.1/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
134399:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/gdb/configure: line 7248: /usr/bin/file: No such file or directory
134446:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
135748:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
135963:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
135964:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
135965:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
135966:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
135967:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
136533:cp: cannot stat './gfx': No such file or directory
151723:cp: cannot stat './gost-bin': No such file or directory
152738:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
152992:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
153025:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
153059:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
153084:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
176362:iptables-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /sbin/ldconfig: No such file or directory
178959:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
178961:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
178962:du: cannot access './ironrdp-client': No such file or directory
178963:cp: cannot stat './ironrdp-client': No such file or directory
185060:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
185062:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
185551:cp: cannot stat './ksubdomain': No such file or directory
185552:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
185553:du: cannot access './ksubdomain': No such file or directory
185554:cp: cannot stat './ksubdomain': No such file or directory
220451:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
232573:/tmp/0vgdO_build.sh: line 30: /download/ncdu-2.5-linux-x86_64.tar.gz: No such file or directory
241229:rsync: [sender] change_dir "/share" failed: No such file or directory (2)
242833:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
242834:du: cannot access './result/bin/ncat': No such file or directory
242836:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
242837:du: cannot access './result/bin/nmap': No such file or directory
242839:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
242840:du: cannot access './result/bin/nping': No such file or directory
242841:cp: cannot stat './result/bin/ncat': No such file or directory
242842:cp: cannot stat './result/bin/nmap': No such file or directory
242843:cp: cannot stat './result/bin/nping': No such file or directory
245817:find: ‘./bin’: No such file or directory
245818:find: ‘./bin’: No such file or directory
245819:find: ‘./bin’: No such file or directory
245821:rsync: [sender] change_dir "/tmp/toolpacks/f0hIUXv_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
245827:rsync: [sender] change_dir "/tmp/toolpacks/f0hIUXv_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
245833:rsync: [sender] change_dir "/tmp/toolpacks/f0hIUXv_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
245839:rsync: [sender] change_dir "/tmp/toolpacks/f0hIUXv_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
245844:/tmp/baseutils_x86_64/openssh/*: cannot open `/tmp/baseutils_x86_64/openssh/*' (No such file or directory)
248095:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
248096:du: cannot access './result/bin/openvpn': No such file or directory
248097:cp: cannot stat './result/bin/openvpn': No such file or directory
249393:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
251543:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
251548:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
251555:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
259193:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
259194:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
259197:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
259198:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
259201:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
259202:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
261909:cp: cannot stat './pktstat': No such file or directory
261911:./pktstat: cannot open `./pktstat' (No such file or directory)
261912:du: cannot access './pktstat': No such file or directory
261913:cp: cannot stat './pktstat': No such file or directory
299360:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
299361:./pwait: cannot open `./pwait' (No such file or directory)
299362:du: cannot access './pwait': No such file or directory
299363:cp: cannot stat './pwait': No such file or directory
301416:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
301421:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
301426:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
314113:cp: cannot stat './bin/qemu-nios2': No such file or directory
319203:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
319204:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
319558:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
319609:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
319610:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
321099:cp: cannot stat './rescope': No such file or directory
322524:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
323665:result/bin/rsync: cannot open `result/bin/rsync' (No such file or directory)
323666:du: cannot access 'result/bin/rsync': No such file or directory
323667:cp: cannot stat 'result/bin/rsync': No such file or directory
323668:cp: cannot stat 'result/bin/rsync-ssl': No such file or directory
343569:./samu: cannot open `./samu' (No such file or directory)
343570:du: cannot access './samu': No such file or directory
343571:cp: cannot stat './samu': No such file or directory
343572:cp: cannot stat './samu': No such file or directory
343805:cp: cannot stat './sbase': No such file or directory
343806:cp: cannot stat './sbase': No such file or directory
346344:aclocal-1.16: warning: couldn't open directory 'm4': No such file or directory
347243:cp: cannot stat './sf': No such file or directory
348075:musl-fts-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
353291:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
353293:./smenu: cannot open `./smenu' (No such file or directory)
353294:du: cannot access './smenu': No such file or directory
353295:cp: cannot stat './smenu': No such file or directory
354568:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
354573:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
354578:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
356055:cp: cannot stat './spoof-dpi': No such file or directory
357958:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
360235:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
363138:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iyi8z1j8vljd6fbiizhyc09567j86cgz-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
363149:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
365024:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
366958:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... checking command to parse /nix/store/kgc6yccw7qf063fyjjjql4qk4mnmscdd-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
366977:binutils-static-x86_64-unknown-linux-musl> checking for shared library run path origin... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
366981:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
366982:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
366987:binutils-static-x86_64-unknown-linux-musl> checking for catalogs to be installed... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
367006:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
367015:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
367017:binutils-static-x86_64-unknown-linux-musl> checking for sys/file.h... /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
367018:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
367028:binutils-static-x86_64-unknown-linux-musl> checking for sys/file.h... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
369792:libpfm-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
370647:libpfm-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
371143:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
371144:du: cannot access './result/bin/stress-ng': No such file or directory
371145:cp: cannot stat './result/bin/stress-ng': No such file or directory
375208:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
375217:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
376031:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
376032:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
384208:musl-fts-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
385301:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
385307:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
385312:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
391774:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
391776:./tracexec: cannot open `./tracexec' (No such file or directory)
391777:du: cannot access './tracexec': No such file or directory
391778:cp: cannot stat './tracexec': No such file or directory
393986:cp: cannot stat './ubase': No such file or directory
393987:cp: cannot stat './ubase': No such file or directory
394608:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
401160:sed: can't read ./Cargo.toml: No such file or directory
401165:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
404296:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
404306:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
404307:du: cannot access './wezterm-gui': No such file or directory
404308:cp: cannot stat './wezterm-gui': No such file or directory
499036:cp: cannot stat './yq': No such file or directory
499038:./yq: cannot open `./yq' (No such file or directory)
499039:du: cannot access './yq': No such file or directory
499040:cp: cannot stat './yq': No such file or directory
502684:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/4zi0kvynzy1w4xnx7kshgm4pwlp36cli-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.
502696:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/4zi0kvynzy1w4xnx7kshgm4pwlp36cli-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

