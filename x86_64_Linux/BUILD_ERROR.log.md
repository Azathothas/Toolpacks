```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

34043-
34044- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-10-14 (09:28:29 PM) UTC]
34045-
34046-remote: Support for password authentication was removed on August 13, 2021.
34047-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
34048:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
34049-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
34050-cp: cannot stat './certwatcher': No such file or directory
34051-
--
143605-go: downloading github.com/gobwas/glob v0.2.3
143606-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
143607-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
143608-	remote: Support for password authentication was removed on August 13, 2021.
143609-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
143610:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
143611-cp: cannot stat './gfx': No such file or directory
143612-
143613-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):05(Sec)
--
407228-
407229- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-10-15 (08:27:59 AM) UTC]
407230-
407231-remote: Support for password authentication was removed on August 13, 2021.
407232-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
407233:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
407234-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
407235-sed: can't read ./Cargo.toml: No such file or directory
407236-error: failed to parse manifest at `/tmp/toolpacks/oKbUh6c_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

105990-
105991-
105992-
105993- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-10-14 (11:16:32 PM) UTC]
105994-
105995:asset `x86_64-bin.tar.xz` not found
105996:asset `x86_64-bin.tar.xz` not found
--
116900-
116901-
116902-
116903- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Monday, 2024-10-14 (11:49:26 PM) UTC]
116904-
116905:asset `arm` not found
116906:asset `arm` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) z-tokens [https://github.com/volution/z-tokens] :: 00(Hr):01(Min):20(Sec)


[-] command not found --> # Something failed to Install

66547:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
68433:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
68934:vim-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: hostname: command not found
71011:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
71851:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.3/libtool: line 1888: ldconfig: command not found
93868:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
93980:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
94440:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
94690:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
95148:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
95365:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
99015:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
100701:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
101193:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.3/libtool: line 1719: ldconfig: command not found
101195:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1719: ldconfig: command not found
109650:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
116094:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
118036:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
120164:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
124282:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
125773:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
127943:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
180898:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
180941:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
181227:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
182020:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
182188:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
183209:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.7/libtool: line 1886: ldconfig: command not found
184015:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.0.9/libtool: line 1719: ldconfig: command not found
184333:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
184386:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
184404:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
186407:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
186438:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
186484:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
193921:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
232507:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
232555:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
232573:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
233137:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
233138:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
233139:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
233262:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
233263:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
233264:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
238748:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
251062:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
256257:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
256305:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
256323:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
260425:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
260488:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
270233:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
270912:pigz-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
273203:procps-static-x86_64-unknown-linux-musl> /build/procps-3.3.17/libtool: line 1719: ldconfig: command not found
310585:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
310645:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
333364:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
335508:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
337928:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
341509:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
344039:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
348262:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
350811:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
364559:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.1/libtool: line 1890: ldconfig: command not found
365411:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
365774:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
367953:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
370363:keyutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
370448:keyutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
371610:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
373275:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
373399:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
374464:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
374937:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
375859:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
378007:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
378207:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
378334:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
378456:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
378559:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
378752:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
388784:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
388837:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
388855:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
394120:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
402640:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
405171:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
405660:vim-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

109:binfetch:                         ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
782:netexec_dynamic:                  ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=04804d3c31218f938502cbed5cdd1af09d59a8f0, for GNU/Linux 2.6.32, stripped
860:pathbuster:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
910:promtail:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=12b150ecc8f6d62f070109e4f78264c09988f9a2, for GNU/Linux 3.2.0, stripped
1045:rqbit:                            ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped


[-] Incorrect Arch --> # Not for x86_64

3:METADATA.AIO.json.xz:             7-zip archive data, version 0.4
5:METADATA.AIO.json.zstd:           Zstandard compressed data (v0.8+), Dictionary ID: None
8:METADATA.AIO.min.json.xz:         7-zip archive data, version 0.4
10:METADATA.AIO.min.json.zstd:       Zstandard compressed data (v0.8+), Dictionary ID: None
14:METADATA.AIO.toml.xz:             7-zip archive data, version 0.4
16:METADATA.AIO.toml.zstd:           Zstandard compressed data (v0.8+), Dictionary ID: None
20:METADATA.AIO.yaml.xz:             7-zip archive data, version 0.4
22:METADATA.AIO.yaml.zstd:           Zstandard compressed data (v0.8+), Dictionary ID: None
28:age.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
32:aggligator.preview.png:           PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
37:albafetch.preview.png:            PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
39:algernon.preview.png:             JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
48:amass.preview.png:                PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
67:archey.preview.png:               PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
71:arduino-cli.preview.png:          PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
77:asn.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
81:assh.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
90:bandwhich.preview.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
91:base.default.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
95:batcat.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
103:berty.preview.png:                JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
106:bin.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
113:binocle.preview.png:              PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
129:broot.preview.png:                PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
132:btop.preview.png:                 PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
139:caddy.preview.png:                PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
151:certstream-server-go.preview.png: PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
152:certstream.preview-0.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
153:certstream.preview-1.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
154:certstream.preview-2.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
155:certstream.preview-3.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
156:certstream.preview-4.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
157:certstream.preview.png:           GIF image data, version 89a, 1920 x 1080
175:cherrybomb.preview.png:           PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
181:circumflex.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
194:cloudfox.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
198:cmd-wrapped.preview.png:          PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
201:cocogitto.preview.png:            PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
204:comb.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
205:comb.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
206:comb.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
207:comb.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
208:comb.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
209:comb.preview.png:                 GIF image data, version 89a, 1920 x 1080
225:croc.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
244:cut-cdn.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
246:cutlines.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
247:cutlines.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
248:cutlines.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
249:cutlines.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
250:cutlines.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
251:cutlines.preview.png:             GIF image data, version 89a, 1920 x 1080
256:czkawka.preview.png:              PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
259:dagu.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
260:daktilo.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
262:dalfox.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
269:dbeaver.preview.png:              PNG image data, 1000 x 500, 8-bit/color RGBA, non-interlaced
285:devpod.preview.png:               PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
296:dnstake.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
311:dotenv-linter.preview.png:        PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
321:duf.preview.png:                  PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
325:dvc.preview.png:                  PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
348:encrypted-dns-server.preview.png: PNG image data, 627 x 119, 8-bit colormap, non-interlaced
362:eza.preview.png:                  PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
374:feroxbuster.preview.png:          PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
381:fget.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
382:fget.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
383:fget.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
384:fget.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
385:fget.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
386:fget.preview.png:                 GIF image data, version 89a, 1920 x 1080
394:findomain.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
399:flawz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
401:fnm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
403:fq.preview.png:                   PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
405:freeze.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
412:fx.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
415:fzf.preview.png:                  PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
418:gdu.preview.png:                  PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
428:getJS.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
429:getJS.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
430:getJS.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
431:getJS.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
432:getJS.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
433:getJS.preview.png:                GIF image data, version 89a, 1920 x 1080
440:gh-dash.preview.png:              PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
441:gh.preview.png:                   PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
447:git-cliff.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
457:gitea.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
464:gitoxide.preview.png:             PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
467:gitpod-cli.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
470:gitui.preview.png:                PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
474:glow.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
481:goaccess.preview.png:             PNG image data, 725 x 411, 4-bit colormap, non-interlaced
502:gosmee.preview.png:               PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
503:gost:                             ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
509:gowitness.preview.png:            PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
512:gpg-tui.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
516:grex.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
522:gsocket.preview.png:              PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
524:gum.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
528:hacker-scoper.preview.png:        PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
533:hakrawler.preview.png:            PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
536:halp.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
539:haylxon.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
553:hexyl.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
561:htb-cli.preview.png:              PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
568:huggingface-cli.preview.png:      PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
570:hugo.preview.png:                 PNG image data, 900 x 450, 8-bit colormap, non-interlaced
575:husarnet.preview.png:             PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
580:hyperfine.preview.png:            PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
583:hysp.preview.png:                 PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
589:imhex.preview.png:                PNG image data, 1528 x 948, 8-bit/color RGB, non-interlaced
594:inscope.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
595:inscope.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
596:inscope.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
597:inscope.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
598:inscope.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
599:inscope.preview.png:              GIF image data, version 89a, 1920 x 1080
603:intermodal.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
618:istio.preview.png:                PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
627:jaeles.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
630:jc.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
635:jless.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
648:jwt-hack.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
650:k9s.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
661:kitty.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
663:kmon.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
669:kubo.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
672:lazydocker.preview.png:           PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
679:libtree.preview.png:              PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
684:listmonk.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
697:lorien.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
706:macchina.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
709:magick.preview.png:               PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
716:mantra.preview.png:               PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
720:massdns.preview.png:              PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
726:mdcat.preview.png:                PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
731:meli.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
736:micro.preview.png:                PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
739:miller.preview.png:               PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
744:miniserve.preview.png:            PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
768:mubeng.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
781:netexec.preview.png:              PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
798:ngocok.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
800:nicotine-plus.preview.png:        PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
812:noir.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
816:noseyparker.preview.png:          PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
833:ockam.preview.png:                PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
835:oha.preview.png:                  PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
849:osmedeus.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
853:ov.preview.png:                   PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
862:pdfcpu.preview.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
869:pfetch-rs.preview.png:            PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
871:pgrok.preview.png:                PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
887:pixi.preview.png:                 PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
889:pkg.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
893:planor.preview.png:               PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
895:pls.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
898:podsync.preview.png:              PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
901:ppfuzz.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
903:ppsspp.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
912:proot.preview.png:                PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
919:puredns.preview.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
925:qbittorrent-nox.preview.png:      JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
963:qsv.preview.png:                  PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
966:quotes-escaper.preview-0.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
967:quotes-escaper.preview-1.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
968:quotes-escaper.preview-2.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
969:quotes-escaper.preview-3.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
970:quotes-escaper.preview-4.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
971:quotes-escaper.preview.png:       GIF image data, version 89a, 1920 x 1080
974:rage.preview.png:                 PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
977:rate-limit-checker.preview-0.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
978:rate-limit-checker.preview-1.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
979:rate-limit-checker.preview-2.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
980:rate-limit-checker.preview-3.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
981:rate-limit-checker.preview-4.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
982:rate-limit-checker.preview.png:   GIF image data, version 89a, 1920 x 1080
984:rathole.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
986:rattler-build.preview.png:        PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
989:rclone.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
992:realm-tavern.preview.png:         PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
998:redguard.preview.png:             PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
1009:rescope.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1011:resdns.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1012:resdns.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1013:resdns.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1014:resdns.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1015:resdns.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1016:resdns.preview.png:               GIF image data, version 89a, 1920 x 1080
1020:resto.preview.png:                PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
1022:reviewdog.preview.png:            PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
1025:revive.preview.png:               PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1033:rippkgs-index.sqlite:             SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2
1054:runst.preview.png:                JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1056:ruri.preview.png:                 PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1062:rustscan.preview.png:             PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1079:scopegen.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1080:scopegen.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1081:scopegen.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1082:scopegen.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1083:scopegen.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1084:scopegen.preview.png:             GIF image data, version 89a, 1920 x 1080
1086:scopeview.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1087:scopeview.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1088:scopeview.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1089:scopeview.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1090:scopeview.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1091:scopeview.preview.png:            GIF image data, version 89a, 1920 x 1080
1109:shell2http.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1128:smap.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1131:smartdns.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1134:sn0int.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1139:soft-serve.preview.png:           JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1163:sshportal.preview.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1166:sshx.preview.png:                 PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1172:starship.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1174:steampipe.preview.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1176:step.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1180:stree.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1190:subxtract.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1191:subxtract.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1192:subxtract.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1193:subxtract.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1194:subxtract.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1195:subxtract.preview.png:            GIF image data, version 89a, 1920 x 1080
1219:systeroid.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1224:tailscale.preview.png:            PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1230:tailspin.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1240:termshark.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1245:tidy-viewer.preview.png:          PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1255:tok.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1256:tok.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1257:tok.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1258:tok.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1259:tok.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1260:tok.preview.png:                  GIF image data, version 89a, 1920 x 1080
1268:traefik.preview.png:              PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1272:trufflehog.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1283:tut.preview.png:                  PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1285:txeh.preview.png:                 PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1292:udpx.preview.png:                 PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1307:v2raya.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1314:vhs.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1316:viddy.preview.png:                PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1327:vopono.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1331:vtm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1342:watchexec.preview.png:            PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1397:xplr.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1401:yabs.sh.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1405:yazi.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1407:yggdrasil.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1413:yt-dlp.preview.png:               PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1416:z-tokens.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1421:zellij.preview.png:               PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1432:zoxide.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1433:zoxide.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1434:zoxide.preview.png:               GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

6890:cp: cannot stat './aptly-bin': No such file or directory
6892:./aptly: cannot open `./aptly' (No such file or directory)
6893:du: cannot access './aptly': No such file or directory
6894:cp: cannot stat './aptly': No such file or directory
18032:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
18033:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
18034:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
18061:binutils-static-x86_64-unknown-linux-musl> checking for CFLocaleCopyPreferredLanguages... /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
18083:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
19364:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/bfd/configure: line 6938: /usr/bin/file: No such file or directory
19702:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
19875:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libctf/configure: line 9376: /usr/bin/file: No such file or directory
34050:cp: cannot stat './certwatcher': No such file or directory
38521:cp: cannot stat './cobalt': No such file or directory
38522:./cobalt: cannot open `./cobalt' (No such file or directory)
38523:du: cannot access './cobalt': No such file or directory
38524:cp: cannot stat './cobalt': No such file or directory
44556:cmp: .git/hooks/applypatch-msg: No such file or directory
44557:cmp: .git/hooks/commit-msg: No such file or directory
44558:cmp: .git/hooks/pre-applypatch: No such file or directory
44559:cmp: .git/hooks/pre-commit: No such file or directory
56509:cmp: .git/hooks/applypatch-msg: No such file or directory
56510:cmp: .git/hooks/commit-msg: No such file or directory
56511:cmp: .git/hooks/pre-applypatch: No such file or directory
56512:cmp: .git/hooks/pre-commit: No such file or directory
76434:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
76437:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
76440:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
92219:cp: cannot stat './dblab': No such file or directory
92220:./dblab: cannot open `./dblab' (No such file or directory)
92221:du: cannot access './dblab': No such file or directory
92222:cp: cannot stat './dblab': No such file or directory
101677:cp: cannot stat './dnspyre': No such file or directory
101679:./dnspyre: cannot open `./dnspyre' (No such file or directory)
101680:du: cannot access './dnspyre': No such file or directory
101681:cp: cannot stat './dnspyre': No such file or directory
102088:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
105657:cp: cannot stat './eget': No such file or directory
105658:./eget: cannot open `./eget' (No such file or directory)
105659:du: cannot access './eget': No such file or directory
105660:cp: cannot stat './eget': No such file or directory
108766:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
109354:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
115798:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
118591:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iyi8z1j8vljd6fbiizhyc09567j86cgz-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
121002:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
121022:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
121026:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... checking command to parse /nix/store/kgc6yccw7qf063fyjjjql4qk4mnmscdd-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... checking for sys/file.h... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
121028:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
121047:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
121589:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
121598:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
121604:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
123920:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/bfd/configure: line 6938: /usr/bin/file: No such file or directory
125142:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
125536:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libctf/configure: line 9376: /usr/bin/file: No such file or directory
127271:gcc-static-x86_64-unknown-linux-musl> /nix/store/dwhbqwrvr5dj76xf28smnfrfxv8arx90-stdenv-linux/setup: line 258: /nix/store/b74nxf0yn2dzha02mgdxyklaqjaijzqp-binutils-wrapper-2.42/nix-support/libc-ldflags-before: No such file or directory
127272:gcc-static-x86_64-unknown-linux-musl> /nix/store/dwhbqwrvr5dj76xf28smnfrfxv8arx90-stdenv-linux/setup: line 258: /nix/store/8k1rdgsbvc3mgi2xdsafiymvf6bzgxnl-x86_64-unknown-linux-musl-binutils-wrapper-2.42/nix-support/libc-ldflags-before: No such file or directory
128729:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
131529:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
131719:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
133905:gcc-static-x86_64-unknown-linux-musl> checking for sys/stat.h... /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
133906:gcc-static-x86_64-unknown-linux-musl> checking how to run the C preprocessor... /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
133993:gcc-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc -O2 -I/nix/store/j7dxzpbk2c5lnih56r3nyhpw7fr8000y-musl-static-x86_64-unknown-linux-musl-1.2.3-dev/include -B/nix/store/f5qx90a6j6ns01x1gsg9mw3wj5mrf135-musl-static-x86_64-unknown-linux-musl-1.2.3/lib/ -idirafter /nix/store/j7dxzpbk2c5lnih56r3nyhpw7fr8000y-musl-static-x86_64-unknown-linux-musl-1.2.3-dev/include -idirafter /nix/store/i76nvvk598jl0w16zyh2khry4zbcl5h8-x86_64-unknown-linux-musl-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-musl/13.3.0/include-fixed -isystem /nix/store/s49zi9g806p8207354d6h6gyr70g5n3g-fortify-headers-1.1alpine3/include -Wl,-rpath,/nix/store/jgxx0ajlaqyingwkbn7bh0qvdfmhjjdr-gcc-static-x86_64-unknown-linux-musl-13.3.0-lib/lib -Wl,-L/nix/store/f5qx90a6j6ns01x1gsg9mw3wj5mrf135-musl-static-x86_64-unknown-linux-musl-1.2.3/lib -Wl,-rpath -Wl,/nix/store/f5qx90a6j6ns01x1gsg9mw3wj5mrf135-musl-static-x86_64-unknown-linux-musl-1.2.3/lib -Wl,-dynamic-linker=/nix/store/f5qx90a6j6ns01x1gsg9mw3wj5mrf135-musl-static-x86_64-unknown-linux-musl-1.2.3/lib/ld-musl-x86_64.so.1 --sysroot=/   PIC flag -fPIC -DPIC works... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
134102:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
135199:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
136381:gcc-static-x86_64-unknown-linux-musl> checking whether build environment is sane... /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
136444:gcc-static-x86_64-unknown-linux-musl> checking dynamic linker characteristics... /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
138327:gdb-static-x86_64-unknown-linux-musl> checking for int_least32_t... checking for limits.h... /build/gdb-15.1/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
138336:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
139667:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/bfd/configure: line 6938: /usr/bin/file: No such file or directory
140525:gdb-static-x86_64-unknown-linux-musl> checking for pwrite... checking sys/ptrace.h usability... /build/gdb-15.1/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
141184:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/gdb/configure: line 7248: /usr/bin/file: No such file or directory
141207:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
142524:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142737:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142740:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142741:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142742:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142743:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
143611:cp: cannot stat './gfx': No such file or directory
157876:cp: cannot stat './gocryptfs': No such file or directory
157877:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
157880:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
157881:du: cannot access './gocryptfs': No such file or directory
157882:cp: cannot stat './gocryptfs': No such file or directory
157883:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
157884:du: cannot access './gocryptfs-xray': No such file or directory
157885:cp: cannot stat './gocryptfs-xray': No such file or directory
160078:cp: cannot stat './gost-bin': No such file or directory
161139:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
161396:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
161432:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
161469:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
161493:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
181300:cp: cannot stat './ipinfo-bin': No such file or directory
181301:./ipinfo: cannot open `./ipinfo' (No such file or directory)
181302:du: cannot access './ipinfo': No such file or directory
181303:cp: cannot stat './ipinfo': No such file or directory
181304:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
186549:iptables-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /sbin/ldconfig: No such file or directory
189146:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
189148:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
189149:du: cannot access './ironrdp-client': No such file or directory
189150:cp: cannot stat './ironrdp-client': No such file or directory
193242:cp: cannot stat './katana': No such file or directory
193243:./katana: cannot open `./katana' (No such file or directory)
193244:du: cannot access './katana': No such file or directory
193245:cp: cannot stat './katana': No such file or directory
193644:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
193646:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
194142:cp: cannot stat './ksubdomain': No such file or directory
194143:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
194144:du: cannot access './ksubdomain': No such file or directory
194145:cp: cannot stat './ksubdomain': No such file or directory
195767:cp: cannot stat './libaws': No such file or directory
195769:./libaws: cannot open `./libaws' (No such file or directory)
195770:du: cannot access './libaws': No such file or directory
195771:cp: cannot stat './libaws': No such file or directory
195772:cp: cannot stat './libaws': No such file or directory
228342:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
234925:cp: cannot stat './mirrorbits': No such file or directory
234927:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
234928:du: cannot access './mirrorbits': No such file or directory
234929:cp: cannot stat './mirrorbits': No such file or directory
241643:cp: cannot stat './naabu-bin': No such file or directory
241644:./naabu: cannot open `./naabu' (No such file or directory)
241645:du: cannot access './naabu': No such file or directory
241646:cp: cannot stat './naabu': No such file or directory
241745:/tmp/TAlz3_build.sh: line 30: /download/ncdu-2.6-linux-x86_64.tar.gz: No such file or directory
247261:cp: cannot stat './nezha-dashboard': No such file or directory
247266:cp: cannot stat './nezha-agent': No such file or directory
247267:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
247268:du: cannot access './nezha-dashboard': No such file or directory
247269:cp: cannot stat './nezha-dashboard': No such file or directory
247270:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
247271:du: cannot access './nezha-agent': No such file or directory
247272:cp: cannot stat './nezha-agent': No such file or directory
248997:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
248998:du: cannot access './result/bin/ncat': No such file or directory
249000:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
249001:du: cannot access './result/bin/nmap': No such file or directory
249003:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
249004:du: cannot access './result/bin/nping': No such file or directory
249005:cp: cannot stat './result/bin/ncat': No such file or directory
249006:cp: cannot stat './result/bin/nmap': No such file or directory
249007:cp: cannot stat './result/bin/nping': No such file or directory
254788:find: ‘./bin’: No such file or directory
254789:find: ‘./bin’: No such file or directory
254790:find: ‘./bin’: No such file or directory
254792:rsync: [sender] change_dir "/tmp/toolpacks/voslZEJ_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
254798:rsync: [sender] change_dir "/tmp/toolpacks/voslZEJ_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
254804:rsync: [sender] change_dir "/tmp/toolpacks/voslZEJ_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
254810:rsync: [sender] change_dir "/tmp/toolpacks/voslZEJ_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
257019:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
257020:du: cannot access './result/bin/openvpn': No such file or directory
257021:cp: cannot stat './result/bin/openvpn': No such file or directory
258773:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
260911:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
260916:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
260921:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
268613:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
268614:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
268617:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
268618:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
268621:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
268622:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
271565:cp: cannot stat './pktstat': No such file or directory
271567:./pktstat: cannot open `./pktstat' (No such file or directory)
271568:du: cannot access './pktstat': No such file or directory
271569:cp: cannot stat './pktstat': No such file or directory
306849:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
306853:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
306917:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
307798:find: ‘’: No such file or directory
307803:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
307804:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
308940:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
308941:./pwait: cannot open `./pwait' (No such file or directory)
308942:du: cannot access './pwait': No such file or directory
308943:cp: cannot stat './pwait': No such file or directory
310980:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
310985:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
310992:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
323944:cp: cannot stat './bin/qemu-nios2': No such file or directory
329205:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
329206:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
329534:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
329586:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
329587:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
331163:cp: cannot stat './rescope': No such file or directory
332703:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
333846:result/bin/rsync: cannot open `result/bin/rsync' (No such file or directory)
333847:du: cannot access 'result/bin/rsync': No such file or directory
333848:cp: cannot stat 'result/bin/rsync': No such file or directory
333849:cp: cannot stat 'result/bin/rsync-ssl': No such file or directory
353989:./samu: cannot open `./samu' (No such file or directory)
353990:du: cannot access './samu': No such file or directory
353991:cp: cannot stat './samu': No such file or directory
353992:cp: cannot stat './samu': No such file or directory
354225:cp: cannot stat './sbase': No such file or directory
354226:cp: cannot stat './sbase': No such file or directory
356896:aclocal-1.16: warning: couldn't open directory 'm4': No such file or directory
360031:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
360033:./smenu: cannot open `./smenu' (No such file or directory)
360034:du: cannot access './smenu': No such file or directory
360035:cp: cannot stat './smenu': No such file or directory
361704:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
361709:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
361714:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
363206:cp: cannot stat './spoof-dpi': No such file or directory
365121:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
367452:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
370271:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iyi8z1j8vljd6fbiizhyc09567j86cgz-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
370362:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
372232:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
373959:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
374036:binutils-static-x86_64-unknown-linux-musl> checking for CFPreferencesCopyAppValue... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
374046:binutils-static-x86_64-unknown-linux-musl> checking the name lister (/nix/store/kgc6yccw7qf063fyjjjql4qk4mnmscdd-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm) interface... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
374050:binutils-static-x86_64-unknown-linux-musl> checking target system type... /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
374055:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
374100:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
374112:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
374130:binutils-static-x86_64-unknown-linux-musl> checking for objdir... /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
374138:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
374194:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
376964:libpfm-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
377835:libpfm-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
379561:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
379562:du: cannot access './result/bin/stress-ng': No such file or directory
379563:cp: cannot stat './result/bin/stress-ng': No such file or directory
383675:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
383684:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
384506:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
384507:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
384568:cp: cannot stat './tailscale': No such file or directory
384569:cp: cannot stat './tailscaled': No such file or directory
384570:cp: cannot stat './tailscale_bb': No such file or directory
384571:./tailscale: cannot open `./tailscale' (No such file or directory)
384572:du: cannot access './tailscale': No such file or directory
384573:cp: cannot stat './tailscale': No such file or directory
384574:./tailscaled: cannot open `./tailscaled' (No such file or directory)
384575:du: cannot access './tailscaled': No such file or directory
384576:cp: cannot stat './tailscaled': No such file or directory
384577:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
384578:du: cannot access './tailscale_bb': No such file or directory
384579:cp: cannot stat './tailscale_bb': No such file or directory
384580:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
384581:du: cannot access './tailscale_bb': No such file or directory
384582:cp: cannot stat './tailscale_bb': No such file or directory
392718:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
392723:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
392728:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
397384:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
397386:./tracexec: cannot open `./tracexec' (No such file or directory)
397387:du: cannot access './tracexec': No such file or directory
397388:cp: cannot stat './tracexec': No such file or directory
398883:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
398885:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
398886:du: cannot access './tun2proxy': No such file or directory
398887:cp: cannot stat './tun2proxy': No such file or directory
399929:cp: cannot stat './ubase': No such file or directory
399930:cp: cannot stat './ubase': No such file or directory
407235:sed: can't read ./Cargo.toml: No such file or directory
407240:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
410562:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
410572:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
410573:du: cannot access './wezterm-gui': No such file or directory
410574:cp: cannot stat './wezterm-gui': No such file or directory
508637:cp: cannot stat './yggdrasil': No such file or directory
508638:cp: cannot stat './yggdrasilctl': No such file or directory
508641:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
508642:du: cannot access './yggdrasil': No such file or directory
508643:cp: cannot stat './yggdrasil': No such file or directory
508644:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
508645:du: cannot access './yggdrasilctl': No such file or directory
508646:cp: cannot stat './yggdrasilctl': No such file or directory
509221:cp: cannot stat './yq': No such file or directory
509223:./yq: cannot open `./yq' (No such file or directory)
509224:du: cannot access './yq': No such file or directory
509225:cp: cannot stat './yq': No such file or directory
512460:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/4zi0kvynzy1w4xnx7kshgm4pwlp36cli-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.
512472:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/4zi0kvynzy1w4xnx7kshgm4pwlp36cli-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

