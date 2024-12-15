```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

26325-
26326- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-12-09 (11:13:51 PM) UTC]
26327-
26328-remote: Support for password authentication was removed on August 13, 2021.
26329-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
26330:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
26331-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
26332-cp: cannot stat './certwatcher': No such file or directory
26333-
--
160003-go: downloading github.com/sourcegraph/conc v0.2.0
160004-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
160005-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
160006-	remote: Support for password authentication was removed on August 13, 2021.
160007-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
160008:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
160009-cp: cannot stat './gfx': No such file or directory
160010-
160011-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):03(Sec)
--
430674-
430675- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-12-10 (03:08:58 PM) UTC]
430676-
430677-remote: Support for password authentication was removed on August 13, 2021.
430678-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
430679:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
430680-info: component 'rust-std' for target 'aarch64-unknown-linux-musl' is up to date
430681-sed: can't read ./Cargo.toml: No such file or directory
430682-error: failed to parse manifest at `/tmp/toolpacks/clMqKdR_linux_aarch64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

215407-
215408-
215409-
215410- [+] (Building | Fetching) linutil :: https://github.com/ChrisTitusTech/linutil [Tuesday, 2024-12-10 (07:14:46 AM) UTC]
215411-
215412:asset `aarch64` not found
--
333301-
333302-
333303-
333304- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-12-10 (11:50:54 AM) UTC]
333305-
333306:asset `ruri` not found
--
353513-
353514-
353515-
353516- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-12-10 (12:14:05 PM) UTC]
353517-
353518:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):36(Sec)


[-] command not found --> # Something failed to Install

63956:cpufetch-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: git: command not found
68984:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
69518:vim-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: hostname: command not found
71495:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
72366:cryptsetup-static-aarch64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
94877:libXau-static-aarch64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
94975:libXdmcp-static-aarch64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
95451:libICE-static-aarch64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
95786:libapparmor-static-aarch64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
96134:libSM-static-aarch64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
96376:libxcb-static-aarch64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
100012:dbus-static-aarch64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
101838:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
102065:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
102263:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
107775:ck-static-aarch64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
108255:ldns-static-aarch64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
108257:ldns-static-aarch64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
116751:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
129990:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
131918:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
134073:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
137955:mpfr-static-aarch64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
141198:libmpc-static-aarch64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
145132:source-highlight-static-aarch64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
199539:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
199582:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
199865:iperf-static-aarch64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
200680:libmnl-static-aarch64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
200839:libnfnetlink-static-aarch64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
201904:libnftnl-static-aarch64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
202131:libnetfilter_conntrack-static-aarch64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
202879:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
202931:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
202949:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
204909:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
204940:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
204986:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
212603:kmod-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
233403:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
233452:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
233470:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
234003:masscan-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: which: command not found
234004:masscan-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: which: command not found
234005:masscan-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: git: command not found
234128:masscan-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: which: command not found
234129:masscan-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: which: command not found
234130:masscan-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: git: command not found
242947:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
258035:numactl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
266652:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
266704:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
266722:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
271389:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
271550:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
271611:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
283790:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
284471:pigz-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: which: command not found
286804:procps-static-aarch64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
312186:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
312342:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
312403:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
332575:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
334856:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
337276:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
340857:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
343385:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
347606:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
350154:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
359171:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
359373:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
359586:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
379294:squashfs-tools-ng-static-aarch64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
380136:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
380507:squashfuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
383700:libunwind-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
385845:keyutils-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
386116:keyutils-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
386245:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
389551:libomxil-bellagio-static-aarch64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
390138:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
390517:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
390610:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
391533:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
400966:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
401015:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
401033:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
405391:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
405668:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
405909:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
414705:libevent-static-aarch64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
422936:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
428621:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
429147:vim-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: hostname: command not found
501888:pcre-static-aarch64-unknown-linux-musl> /build/pcre-8.45/libtool: line 1861: ldconfig: command not found


