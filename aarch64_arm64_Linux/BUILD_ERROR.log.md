```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

25716-
25717- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-10-21 (11:29:39 PM) UTC]
25718-
25719-remote: Support for password authentication was removed on August 13, 2021.
25720-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
25721:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
25722-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
25723-cp: cannot stat './certwatcher': No such file or directory
25724-
--
159383-go: downloading github.com/sourcegraph/conc v0.2.0
159384-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
159385-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
159386-	remote: Support for password authentication was removed on August 13, 2021.
159387-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
159388:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
159389-cp: cannot stat './gfx': No such file or directory
159390-
159391-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):04(Sec)
--
459197-
459198- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-10-22 (05:57:05 PM) UTC]
459199-
459200-remote: Support for password authentication was removed on August 13, 2021.
459201-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
459202:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
459203-info: component 'rust-std' for target 'aarch64-unknown-linux-musl' is up to date
459204-sed: can't read ./Cargo.toml: No such file or directory
459205-error: failed to parse manifest at `/tmp/toolpacks/HT8y8fP_linux_aarch64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

390722-
390723-
390724-
390725- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-10-22 (02:31:54 PM) UTC]
390726-
390727:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) z-tokens [https://github.com/volution/z-tokens] :: 00(Hr):04(Min):02(Sec)


[-] command not found --> # Something failed to Install

65751:cpufetch-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: git: command not found
70760:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
71288:vim-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: hostname: command not found
73313:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
74158:cryptsetup-static-aarch64-unknown-linux-musl> /build/cryptsetup-2.7.4/libtool: line 1888: ldconfig: command not found
95487:libXau-static-aarch64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
95569:libXdmcp-static-aarch64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
96023:libICE-static-aarch64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
96302:libapparmor-static-aarch64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
96730:libSM-static-aarch64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
96946:libxcb-static-aarch64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
100602:dbus-static-aarch64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
102256:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
102572:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
102687:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
107690:ck-static-aarch64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
108184:ldns-static-aarch64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
108186:ldns-static-aarch64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
116502:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
129329:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
131287:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
133473:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
137455:mpfr-static-aarch64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
140371:libmpc-static-aarch64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
144408:source-highlight-static-aarch64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
199416:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
199459:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
199742:iperf-static-aarch64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
200560:libmnl-static-aarch64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
201064:libnfnetlink-static-aarch64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
201767:libnftnl-static-aarch64-unknown-linux-musl> /build/libnftnl-1.2.7/libtool: line 1886: ldconfig: command not found
202613:libnetfilter_conntrack-static-aarch64-unknown-linux-musl> /build/libnetfilter_conntrack-1.0.9/libtool: line 1719: ldconfig: command not found
202812:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
202863:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
202881:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
204849:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
204879:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
204926:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
212538:kmod-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
254415:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
254468:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
254486:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
255019:masscan-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: which: command not found
255020:masscan-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: which: command not found
255021:masscan-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: git: command not found
255144:masscan-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: which: command not found
255145:masscan-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: which: command not found
255146:masscan-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: git: command not found
264358:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
280044:numactl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
288627:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
288676:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
288694:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
293361:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
293508:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
293571:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
305710:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
306388:pigz-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: which: command not found
308657:procps-static-aarch64-unknown-linux-musl> /build/procps-3.3.17/libtool: line 1719: ldconfig: command not found
349821:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
349962:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
350020:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
369796:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
372111:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
374524:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
378098:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
380619:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
384833:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
387374:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
396089:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
396324:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
396518:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
408936:squashfs-tools-ng-static-aarch64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.1/libtool: line 1890: ldconfig: command not found
409781:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
410141:squashfuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
412139:libunwind-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
414362:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
414380:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
414873:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
418049:libomxil-bellagio-static-aarch64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
418525:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
418623:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
418664:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
419463:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
430142:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
430192:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
430210:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
434418:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
434724:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
434958:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
443563:libevent-static-aarch64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
451497:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
457155:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
457674:vim-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

225:cron:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
229:crontab:                          ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
379:filan:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
655:linuxdeploy.no_strip:             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=0cb09c8cecdebf11ffcbb472525d94d86d6400b9, stripped
757:netexec_dynamic:                  ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=b63b89a15f6ec03744182679a2baeb3902697a02, for GNU/Linux 3.7.0, stripped
875:procan:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
878:promtail:                         ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=6f43d8c296faf48183f86fb42259d4610813973d, for GNU/Linux 3.7.0, stripped
1000:rqbit:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
1088:socat:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped


[-] Incorrect Arch --> # Not for aarch64

3:METADATA.AIO.json.xz:             7-zip archive data, version 0.4
5:METADATA.AIO.json.zstd:           Zstandard compressed data (v0.8+), Dictionary ID: None
8:METADATA.AIO.min.json.xz:         7-zip archive data, version 0.4
10:METADATA.AIO.min.json.zstd:       Zstandard compressed data (v0.8+), Dictionary ID: None
14:METADATA.AIO.toml.xz:             7-zip archive data, version 0.4
16:METADATA.AIO.toml.zstd:           Zstandard compressed data (v0.8+), Dictionary ID: None
20:METADATA.AIO.yaml.xz:             7-zip archive data, version 0.4
22:METADATA.AIO.yaml.zstd:           Zstandard compressed data (v0.8+), Dictionary ID: None
29:age.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
33:aggligator.preview.png:           PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
38:albafetch.preview.png:            PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
40:algernon.preview.png:             JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
49:amass.preview.png:                PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
69:archey.preview.png:               PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
73:arduino-cli.preview.png:          PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
80:asn.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
84:assh.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
93:bandwhich.preview.png:            PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
94:base.default.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
98:batcat.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
106:berty.preview.png:                JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
109:bin.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
116:binocle.preview.png:              PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
131:broot.preview.png:                PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
134:btop.preview.png:                 PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
142:caddy.preview.png:                PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
153:certstream-server-go.preview.png: PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
154:certstream.preview-0.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
155:certstream.preview-1.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
156:certstream.preview-2.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
157:certstream.preview-3.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
158:certstream.preview-4.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
159:certstream.preview.png:           GIF image data, version 89a, 1920 x 1080
176:cherrybomb.preview.png:           PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
182:circumflex.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
194:cloudfox.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
198:cmd-wrapped.preview.png:          PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
201:cocogitto.preview.png:            PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
204:comb.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
205:comb.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
206:comb.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
207:comb.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
208:comb.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
209:comb.preview.png:                 GIF image data, version 89a, 1920 x 1080
224:croc.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
243:cut-cdn.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
245:cutlines.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
246:cutlines.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
247:cutlines.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
248:cutlines.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
249:cutlines.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
250:cutlines.preview.png:             GIF image data, version 89a, 1920 x 1080
254:czkawka.preview.png:              PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
257:dagu.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
258:daktilo.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
260:dalfox.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
283:devpod.preview.png:               PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
294:dnstake.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
309:dotenv-linter.preview.png:        PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
319:duf.preview.png:                  PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
323:dvc.preview.png:                  PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
340:elinks:                           ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
341:elinks-lite:                      ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
346:encrypted-dns-server.preview.png: PNG image data, 627 x 119, 8-bit colormap, non-interlaced
359:eza.preview.png:                  PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
370:feroxbuster.preview.png:          PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
377:fget.preview.png:                 GIF image data, version 89a, 1920 x 1080
384:findomain.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
388:flawz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
390:fnm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
392:fq.preview.png:                   PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
394:freeze.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
401:fx.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
404:fzf.preview.png:                  PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
409:gdu.preview.png:                  PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
419:getJS.preview.png:                GIF image data, version 89a, 1920 x 1080
426:gh-dash.preview.png:              PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
427:gh.preview.png:                   PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
433:git-cliff.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
443:gitea.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
450:gitoxide.preview.png:             PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
453:gitpod-cli.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
456:gitui.preview.png:                PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
460:glow.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
467:goaccess.preview.png:             PNG image data, 725 x 411, 4-bit colormap, non-interlaced
488:gosmee.preview.png:               PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
494:gowitness.preview.png:            PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
497:gpg-tui.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
501:grex.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
507:gsocket.preview.png:              PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
509:gum.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
513:hacker-scoper.preview.png:        PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
518:hakrawler.preview.png:            PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
521:halp.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
524:haylxon.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
538:hexyl.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
546:htb-cli.preview.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
553:huggingface-cli.preview.png:      PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
555:hugo.preview.png:                 PNG image data, 900 x 450, 8-bit colormap, non-interlaced
560:husarnet.preview.png:             PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
565:hyperfine.preview.png:            PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
566:hypervisor-fw:                    Linux kernel ARM64 boot executable Image, little-endian
568:hysp.preview.png:                 PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
577:inscope.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
578:inscope.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
579:inscope.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
580:inscope.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
581:inscope.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
582:inscope.preview.png:              GIF image data, version 89a, 1920 x 1080
586:intermodal.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
598:istio.preview.png:                PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
601:jaeles.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
604:jc.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
609:jless.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
622:jwt-hack.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
624:k9s.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
635:kitty.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
637:kmon.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
644:kubo.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
647:lazydocker.preview.png:           PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
653:libtree.preview.png:              PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
658:listmonk.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
670:lorien.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
679:macchina.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
682:magick.preview.png:               PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
689:mantra.preview.png:               PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
693:massdns.preview.png:              PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
699:mdcat.preview.png:                PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
704:meli.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
709:micro.preview.png:                PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
712:miller.preview.png:               PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
717:miniserve.preview.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
741:mubeng.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
756:netexec.preview.png:              PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
773:ngocok.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
775:nicotine-plus.preview.png:        PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
783:noir.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
787:noseyparker.preview.png:          PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
803:ockam.preview.png:                PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
805:oha.preview.png:                  PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
818:osmedeus.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
822:ov.preview.png:                   PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
830:pdfcpu.preview.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
838:pfetch-rs.preview.png:            PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
840:pgrok.preview.png:                PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
855:pixi.preview.png:                 PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
857:pkg.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
861:planor.preview.png:               PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
863:pls.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
866:podsync.preview.png:              PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
869:ppfuzz.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
871:ppsspp.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
880:proot.preview.png:                PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
889:puredns.preview.png:              PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
895:qbittorrent-nox.preview.png:      JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
933:qsv.preview.png:                  PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
936:quotes-escaper.preview.png:       GIF image data, version 89a, 1920 x 1080
939:rage.preview.png:                 PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
942:rate-limit-checker.preview.png:   GIF image data, version 89a, 1920 x 1080
945:rathole.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
947:rattler-build.preview.png:        PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
950:rclone.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
953:realm-tavern.preview.png:         PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
957:redguard.preview.png:             PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
967:rescope.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
969:resdns.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
970:resdns.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
971:resdns.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
972:resdns.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
973:resdns.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
974:resdns.preview.png:               GIF image data, version 89a, 1920 x 1080
978:resto.preview.png:                PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
980:reviewdog.preview.png:            PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
983:revive.preview.png:               PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1009:runst.preview.png:                JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1011:ruri.preview.png:                 PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1013:rust-hypervisor-firmware:         Linux kernel ARM64 boot executable Image, little-endian
1017:rustscan.preview.png:             PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1027:sadf:                             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
1033:scopegen.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1034:scopegen.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1035:scopegen.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1036:scopegen.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1037:scopegen.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1038:scopegen.preview.png:             GIF image data, version 89a, 1920 x 1080
1040:scopeview.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1041:scopeview.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1042:scopeview.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1043:scopeview.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1044:scopeview.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1045:scopeview.preview.png:            GIF image data, version 89a, 1920 x 1080
1063:shell2http.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1080:smap.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1083:smartdns.preview.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1085:sn0int.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1090:soft-serve.preview.png:           JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1107:sshportal.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1110:sshx.preview.png:                 PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1116:starship.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1118:steampipe.preview.png:            PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1119:step.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1123:stree.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1133:subxtract.preview.png:            GIF image data, version 89a, 1920 x 1080
1153:systeroid.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1157:tailscale.preview.png:            PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1162:tailspin.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1172:termshark.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1177:tidy-viewer.preview.png:          PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1187:tok.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1188:tok.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1189:tok.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1190:tok.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1191:tok.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1192:tok.preview.png:                  GIF image data, version 89a, 1920 x 1080
1198:traefik.preview.png:              PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1202:trufflehog.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1213:tut.preview.png:                  PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1215:txeh.preview.png:                 PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1223:udpx.preview.png:                 PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1238:v2raya.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1245:vhs.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1247:viddy.preview.png:                PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1258:vopono.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1262:vtm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1273:watchexec.preview.png:            PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1326:xplr.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1330:yabs.sh.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1334:yazi.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1336:yggdrasil.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1342:yt-dlp.preview.png:               PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1345:z-tokens.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1350:zellij.preview.png:               PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1361:zoxide.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1362:zoxide.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1363:zoxide.preview.png:               GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

898:cp: cannot stat './target//release/agrind': No such file or directory
3109:  No such file or directory (os error 2)
3110:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
3647:cp: cannot stat './aptly-bin': No such file or directory
3649:./aptly: cannot open `./aptly' (No such file or directory)
3650:du: cannot access './aptly': No such file or directory
3651:cp: cannot stat './aptly': No such file or directory
15584:Error: open /tmp/tmp.C6N1T6RotT/temp.yaml: no such file or directory
15585:Error: open /tmp/tmp.C6N1T6RotT/temp.yaml: no such file or directory
15586:Error: open /tmp/tmp.C6N1T6RotT/temp.yaml: no such file or directory
15587:Error: open /tmp/tmp.C6N1T6RotT/temp.yaml: no such file or directory
15588:Error: open /tmp/tmp.C6N1T6RotT/temp.yaml: no such file or directory
15706:Error: open /tmp/tmp.dQOSoc83Y4/temp.yaml: no such file or directory
15707:Error: open /tmp/tmp.dQOSoc83Y4/temp.yaml: no such file or directory
15708:Error: open /tmp/tmp.dQOSoc83Y4/temp.yaml: no such file or directory
15709:Error: open /tmp/tmp.dQOSoc83Y4/temp.yaml: no such file or directory
15710:Error: open /tmp/tmp.dQOSoc83Y4/temp.yaml: no such file or directory
16828:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/boltconn': No such file or directory
17852:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
25723:cp: cannot stat './certwatcher': No such file or directory
38338:cp: cannot stat './cloudfox': No such file or directory
38469:cp: cannot stat './cobalt': No such file or directory
38470:./cobalt: cannot open `./cobalt' (No such file or directory)
38471:du: cannot access './cobalt': No such file or directory
38472:cp: cannot stat './cobalt': No such file or directory
44638:cmp: .git/hooks/applypatch-msg: No such file or directory
44639:cmp: .git/hooks/commit-msg: No such file or directory
44640:cmp: .git/hooks/pre-applypatch: No such file or directory
44641:cmp: .git/hooks/pre-commit: No such file or directory
56627:cmp: .git/hooks/applypatch-msg: No such file or directory
56628:cmp: .git/hooks/commit-msg: No such file or directory
56629:cmp: .git/hooks/pre-applypatch: No such file or directory
56630:cmp: .git/hooks/pre-commit: No such file or directory
78446:dateutils-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
78449:dateutils-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
78452:dateutils-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
93826:cp: cannot stat './dblab': No such file or directory
93827:./dblab: cannot open `./dblab' (No such file or directory)
93828:du: cannot access './dblab': No such file or directory
93829:cp: cannot stat './dblab': No such file or directory
101975:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
107387:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/dizi': No such file or directory
108665:cp: cannot stat './dnspyre': No such file or directory
108667:./dnspyre: cannot open `./dnspyre' (No such file or directory)
108668:du: cannot access './dnspyre': No such file or directory
108669:cp: cannot stat './dnspyre': No such file or directory
109074:doas-static-aarch64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
112592:cp: cannot stat './eget': No such file or directory
112593:./eget: cannot open `./eget' (No such file or directory)
112594:du: cannot access './eget': No such file or directory
112595:cp: cannot stat './eget': No such file or directory
113734:cp: cannot stat './entropy': No such file or directory
113735:./entropy: cannot open `./entropy' (No such file or directory)
113736:du: cannot access './entropy': No such file or directory
113737:cp: cannot stat './entropy': No such file or directory
115629:exfatprogs-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
116215:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
129042:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
131847:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/6icybzywziya92ckn6rznp7iv65namlb-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
142380:readline-static-aarch64-unknown-linux-musl> /nix/store/cqnb5spmpzvc32h16568s028frzvz8hs-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
142385:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
142390:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
143491:gcc-static-aarch64-unknown-linux-musl> /nix/store/vxw7nyvfmlqsq4h293y2vnkr9rf2xm7w-stdenv-linux/setup: line 258: /nix/store/q7f04cg09lhbcynblifncs2jj7piiqbr-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
143492:gcc-static-aarch64-unknown-linux-musl> /nix/store/vxw7nyvfmlqsq4h293y2vnkr9rf2xm7w-stdenv-linux/setup: line 258: /nix/store/z854zpalfp8w1kkzrlzzjwjnal5hzqw1-aarch64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
158295:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
158506:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
158508:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
158510:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
158513:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
158514:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
159389:cp: cannot stat './gfx': No such file or directory
172882:cp: cannot stat './go-audit': No such file or directory
172883:./go-audit: cannot open `./go-audit' (No such file or directory)
172884:du: cannot access './go-audit': No such file or directory
172885:cp: cannot stat './go-audit': No such file or directory
173122:cp: cannot stat './gocryptfs': No such file or directory
173123:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
173126:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
173127:du: cannot access './gocryptfs': No such file or directory
173128:cp: cannot stat './gocryptfs': No such file or directory
173129:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
173130:du: cannot access './gocryptfs-xray': No such file or directory
173131:cp: cannot stat './gocryptfs-xray': No such file or directory
176054:cp: cannot stat './gowitness': No such file or directory
176447:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/gpg-tui': No such file or directory
176706:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
176746:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
176780:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
176804:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
192138:rm: cannot remove './rust-toolchain.toml': No such file or directory
199815:cp: cannot stat './ipinfo-bin': No such file or directory
199816:./ipinfo: cannot open `./ipinfo' (No such file or directory)
199817:du: cannot access './ipinfo': No such file or directory
199818:cp: cannot stat './ipinfo': No such file or directory
199819:cp: cannot stat '/tmp/toolpack_aarch64/ipinfo': No such file or directory
204991:iptables-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: /sbin/ldconfig: No such file or directory
207530:cp: cannot stat './target/aarch64-unknown-linux-musl/release/ironrdp-client': No such file or directory
207532:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
207533:du: cannot access './ironrdp-client': No such file or directory
207534:cp: cannot stat './ironrdp-client': No such file or directory
211880:cp: cannot stat './katana': No such file or directory
211881:./katana: cannot open `./katana' (No such file or directory)
211882:du: cannot access './katana': No such file or directory
211883:cp: cannot stat './katana': No such file or directory
212261:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
212263:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
212695:rm: cannot remove './rust-toolchain.toml': No such file or directory
212885:cp: cannot stat './ksubdomain': No such file or directory
212886:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
212887:du: cannot access './ksubdomain': No such file or directory
212888:cp: cannot stat './ksubdomain': No such file or directory
214525:cp: cannot stat './libaws': No such file or directory
214527:./libaws: cannot open `./libaws' (No such file or directory)
214528:du: cannot access './libaws': No such file or directory
214529:cp: cannot stat './libaws': No such file or directory
214530:cp: cannot stat './libaws': No such file or directory
250148:lsof-static-aarch64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
257377:cp: cannot stat './mirrorbits': No such file or directory
257379:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
257380:du: cannot access './mirrorbits': No such file or directory
257381:cp: cannot stat './mirrorbits': No such file or directory
270372:cp: cannot stat './naabu-bin': No such file or directory
270373:./naabu: cannot open `./naabu' (No such file or directory)
270374:du: cannot access './naabu': No such file or directory
270375:cp: cannot stat './naabu': No such file or directory
270660:/tmp/dupbU_build.sh: line 30: /download/ncdu-2.6-linux-aarch64.tar.gz: No such file or directory
276161:cp: cannot stat './nezha-dashboard': No such file or directory
276166:cp: cannot stat './nezha-agent': No such file or directory
276167:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
276168:du: cannot access './nezha-dashboard': No such file or directory
276169:cp: cannot stat './nezha-dashboard': No such file or directory
276170:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
276171:du: cannot access './nezha-agent': No such file or directory
276172:cp: cannot stat './nezha-agent': No such file or directory
277656:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
277657:du: cannot access './result/bin/ncat': No such file or directory
277659:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
277660:du: cannot access './result/bin/nmap': No such file or directory
277662:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
277663:du: cannot access './result/bin/nping': No such file or directory
277664:cp: cannot stat './result/bin/ncat': No such file or directory
277665:cp: cannot stat './result/bin/nmap': No such file or directory
277666:cp: cannot stat './result/bin/nping': No such file or directory
287142:find: ‘./bin’: No such file or directory
287143:find: ‘./bin’: No such file or directory
287144:find: ‘./bin’: No such file or directory
287146:rsync: [sender] change_dir "/tmp/toolpacks/8KHwNUf_linux_aarch64/static-cross-openssh/./bin" failed: No such file or directory (2)
287152:rsync: [sender] change_dir "/tmp/toolpacks/8KHwNUf_linux_aarch64/static-cross-openssh/./etc" failed: No such file or directory (2)
287158:rsync: [sender] change_dir "/tmp/toolpacks/8KHwNUf_linux_aarch64/static-cross-openssh/./libexec" failed: No such file or directory (2)
287164:rsync: [sender] change_dir "/tmp/toolpacks/8KHwNUf_linux_aarch64/static-cross-openssh/./sbin" failed: No such file or directory (2)
289387:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
289388:du: cannot access './result/bin/openvpn': No such file or directory
289389:cp: cannot stat './result/bin/openvpn': No such file or directory
296918:readline-static-aarch64-unknown-linux-musl> /nix/store/cqnb5spmpzvc32h16568s028frzvz8hs-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
296923:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
296928:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
304091:/tmp/toolpack_aarch64/php: cannot open `/tmp/toolpack_aarch64/php' (No such file or directory)
304092:du: cannot access '/tmp/toolpack_aarch64/php': No such file or directory
304095:/tmp/toolpack_aarch64/php-fpm: cannot open `/tmp/toolpack_aarch64/php-fpm' (No such file or directory)
304096:du: cannot access '/tmp/toolpack_aarch64/php-fpm': No such file or directory
304099:/tmp/toolpack_aarch64/php-micro: cannot open `/tmp/toolpack_aarch64/php-micro' (No such file or directory)
304100:du: cannot access '/tmp/toolpack_aarch64/php-micro': No such file or directory
307044:cp: cannot stat './pktstat': No such file or directory
307046:./pktstat: cannot open `./pktstat' (No such file or directory)
307047:du: cannot access './pktstat': No such file or directory
307048:cp: cannot stat './pktstat': No such file or directory
342435:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
342439:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
342499:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
347729:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
347730:./pwait: cannot open `./pwait' (No such file or directory)
347731:du: cannot access './pwait': No such file or directory
347732:cp: cannot stat './pwait': No such file or directory
350277:readline-static-aarch64-unknown-linux-musl> /nix/store/cqnb5spmpzvc32h16568s028frzvz8hs-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
350282:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
350287:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
356510:cp: cannot stat '': No such file or directory
356559:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
361777:cp: cannot stat './bin/qemu-nios2': No such file or directory
365818:cp: cannot stat './target/aarch64-unknown-linux-musl/release/golem': No such file or directory
365819:cp: cannot stat './target/aarch64-unknown-linux-musl/release/imix': No such file or directory
366129:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
366186:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
366187:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
367732:cp: cannot stat './rescope': No such file or directory
369141:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
390551:./samu: cannot open `./samu' (No such file or directory)
390552:du: cannot access './samu': No such file or directory
390553:cp: cannot stat './samu': No such file or directory
390554:cp: cannot stat './samu': No such file or directory
390711:./sbase-box: cannot open `./sbase-box' (No such file or directory)
390712:du: cannot access './sbase-box': No such file or directory
390713:cp: cannot stat './sbase-box': No such file or directory
390714:cp: cannot stat './sbase-box': No such file or directory
390715:cp: cannot stat './sbase': No such file or directory
390716:cp: cannot stat './sbase': No such file or directory
393385:aclocal-1.16: warning: couldn't open directory 'm4': No such file or directory
395671:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
401268:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
401270:./smenu: cannot open `./smenu' (No such file or directory)
401271:du: cannot access './smenu': No such file or directory
401272:cp: cannot stat './smenu': No such file or directory
406101:readline-static-aarch64-unknown-linux-musl> /nix/store/cqnb5spmpzvc32h16568s028frzvz8hs-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
406106:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
406111:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
407594:cp: cannot stat './spoof-dpi': No such file or directory
409494:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
411630:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
414308:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/6icybzywziya92ckn6rznp7iv65namlb-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
414361:keyutils-static-aarch64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
419231:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
419351:musl-obstack-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
420507:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
420508:du: cannot access './result/bin/stress-ng': No such file or directory
420509:cp: cannot stat './result/bin/stress-ng': No such file or directory
424523:find: ‘/usr/src/linux-headers-6.1.0-25-arm64’: No such file or directory
424532:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
425337:cp: cannot stat './target/aarch64-unknown-linux-musl/release/system_info_collector': No such file or directory
425338:cp: cannot stat './target/aarch64-unknown-linux-musl/release/system_info_collector': No such file or directory
433955:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
441553:readline-static-aarch64-unknown-linux-musl> /nix/store/cqnb5spmpzvc32h16568s028frzvz8hs-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
441558:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
441563:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/61g7bpii14lra8whcfnr85fp3ikjgdjj-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
446225:  = note: No such file or directory (os error 2)
446379:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tracexec': No such file or directory
446381:./tracexec: cannot open `./tracexec' (No such file or directory)
446382:du: cannot access './tracexec': No such file or directory
446383:cp: cannot stat './tracexec': No such file or directory
447852:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tun2proxy': No such file or directory
447854:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
447855:du: cannot access './tun2proxy': No such file or directory
447856:cp: cannot stat './tun2proxy': No such file or directory
448825:cp: cannot stat './ubase': No such file or directory
448826:cp: cannot stat './ubase': No such file or directory
459204:sed: can't read ./Cargo.toml: No such file or directory
459209:cp: cannot stat './target/aarch64-unknown-linux-musl/release/vproxy': No such file or directory
462561:cp: cannot stat './target/aarch64-unknown-linux-musl/release/wezterm-gui': No such file or directory
462571:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
462572:du: cannot access './wezterm-gui': No such file or directory
462573:cp: cannot stat './wezterm-gui': No such file or directory
483912:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483913:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
483914:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483915:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
483916:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483917:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
483918:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483919:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
483920:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483921:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
483922:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483923:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
483924:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
483925:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
559655:cp: cannot stat './target/aarch64-unknown-linux-musl/release/xplr': No such file or directory
560770:cp: cannot stat './yggdrasil': No such file or directory
560771:cp: cannot stat './yggdrasilctl': No such file or directory
560774:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
560775:du: cannot access './yggdrasil': No such file or directory
560776:cp: cannot stat './yggdrasil': No such file or directory
560777:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
560778:du: cannot access './yggdrasilctl': No such file or directory
560779:cp: cannot stat './yggdrasilctl': No such file or directory
561650:static-1  | Error loading shared library ld-musl-aarch64-99c589a2.so.1: No such file or directory (needed by /root/.local/share/pipx/venvs/pyinstaller/lib/python3.11/site-packages/curl_cffi.libs/libcurl-impersonate-chrome-6202098e.so.4.8.0)
567974:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/dxjrgsc24270ikhjcdyjvzpbbh1mg1gb-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.
567986:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/dxjrgsc24270ikhjcdyjvzpbbh1mg1gb-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