[-] Dynamically Linked --> # Not Statically Linked

240:cron:                              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
244:crontab:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
397:filan:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
674:linuxdeploy.no_strip:              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=0cb09c8cecdebf11ffcbb472525d94d86d6400b9, stripped
776:netexec_dynamic:                   ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=9ebfef2954efdd37251584cede0b0210b9675c20, for GNU/Linux 3.7.0, stripped
895:procan:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
898:promtail:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=e999f13cace2c4766e1c5826f975b91fb226de82, for GNU/Linux 3.7.0, stripped
1028:rqbit:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
1118:socat:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
1308:websocat:                          ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /system/bin/linker64, stripped


[-] Incorrect Arch --> # Not for aarch64

3:METADATA.AIO.db:                   SQLite 3.x database, last written using SQLite version 3046000, file counter 6, database pages 1181, cookie 0x3, schema 4, UTF-8, version-valid-for 6
5:METADATA.AIO.db.xz:                7-zip archive data, version 0.4
7:METADATA.AIO.db.zstd:              Zstandard compressed data (v0.8+), Dictionary ID: None
10:METADATA.AIO.json.xz:              7-zip archive data, version 0.4
12:METADATA.AIO.json.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
15:METADATA.AIO.min.json.xz:          7-zip archive data, version 0.4
17:METADATA.AIO.min.json.zstd:        Zstandard compressed data (v0.8+), Dictionary ID: None
19:METADATA.AIO.soar.capnp:           data
21:METADATA.AIO.soar.capnp.xz:        7-zip archive data, version 0.4
23:METADATA.AIO.soar.capnp.zstd:      Zstandard compressed data (v0.8+), Dictionary ID: None
27:METADATA.AIO.toml.xz:              7-zip archive data, version 0.4
29:METADATA.AIO.toml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
33:METADATA.AIO.yaml.xz:              7-zip archive data, version 0.4
35:METADATA.AIO.yaml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
42:age.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
46:aggligator.preview.png:            PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
51:albafetch.preview.png:             PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
53:algernon.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
62:amass.preview.png:                 PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
82:archey.preview.png:                PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
86:arduino-cli.preview.png:           PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
93:asn.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
97:assh.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
106:bandwhich.preview.png:             PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
107:base.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
111:batcat.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
119:berty.preview.png:                 JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
122:bin.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
129:binocle.preview.png:               PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
131:bita.preview.png:                  PNG image data, 512 x 184, 8-bit/color RGBA, non-interlaced
146:broot.preview.png:                 PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
149:btop.preview.png:                  PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
157:caddy.preview.png:                 PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
168:certstream-server-go.preview.png:  PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
169:certstream.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
170:certstream.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
171:certstream.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
172:certstream.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
173:certstream.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
174:certstream.preview.png:            GIF image data, version 89a, 1920 x 1080
191:cherrybomb.preview.png:            PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
197:circumflex.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
209:cloudfox.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
213:cmd-wrapped.preview.png:           PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
216:cocogitto.preview.png:             PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
219:comb.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
220:comb.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
221:comb.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
222:comb.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
223:comb.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
224:comb.preview.png:                  GIF image data, version 89a, 1920 x 1080
239:croc.preview.png:                  JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
258:cut-cdn.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
260:cutlines.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
261:cutlines.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
262:cutlines.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
263:cutlines.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
264:cutlines.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
265:cutlines.preview.png:              GIF image data, version 89a, 1920 x 1080
269:czkawka.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
273:dagu.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
274:daktilo.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
276:dalfox.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
299:devpod.preview.png:                PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
311:dnstake.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
326:dotenv-linter.preview.png:         PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
336:duf.preview.png:                   PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
340:dvc.preview.png:                   PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
357:elinks:                            ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
358:elinks-lite:                       ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
363:encrypted-dns-server.preview.png:  PNG image data, 627 x 119, 8-bit colormap, non-interlaced
377:eza.preview.png:                   PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
388:feroxbuster.preview.png:           PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
395:fget.preview.png:                  GIF image data, version 89a, 1920 x 1080
402:findomain.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
406:flawz.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
408:fnm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
410:fq.preview.png:                    PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
412:freeze.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
419:fx.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
422:fzf.preview.png:                   PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
427:gdu.preview.png:                   PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
437:getJS.preview.png:                 GIF image data, version 89a, 1920 x 1080
444:gh-dash.preview.png:               PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
445:gh.preview.png:                    PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
452:git-cliff.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
462:gitea.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
469:gitoxide.preview.png:              PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
472:gitpod-cli.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
475:gitui.preview.png:                 PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
479:glow.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
486:goaccess.preview.png:              PNG image data, 725 x 411, 4-bit colormap, non-interlaced
507:gosmee.preview.png:                PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
513:gowitness.preview.png:             PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
516:gpg-tui.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
520:grex.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
526:gsocket.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
528:gum.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
532:hacker-scoper.preview.png:         PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
537:hakrawler.preview.png:             PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
540:halp.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
543:haylxon.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
557:hexyl.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
565:htb-cli.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
572:huggingface-cli.preview.png:       PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
574:hugo.preview.png:                  PNG image data, 900 x 450, 8-bit colormap, non-interlaced
579:husarnet.preview.png:              PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
584:hyperfine.preview.png:             PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
585:hypervisor-fw:                     Linux kernel ARM64 boot executable Image, little-endian
587:hysp.preview.png:                  PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
596:inscope.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
597:inscope.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
598:inscope.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
599:inscope.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
600:inscope.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
601:inscope.preview.png:               GIF image data, version 89a, 1920 x 1080
605:intermodal.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
617:istio.preview.png:                 PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
620:jaeles.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
623:jc.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
628:jless.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
641:jwt-hack.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
643:k9s.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
654:kitty.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
656:kmon.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
663:kubo.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
666:lazydocker.preview.png:            PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
672:libtree.preview.png:               PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
677:listmonk.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
689:lorien.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
698:macchina.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
701:magick.preview.png:                PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
708:mantra.preview.png:                PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
712:massdns.preview.png:               PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
718:mdcat.preview.png:                 PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
723:meli.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
728:micro.preview.png:                 PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
731:miller.preview.png:                PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
736:miniserve.preview.png:             PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
760:mubeng.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
775:netexec.preview.png:               PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
792:ngocok.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
794:nicotine-plus.preview.png:         PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
802:noir.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
806:noseyparker.preview.png:           PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
822:ockam.preview.png:                 PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
824:oha.preview.png:                   PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
838:osmedeus.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
842:ov.preview.png:                    PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
850:pdfcpu.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
858:pfetch-rs.preview.png:             PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
860:pgrok.preview.png:                 PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
875:pixi.preview.png:                  PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
877:pkg.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
881:planor.preview.png:                PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
883:pls.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
886:podsync.preview.png:               PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
889:ppfuzz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
891:ppsspp.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
900:proot.preview.png:                 PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
909:puredns.preview.png:               PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
915:qbittorrent-nox.preview.png:       JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
953:qsv.preview.png:                   PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
956:quotes-escaper.preview-0.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
957:quotes-escaper.preview-1.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
958:quotes-escaper.preview-2.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
959:quotes-escaper.preview-3.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
960:quotes-escaper.preview-4.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
961:quotes-escaper.preview.png:        GIF image data, version 89a, 1920 x 1080
964:rage.preview.png:                  PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
967:rate-limit-checker.preview.png:    GIF image data, version 89a, 1920 x 1080
970:rathole.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
972:rattler-build.preview.png:         PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
975:rclone.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
978:realm-tavern.preview.png:          PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
982:redguard.preview.png:              PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
995:rescope.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
997:resdns.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
998:resdns.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
999:resdns.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1000:resdns.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1001:resdns.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1002:resdns.preview.png:                GIF image data, version 89a, 1920 x 1080
1006:resto.preview.png:                 PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
1008:reviewdog.preview.png:             PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
1011:revive.preview.png:                PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1037:runst.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1039:ruri.preview.png:                  PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1041:rust-hypervisor-firmware:          Linux kernel ARM64 boot executable Image, little-endian
1045:rustscan.preview.png:              PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1055:sadf:                              ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
1062:scopegen.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1063:scopegen.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1064:scopegen.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1065:scopegen.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1066:scopegen.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1067:scopegen.preview.png:              GIF image data, version 89a, 1920 x 1080
1069:scopeview.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1070:scopeview.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1071:scopeview.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1072:scopeview.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1073:scopeview.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1074:scopeview.preview.png:             GIF image data, version 89a, 1920 x 1080
1092:shell2http.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1110:smap.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1113:smartdns.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1115:sn0int.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1120:soft-serve.preview.png:            JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1138:sshportal.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1141:sshx.preview.png:                  PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1147:starship.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1149:steampipe.preview.png:             PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1150:step.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1154:stree.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1164:subxtract.preview.png:             GIF image data, version 89a, 1920 x 1080
1184:systeroid.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1188:tailscale.preview.png:             PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1193:tailspin.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1203:termshark.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1208:tidy-viewer.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1218:tok.preview-0.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1219:tok.preview-1.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1220:tok.preview-2.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1221:tok.preview-3.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1222:tok.preview-4.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1223:tok.preview.png:                   GIF image data, version 89a, 1920 x 1080
1229:traefik.preview.png:               PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1233:trufflehog.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1244:tut.preview.png:                   PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1246:txeh.preview.png:                  PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1254:udpx.preview.png:                  PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1269:v2raya.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1276:vhs.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1278:viddy.preview.png:                 PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1289:vopono.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1293:vtm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1304:watchexec.preview.png:             PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1358:xplr.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1362:yabs.sh.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1366:yazi.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1368:yggdrasil.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1374:yt-dlp.preview.png:                PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1377:z-tokens.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1382:zellij.preview.png:                PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1393:zoxide.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1394:zoxide.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1395:zoxide.preview.png:                GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

929:cp: cannot stat './target//release/agrind': No such file or directory
3155:  No such file or directory (os error 2)
3156:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
3722:cp: cannot stat './aptly-bin': No such file or directory
3724:./aptly: cannot open `./aptly' (No such file or directory)
3725:du: cannot access './aptly': No such file or directory
3726:cp: cannot stat './aptly': No such file or directory
15671:Error: open /tmp/tmp.QvNg6Wq1nq/temp.yaml: no such file or directory
15672:Error: open /tmp/tmp.QvNg6Wq1nq/temp.yaml: no such file or directory
15673:Error: open /tmp/tmp.QvNg6Wq1nq/temp.yaml: no such file or directory
15674:Error: open /tmp/tmp.QvNg6Wq1nq/temp.yaml: no such file or directory
15675:Error: open /tmp/tmp.QvNg6Wq1nq/temp.yaml: no such file or directory
15793:Error: open /tmp/tmp.3EY4RM122W/temp.yaml: no such file or directory
15794:Error: open /tmp/tmp.3EY4RM122W/temp.yaml: no such file or directory
15795:Error: open /tmp/tmp.3EY4RM122W/temp.yaml: no such file or directory
15796:Error: open /tmp/tmp.3EY4RM122W/temp.yaml: no such file or directory
15797:Error: open /tmp/tmp.3EY4RM122W/temp.yaml: no such file or directory
18197:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
26332:cp: cannot stat './certwatcher': No such file or directory
35817:cp: cannot stat './cloudfox': No such file or directory
35921:cp: cannot stat './cobalt': No such file or directory
35922:./cobalt: cannot open `./cobalt' (No such file or directory)
35923:du: cannot access './cobalt': No such file or directory
35924:cp: cannot stat './cobalt': No such file or directory
42060:cmp: .git/hooks/applypatch-msg: No such file or directory
42061:cmp: .git/hooks/commit-msg: No such file or directory
42062:cmp: .git/hooks/pre-applypatch: No such file or directory
42063:cmp: .git/hooks/pre-commit: No such file or directory
54072:cmp: .git/hooks/applypatch-msg: No such file or directory
54073:cmp: .git/hooks/commit-msg: No such file or directory
54074:cmp: .git/hooks/pre-applypatch: No such file or directory
54075:cmp: .git/hooks/pre-commit: No such file or directory
76837:dateutils-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
76840:dateutils-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
76843:dateutils-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
93254:cp: cannot stat './dblab': No such file or directory
93255:./dblab: cannot open `./dblab' (No such file or directory)
93256:du: cannot access './dblab': No such file or directory
93257:cp: cannot stat './dblab': No such file or directory
101384:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
107464:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/dizi': No such file or directory
108736:cp: cannot stat './dnspyre': No such file or directory
108738:./dnspyre: cannot open `./dnspyre' (No such file or directory)
108739:du: cannot access './dnspyre': No such file or directory
108740:cp: cannot stat './dnspyre': No such file or directory
109143:doas-static-aarch64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
112662:cp: cannot stat './eget': No such file or directory
112663:./eget: cannot open `./eget' (No such file or directory)
112664:du: cannot access './eget': No such file or directory
112665:cp: cannot stat './eget': No such file or directory
113871:cp: cannot stat './entropy': No such file or directory
113872:./entropy: cannot open `./entropy' (No such file or directory)
113873:du: cannot access './entropy': No such file or directory
113874:cp: cannot stat './entropy': No such file or directory
115893:exfatprogs-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
116465:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
129503:rsync: [sender] change_dir "/tmp/toolpacks/saq3d4v_linux_aarch64/./result/bin" failed: No such file or directory (2)
129704:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
130087:rsync: [sender] change_dir "/tmp/toolpacks/BdGm4rc_linux_aarch64/./result/bin" failed: No such file or directory (2)
132555:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iilz2jhiw7h917ri4zfvxkw8qkal38px-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
142999:readline-static-aarch64-unknown-linux-musl> /nix/store/wsb9v0f85w29qic8flwwj39x59xxhxrb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
143004:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
143009:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
144127:gcc-static-aarch64-unknown-linux-musl> /nix/store/h7sl5vl47i4b1xjfx9gclhhchvss8dvp-stdenv-linux/setup: line 261: /nix/store/8hcwpiazwyh2kn29az830pvlfdvyxs2k-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
144128:gcc-static-aarch64-unknown-linux-musl> /nix/store/h7sl5vl47i4b1xjfx9gclhhchvss8dvp-stdenv-linux/setup: line 261: /nix/store/dzkjzim3klwd1bwl7am6sa7c3x2ij20b-aarch64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
158917:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159128:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159132:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159133:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159134:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159135:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160009:cp: cannot stat './gfx': No such file or directory
173771:cp: cannot stat './go-audit': No such file or directory
173772:./go-audit: cannot open `./go-audit' (No such file or directory)
173773:du: cannot access './go-audit': No such file or directory
173774:cp: cannot stat './go-audit': No such file or directory
174009:cp: cannot stat './gocryptfs': No such file or directory
174010:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
174013:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
174014:du: cannot access './gocryptfs': No such file or directory
174015:cp: cannot stat './gocryptfs': No such file or directory
174016:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
174017:du: cannot access './gocryptfs-xray': No such file or directory
174018:cp: cannot stat './gocryptfs-xray': No such file or directory
177226:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/gpg-tui': No such file or directory
177489:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
177524:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
177561:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
177583:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
187339:cp: cannot stat './target/aarch64-unknown-linux-musl/release/horust': No such file or directory
192264:rm: cannot remove './rust-toolchain.toml': No such file or directory
199938:cp: cannot stat './ipinfo-bin': No such file or directory
199939:./ipinfo: cannot open `./ipinfo' (No such file or directory)
199940:du: cannot access './ipinfo': No such file or directory
199941:cp: cannot stat './ipinfo': No such file or directory
199942:cp: cannot stat '/tmp/toolpack_aarch64/ipinfo': No such file or directory
205050:iptables-static-aarch64-unknown-linux-musl> /nix/store/bf1ypxhl9j3p5q3w1jqg89l3zc7c5ns0-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
207587:cp: cannot stat './target/aarch64-unknown-linux-musl/release/ironrdp-client': No such file or directory
207589:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
207590:du: cannot access './ironrdp-client': No such file or directory
207591:cp: cannot stat './ironrdp-client': No such file or directory
211940:cp: cannot stat './katana': No such file or directory
211941:./katana: cannot open `./katana' (No such file or directory)
211942:du: cannot access './katana': No such file or directory
211943:cp: cannot stat './katana': No such file or directory
212326:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
212328:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
212760:rm: cannot remove './rust-toolchain.toml': No such file or directory
212954:cp: cannot stat './ksubdomain': No such file or directory
212955:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
212956:du: cannot access './ksubdomain': No such file or directory
212957:cp: cannot stat './ksubdomain': No such file or directory
214640:cp: cannot stat './libaws': No such file or directory
214642:./libaws: cannot open `./libaws' (No such file or directory)
214643:du: cannot access './libaws': No such file or directory
214644:cp: cannot stat './libaws': No such file or directory
214645:cp: cannot stat './libaws': No such file or directory
227524:lsof-static-aarch64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
231471:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
231473:rsync: [sender] link_stat "/tmp/toolpacks/zsQTcts_linux_aarch64/magick_appbundle.no_strip" failed: No such file or directory (2)
235193:cp: cannot stat './target/aarch64-unknown-linux-musl/release/mdcat': No such file or directory
236000:cp: cannot stat './mirrorbits': No such file or directory
236002:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
236003:du: cannot access './mirrorbits': No such file or directory
236004:cp: cannot stat './mirrorbits': No such file or directory
243704:rsync: [sender] change_dir "/tmp/toolpacks/4Bb8nso_linux_aarch64/./result/bin" failed: No such file or directory (2)
243710:rsync: [sender] change_dir "/tmp/toolpacks/4Bb8nso_linux_aarch64/./result/libexec/mtd-utils" failed: No such file or directory (2)
248001:sh: cd: line 5: can't cd to ./naabu/v2: No such file or directory
248004:cp: cannot stat './naabu-bin': No such file or directory
248005:./naabu: cannot open `./naabu' (No such file or directory)
248006:du: cannot access './naabu': No such file or directory
248007:cp: cannot stat './naabu': No such file or directory
248292:/tmp/ya3jE_build.sh: line 30: /download/ncdu-2.7-linux-aarch64.tar.gz: No such file or directory
253808:cp: cannot stat './nezha-dashboard': No such file or directory
253813:cp: cannot stat './nezha-agent': No such file or directory
253814:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
253815:du: cannot access './nezha-dashboard': No such file or directory
253816:cp: cannot stat './nezha-dashboard': No such file or directory
253817:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
253818:du: cannot access './nezha-agent': No such file or directory
253819:cp: cannot stat './nezha-agent': No such file or directory
254187:/tmp/toolpack_aarch64/ngrok: cannot open `/tmp/toolpack_aarch64/ngrok' (No such file or directory)
254188:du: cannot access '/tmp/toolpack_aarch64/ngrok': No such file or directory
255306:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
255307:du: cannot access './result/bin/ncat': No such file or directory
255309:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
255310:du: cannot access './result/bin/nmap': No such file or directory
255312:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
255313:du: cannot access './result/bin/nping': No such file or directory
255314:cp: cannot stat './result/bin/ncat': No such file or directory
255315:cp: cannot stat './result/bin/nmap': No such file or directory
255316:cp: cannot stat './result/bin/nping': No such file or directory
265232:find: ‘./bin’: No such file or directory
265233:find: ‘./bin’: No such file or directory
265234:find: ‘./bin’: No such file or directory
265236:rsync: [sender] change_dir "/tmp/toolpacks/G6N6pmV_linux_aarch64/static-cross-openssh/./bin" failed: No such file or directory (2)
265242:rsync: [sender] change_dir "/tmp/toolpacks/G6N6pmV_linux_aarch64/static-cross-openssh/./etc" failed: No such file or directory (2)
265248:rsync: [sender] change_dir "/tmp/toolpacks/G6N6pmV_linux_aarch64/static-cross-openssh/./libexec" failed: No such file or directory (2)
265254:rsync: [sender] change_dir "/tmp/toolpacks/G6N6pmV_linux_aarch64/static-cross-openssh/./sbin" failed: No such file or directory (2)
267412:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
267413:du: cannot access './result/bin/openvpn': No such file or directory
267414:cp: cannot stat './result/bin/openvpn': No such file or directory
274948:readline-static-aarch64-unknown-linux-musl> /nix/store/wsb9v0f85w29qic8flwwj39x59xxhxrb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
274953:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
274958:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
282056:/tmp/toolpack_aarch64/php: cannot open `/tmp/toolpack_aarch64/php' (No such file or directory)
282057:du: cannot access '/tmp/toolpack_aarch64/php': No such file or directory
282060:/tmp/toolpack_aarch64/php-fpm: cannot open `/tmp/toolpack_aarch64/php-fpm' (No such file or directory)
282061:du: cannot access '/tmp/toolpack_aarch64/php-fpm': No such file or directory
282064:/tmp/toolpack_aarch64/php-micro: cannot open `/tmp/toolpack_aarch64/php-micro' (No such file or directory)
282065:du: cannot access '/tmp/toolpack_aarch64/php-micro': No such file or directory
285121:cp: cannot stat './pktstat': No such file or directory
285123:./pktstat: cannot open `./pktstat' (No such file or directory)
285124:du: cannot access './pktstat': No such file or directory
285125:cp: cannot stat './pktstat': No such file or directory
304797:/usr/lib/gcc/aarch64-alpine-linux-musl/14.2.0/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
304800:/usr/lib/gcc/aarch64-alpine-linux-musl/14.2.0/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
310096:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
310097:./pwait: cannot open `./pwait' (No such file or directory)
310098:du: cannot access './pwait': No such file or directory
310099:cp: cannot stat './pwait': No such file or directory
312661:readline-static-aarch64-unknown-linux-musl> /nix/store/wsb9v0f85w29qic8flwwj39x59xxhxrb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
312666:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
312671:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
318863:cp: cannot stat '': No such file or directory
318912:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
324079:cp: cannot stat './bin/qemu-cris': No such file or directory
324080:cp: cannot stat './bin/qemu-nios2': No such file or directory
328573:cp: cannot stat './target/aarch64-unknown-linux-musl/release/golem': No such file or directory
328574:cp: cannot stat './target/aarch64-unknown-linux-musl/release/imix': No such file or directory
328925:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
328926:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
330511:cp: cannot stat './rescope': No such file or directory
331052:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/ripgen': No such file or directory
331944:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
333309:find: ‘/tmp/toolpack_aarch64/ruri’: No such file or directory
353338:./samu: cannot open `./samu' (No such file or directory)
353339:du: cannot access './samu': No such file or directory
353340:cp: cannot stat './samu': No such file or directory
353341:cp: cannot stat './samu': No such file or directory
353502:./sbase-box: cannot open `./sbase-box' (No such file or directory)
353503:du: cannot access './sbase-box': No such file or directory
353504:cp: cannot stat './sbase-box': No such file or directory
353505:cp: cannot stat './sbase-box': No such file or directory
353506:cp: cannot stat './sbase': No such file or directory
353507:cp: cannot stat './sbase': No such file or directory
353617:find: ‘./target/aarch64-unknown-linux-musl/release’: No such file or directory
353620:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
353621:du: cannot access '/build-bins/*': No such file or directory
358596:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
364515:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
364517:./smenu: cannot open `./smenu' (No such file or directory)
364518:du: cannot access './smenu': No such file or directory
364519:cp: cannot stat './smenu': No such file or directory
376467:readline-static-aarch64-unknown-linux-musl> /nix/store/wsb9v0f85w29qic8flwwj39x59xxhxrb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
376472:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
376477:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
377957:cp: cannot stat './spoof-dpi': No such file or directory
379850:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
383191:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
385844:keyutils-static-aarch64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
386053:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iilz2jhiw7h917ri4zfvxkw8qkal38px-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
390671:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
391172:musl-obstack-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
391618:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
391619:du: cannot access './result/bin/stress-ng': No such file or directory
391620:cp: cannot stat './result/bin/stress-ng': No such file or directory
395593:find: ‘/usr/src/linux-headers-6.1.0-25-arm64’: No such file or directory
395602:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
397407:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/taplo': No such file or directory
404767:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
412520:readline-static-aarch64-unknown-linux-musl> /nix/store/wsb9v0f85w29qic8flwwj39x59xxhxrb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
412526:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
412531:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/5i8qs5v21kn9rigfyskhafv45sdcd0ya-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
417589:  = note: No such file or directory (os error 2)
417742:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tracexec': No such file or directory
417744:./tracexec: cannot open `./tracexec' (No such file or directory)
417745:du: cannot access './tracexec': No such file or directory
417746:cp: cannot stat './tracexec': No such file or directory
419230:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tun2proxy': No such file or directory
419232:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
419233:du: cannot access './tun2proxy': No such file or directory
419234:cp: cannot stat './tun2proxy': No such file or directory
420202:cp: cannot stat './ubase': No such file or directory
420203:cp: cannot stat './ubase': No such file or directory
430681:sed: can't read ./Cargo.toml: No such file or directory
430686:cp: cannot stat './target/aarch64-unknown-linux-musl/release/vproxy': No such file or directory
434051:cp: cannot stat './target/aarch64-unknown-linux-musl/release/wezterm-gui': No such file or directory
434061:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
434062:du: cannot access './wezterm-gui': No such file or directory
434063:cp: cannot stat './wezterm-gui': No such file or directory
455389:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455390:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
455391:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455392:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
455393:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455394:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
455395:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455396:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
455397:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455398:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
455399:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455400:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
455401:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
455402:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
495793:cp: cannot stat './target/aarch64-unknown-linux-musl/release/xplr': No such file or directory
496881:cp: cannot stat './yggdrasil': No such file or directory
496882:cp: cannot stat './yggdrasilctl': No such file or directory
496885:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
496886:du: cannot access './yggdrasil': No such file or directory
496887:cp: cannot stat './yggdrasil': No such file or directory
496888:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
496889:du: cannot access './yggdrasilctl': No such file or directory
496890:cp: cannot stat './yggdrasilctl': No such file or directory
497756:static-1  | Error loading shared library ld-musl-aarch64-99c589a2.so.1: No such file or directory (needed by /root/.local/share/pipx/venvs/pyinstaller/lib/python3.11/site-packages/curl_cffi.libs/libcurl-impersonate-chrome-6202098e.so.4.8.0)
504428:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/7js8qxl25klk2ibl89c872q11mxa459h-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
504440:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/7js8qxl25klk2ibl89c872q11mxa459h-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

