```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

30356-
30357- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-11-04 (09:55:19 PM) UTC]
30358-
30359-remote: Support for password authentication was removed on August 13, 2021.
30360-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
30361:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
30362-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
30363-cp: cannot stat './certwatcher': No such file or directory
30364-
--
143397-go: downloading github.com/sourcegraph/conc v0.2.0
143398-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
143399-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
143400-	remote: Support for password authentication was removed on August 13, 2021.
143401-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
143402:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
143403-cp: cannot stat './gfx': No such file or directory
143404-
143405-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):03(Sec)
--
365993-
365994- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-11-05 (09:48:51 AM) UTC]
365995-
365996-remote: Support for password authentication was removed on August 13, 2021.
365997-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
365998:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
365999-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
366000-sed: can't read ./Cargo.toml: No such file or directory
366001-error: failed to parse manifest at `/tmp/toolpacks/qscjGyf_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

103988-
103989-
103990-
103991- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Tuesday, 2024-11-05 (12:01:34 AM) UTC]
103992-
103993:asset `x86_64-bin.tar.xz` not found
103994:asset `x86_64-bin.tar.xz` not found
--
116659-
116660-
116661-
116662- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-11-05 (12:42:01 AM) UTC]
116663-
116664:asset `arm` not found
116665:asset `arm` not found
--
293679-
293680-
293681-
293682- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-11-05 (07:08:32 AM) UTC]
293683-
293684:asset `ruri` not found
--
313751-
313752-
313753-
313754- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-11-05 (07:24:56 AM) UTC]
313755-
313756:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):33(Sec)


[-] command not found --> # Something failed to Install

63202:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
65073:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
65553:vim-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: hostname: command not found
67635:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
68464:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.4/libtool: line 1888: ldconfig: command not found
91541:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
91654:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
92097:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
92315:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
92781:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
93024:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
96672:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
98701:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
99200:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
99202:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
108284:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
115858:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
117793:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
119961:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
124062:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
125545:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
127709:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
180016:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
180059:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
180345:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
181147:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
181313:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
182382:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
182627:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
183434:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
183487:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
183505:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
185439:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
185470:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
185516:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
192820:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
210605:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
210654:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
210672:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
211209:masscan-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: which: command not found
211210:masscan-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: which: command not found
211211:masscan-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: git: command not found
211334:masscan-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: which: command not found
211335:masscan-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: which: command not found
211336:masscan-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: git: command not found
216848:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
227959:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
233157:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
233208:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
233226:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
237698:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
237756:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
246820:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
247496:pigz-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: which: command not found
249856:procps-static-x86_64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
271705:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
271767:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
292918:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
294985:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
297412:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
301000:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
303537:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
307767:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
310323:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
324016:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
324866:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
325240:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
327447:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
329840:keyutils-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
329977:keyutils-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
331095:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
332622:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
332791:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
334169:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
334328:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
335194:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
337578:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
337704:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
337777:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
337849:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
337950:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
337979:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
347742:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
347794:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
347812:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
353036:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
361357:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
363933:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
364438:vim-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

109:bed:                               ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=W54xB5ittyUb-PUwu_hA/f7IaId-zbTyq9ZEIRtmf/4WRL_Zqfp5RUUDnoYPzj/IC00C39jHPu-hlSanNn2, stripped
118:binfetch:                          ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
797:netexec_dynamic:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=04804d3c31218f938502cbed5cdd1af09d59a8f0, for GNU/Linux 2.6.32, stripped
875:pathbuster:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
925:promtail:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=c17b73b028f1a6383b2f964fc395c08e940483b4, for GNU/Linux 3.2.0, stripped
1061:rqbit:                             ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
1382:woofwoof:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=30e06184968532b6a9aa36f44ada39e4af0bda56, for GNU/Linux 2.6.32, stripped


[-] Incorrect Arch --> # Not for x86_64

4:METADATA.AIO.json.xz:              7-zip archive data, version 0.4
6:METADATA.AIO.json.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
9:METADATA.AIO.min.json.xz:          7-zip archive data, version 0.4
11:METADATA.AIO.min.json.zstd:        Zstandard compressed data (v0.8+), Dictionary ID: None
13:METADATA.AIO.soar.capnp:           data
15:METADATA.AIO.soar.capnp.xz:        7-zip archive data, version 0.4
17:METADATA.AIO.soar.capnp.zstd:      Zstandard compressed data (v0.8+), Dictionary ID: None
21:METADATA.AIO.toml.xz:              7-zip archive data, version 0.4
23:METADATA.AIO.toml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
27:METADATA.AIO.yaml.xz:              7-zip archive data, version 0.4
29:METADATA.AIO.yaml.zstd:            Zstandard compressed data (v0.8+), Dictionary ID: None
35:age.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
39:aggligator.preview.png:            PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
44:albafetch.preview.png:             PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
46:algernon.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
55:amass.preview.png:                 PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
75:archey.preview.png:                PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
79:arduino-cli.preview.png:           PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
86:asn.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
90:assh.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
99:bandwhich.preview.png:             PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
100:base.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
104:batcat.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
112:berty.preview.png:                 JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
115:bin.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
122:binocle.preview.png:               PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
124:bita.preview.png:                  PNG image data, 512 x 184, 8-bit/color RGBA, non-interlaced
140:broot.preview.png:                 PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
143:btop.preview.png:                  PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
151:caddy.preview.png:                 PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
163:certstream-server-go.preview.png:  PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
164:certstream.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
165:certstream.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
166:certstream.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
167:certstream.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
168:certstream.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
169:certstream.preview.png:            GIF image data, version 89a, 1920 x 1080
187:cherrybomb.preview.png:            PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
193:circumflex.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
206:cloudfox.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
210:cmd-wrapped.preview.png:           PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
213:cocogitto.preview.png:             PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
216:comb.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
217:comb.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
218:comb.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
219:comb.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
220:comb.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
221:comb.preview.png:                  GIF image data, version 89a, 1920 x 1080
237:croc.preview.png:                  JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
256:cut-cdn.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
258:cutlines.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
259:cutlines.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
260:cutlines.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
261:cutlines.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
262:cutlines.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
263:cutlines.preview.png:              GIF image data, version 89a, 1920 x 1080
268:czkawka.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
271:dagu.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
272:daktilo.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
274:dalfox.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
281:dbeaver.preview.png:               PNG image data, 1000 x 500, 8-bit/color RGBA, non-interlaced
298:devpod.preview.png:                PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
310:dnstake.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
325:dotenv-linter.preview.png:         PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
335:duf.preview.png:                   PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
339:dvc.preview.png:                   PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
362:encrypted-dns-server.preview.png:  PNG image data, 627 x 119, 8-bit colormap, non-interlaced
377:eza.preview.png:                   PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
389:feroxbuster.preview.png:           PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
396:fget.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
397:fget.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
398:fget.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
399:fget.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
400:fget.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
401:fget.preview.png:                  GIF image data, version 89a, 1920 x 1080
409:findomain.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
414:flawz.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
416:fnm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
418:fq.preview.png:                    PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
420:freeze.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
427:fx.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
430:fzf.preview.png:                   PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
433:gdu.preview.png:                   PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
443:getJS.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
444:getJS.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
445:getJS.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
446:getJS.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
447:getJS.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
448:getJS.preview.png:                 GIF image data, version 89a, 1920 x 1080
455:gh-dash.preview.png:               PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
456:gh.preview.png:                    PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
462:git-cliff.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
472:gitea.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
479:gitoxide.preview.png:              PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
482:gitpod-cli.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
485:gitui.preview.png:                 PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
489:glow.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
496:goaccess.preview.png:              PNG image data, 725 x 411, 4-bit colormap, non-interlaced
517:gosmee.preview.png:                PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
518:gost:                              ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
524:gowitness.preview.png:             PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
527:gpg-tui.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
531:grex.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
537:gsocket.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
539:gum.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
543:hacker-scoper.preview.png:         PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
548:hakrawler.preview.png:             PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
551:halp.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
554:haylxon.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
568:hexyl.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
576:htb-cli.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
583:huggingface-cli.preview.png:       PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
585:hugo.preview.png:                  PNG image data, 900 x 450, 8-bit colormap, non-interlaced
590:husarnet.preview.png:              PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
595:hyperfine.preview.png:             PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
598:hysp.preview.png:                  PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
604:imhex.preview.png:                 PNG image data, 1528 x 948, 8-bit/color RGB, non-interlaced
609:inscope.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
610:inscope.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
611:inscope.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
612:inscope.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
613:inscope.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
614:inscope.preview.png:               GIF image data, version 89a, 1920 x 1080
618:intermodal.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
633:istio.preview.png:                 PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
642:jaeles.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
645:jc.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
650:jless.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
663:jwt-hack.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
665:k9s.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
676:kitty.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
678:kmon.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
684:kubo.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
687:lazydocker.preview.png:            PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
694:libtree.preview.png:               PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
699:listmonk.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
712:lorien.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
721:macchina.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
724:magick.preview.png:                PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
731:mantra.preview.png:                PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
735:massdns.preview.png:               PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
741:mdcat.preview.png:                 PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
746:meli.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
751:micro.preview.png:                 PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
754:miller.preview.png:                PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
759:miniserve.preview.png:             PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
783:mubeng.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
796:netexec.preview.png:               PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
813:ngocok.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
815:nicotine-plus.preview.png:         PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
827:noir.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
831:noseyparker.preview.png:           PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
848:ockam.preview.png:                 PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
850:oha.preview.png:                   PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
864:osmedeus.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
868:ov.preview.png:                    PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
877:pdfcpu.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
884:pfetch-rs.preview.png:             PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
886:pgrok.preview.png:                 PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
902:pixi.preview.png:                  PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
904:pkg.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
908:planor.preview.png:                PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
910:pls.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
913:podsync.preview.png:               PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
916:ppfuzz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
918:ppsspp.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
927:proot.preview.png:                 PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
934:puredns.preview.png:               PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
940:qbittorrent-nox.preview.png:       JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
978:qsv.preview.png:                   PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
981:quotes-escaper.preview-0.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
982:quotes-escaper.preview-1.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
983:quotes-escaper.preview-2.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
984:quotes-escaper.preview-3.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
985:quotes-escaper.preview-4.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
986:quotes-escaper.preview.png:        GIF image data, version 89a, 1920 x 1080
989:rage.preview.png:                  PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
992:rate-limit-checker.preview-0.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
993:rate-limit-checker.preview-1.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
994:rate-limit-checker.preview-2.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
995:rate-limit-checker.preview-3.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
996:rate-limit-checker.preview-4.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
997:rate-limit-checker.preview.png:    GIF image data, version 89a, 1920 x 1080
1000:rathole.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1002:rattler-build.preview.png:         PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
1005:rclone.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1008:realm-tavern.preview.png:          PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
1014:redguard.preview.png:              PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
1025:rescope.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1027:resdns.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1028:resdns.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1029:resdns.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1030:resdns.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1031:resdns.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1032:resdns.preview.png:                GIF image data, version 89a, 1920 x 1080
1036:resto.preview.png:                 PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
1038:reviewdog.preview.png:             PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
1041:revive.preview.png:                PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1049:rippkgs-index.sqlite:              SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2
1070:runst.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1072:ruri.preview.png:                  PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1078:rustscan.preview.png:              PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1095:scopegen.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1096:scopegen.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1097:scopegen.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1098:scopegen.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1099:scopegen.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1100:scopegen.preview.png:              GIF image data, version 89a, 1920 x 1080
1102:scopeview.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1103:scopeview.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1104:scopeview.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1105:scopeview.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1106:scopeview.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1107:scopeview.preview.png:             GIF image data, version 89a, 1920 x 1080
1125:shell2http.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1145:smap.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1148:smartdns.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1151:sn0int.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1156:soft-serve.preview.png:            JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1181:sshportal.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1184:sshx.preview.png:                  PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1190:starship.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1192:steampipe.preview.png:             PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1194:step.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1198:stree.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1208:subxtract.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1209:subxtract.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1210:subxtract.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1211:subxtract.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1212:subxtract.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1213:subxtract.preview.png:             GIF image data, version 89a, 1920 x 1080
1237:systeroid.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1242:tailscale.preview.png:             PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1248:tailspin.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1258:termshark.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1263:tidy-viewer.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1273:tok.preview-0.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1274:tok.preview-1.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1275:tok.preview-2.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1276:tok.preview-3.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1277:tok.preview-4.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1278:tok.preview.png:                   GIF image data, version 89a, 1920 x 1080
1286:traefik.preview.png:               PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1290:trufflehog.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1301:tut.preview.png:                   PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1303:txeh.preview.png:                  PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1311:udpx.preview.png:                  PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1326:v2raya.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1333:vhs.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1335:viddy.preview.png:                 PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1348:vopono.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1352:vtm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1363:watchexec.preview.png:             PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1403:xplr.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1407:yabs.sh.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1411:yazi.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1413:yggdrasil.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1419:yt-dlp.preview.png:                PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1422:z-tokens.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1427:zellij.preview.png:                PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1438:zoxide.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1439:zoxide.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1440:zoxide.preview.png:                GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

5486:cp: cannot stat './aptly-bin': No such file or directory
5488:./aptly: cannot open `./aptly' (No such file or directory)
5489:du: cannot access './aptly': No such file or directory
5490:cp: cannot stat './aptly': No such file or directory
15303:binutils-static-x86_64-unknown-linux-musl> checking whether the shell understands "+="... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
15305:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
15334:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
15339:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
15348:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
16641:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
16978:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
17143:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
30363:cp: cannot stat './certwatcher': No such file or directory
35266:cp: cannot stat './cobalt': No such file or directory
35267:./cobalt: cannot open `./cobalt' (No such file or directory)
35268:du: cannot access './cobalt': No such file or directory
35269:cp: cannot stat './cobalt': No such file or directory
41274:cmp: .git/hooks/applypatch-msg: No such file or directory
41275:cmp: .git/hooks/commit-msg: No such file or directory
41276:cmp: .git/hooks/pre-applypatch: No such file or directory
41277:cmp: .git/hooks/pre-commit: No such file or directory
53174:cmp: .git/hooks/applypatch-msg: No such file or directory
53175:cmp: .git/hooks/commit-msg: No such file or directory
53176:cmp: .git/hooks/pre-applypatch: No such file or directory
53177:cmp: .git/hooks/pre-commit: No such file or directory
72760:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
72763:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
72766:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
89877:cp: cannot stat './dblab': No such file or directory
89878:./dblab: cannot open `./dblab' (No such file or directory)
89879:du: cannot access './dblab': No such file or directory
89880:cp: cannot stat './dblab': No such file or directory
99684:cp: cannot stat './dnspyre': No such file or directory
99686:./dnspyre: cannot open `./dnspyre' (No such file or directory)
99687:du: cannot access './dnspyre': No such file or directory
99688:cp: cannot stat './dnspyre': No such file or directory
100098:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
103657:cp: cannot stat './eget': No such file or directory
103658:./eget: cannot open `./eget' (No such file or directory)
103659:du: cannot access './eget': No such file or directory
103660:cp: cannot stat './eget': No such file or directory
107406:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
107994:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
115568:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
118354:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/0nzvf8n4kqhbb8zkacrbpmavzkwzxmik-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
120756:binutils-static-x86_64-unknown-linux-musl> checking whether the shell understands some XSI constructs... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
120768:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
120771:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
120793:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
120805:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
121446:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
121462:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
121469:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
123633:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
124875:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
125309:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
127033:gcc-static-x86_64-unknown-linux-musl> /nix/store/cikszmhsiabvz1scq8ligdlj5rbifqis-stdenv-linux/setup: line 258: /nix/store/l7n97992gd5piaw8phkxzsz176gfk1yj-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
127034:gcc-static-x86_64-unknown-linux-musl> /nix/store/cikszmhsiabvz1scq8ligdlj5rbifqis-stdenv-linux/setup: line 258: /nix/store/3zy36285azrdpv2yakiz8xsrcffc35vj-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
128526:gcc-static-x86_64-unknown-linux-musl> checking whether gcc supports -Wall... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
131299:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
131489:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
133670:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
133671:gcc-static-x86_64-unknown-linux-musl> checking how to run the C preprocessor... /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
133750:gcc-static-x86_64-unknown-linux-musl> checking syslog.h presence... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
133870:gcc-static-x86_64-unknown-linux-musl> checking sys/time.h usability... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
134964:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
136141:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
136208:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
138089:gdb-static-x86_64-unknown-linux-musl> checking for an ANSI C-conforming const... /build/gdb-15.1/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
138102:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
139368:gdb-static-x86_64-unknown-linux-musl> checking that generated files are newer than configure... /build/gdb-15.1/bfd/configure: line 6938: /usr/bin/file: No such file or directory
140297:gdb-static-x86_64-unknown-linux-musl> checking sys/ptrace.h presence... /build/gdb-15.1/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
140941:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/gdb/configure: line 7248: /usr/bin/file: No such file or directory
140975:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
142287:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142500:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142501:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142502:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142505:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
142506:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
143403:cp: cannot stat './gfx': No such file or directory
157516:cp: cannot stat './gocryptfs': No such file or directory
157517:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
157520:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
157521:du: cannot access './gocryptfs': No such file or directory
157522:cp: cannot stat './gocryptfs': No such file or directory
157523:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
157524:du: cannot access './gocryptfs-xray': No such file or directory
157525:cp: cannot stat './gocryptfs-xray': No such file or directory
159700:cp: cannot stat './gost-bin': No such file or directory
160763:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
161033:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
161069:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
161103:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
161129:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
180418:cp: cannot stat './ipinfo-bin': No such file or directory
180419:./ipinfo: cannot open `./ipinfo' (No such file or directory)
180420:du: cannot access './ipinfo': No such file or directory
180421:cp: cannot stat './ipinfo': No such file or directory
180422:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
185583:iptables-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
188053:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
188055:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
188056:du: cannot access './ironrdp-client': No such file or directory
188057:cp: cannot stat './ironrdp-client': No such file or directory
192141:cp: cannot stat './katana': No such file or directory
192142:./katana: cannot open `./katana' (No such file or directory)
192143:du: cannot access './katana': No such file or directory
192144:cp: cannot stat './katana': No such file or directory
192543:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
192545:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
193035:cp: cannot stat './ksubdomain': No such file or directory
193036:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
193037:du: cannot access './ksubdomain': No such file or directory
193038:cp: cannot stat './ksubdomain': No such file or directory
194686:cp: cannot stat './libaws': No such file or directory
194688:./libaws: cannot open `./libaws' (No such file or directory)
194689:du: cannot access './libaws': No such file or directory
194690:cp: cannot stat './libaws': No such file or directory
194691:cp: cannot stat './libaws': No such file or directory
206445:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
213036:cp: cannot stat './mirrorbits': No such file or directory
213038:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
213039:du: cannot access './mirrorbits': No such file or directory
213040:cp: cannot stat './mirrorbits': No such file or directory
217607:rsync: [sender] change_dir "/tmp/toolpacks/lQkIO8v_linux_x86_64/./result/bin" failed: No such file or directory (2)
217613:rsync: [sender] change_dir "/tmp/toolpacks/lQkIO8v_linux_x86_64/./result/libexec/mtd-utils" failed: No such file or directory (2)
218783:cp: cannot stat './naabu-bin': No such file or directory
218784:./naabu: cannot open `./naabu' (No such file or directory)
218785:du: cannot access './naabu': No such file or directory
218786:cp: cannot stat './naabu': No such file or directory
218885:/tmp/yCTwM_build.sh: line 30: /download/ncdu-2.6-linux-x86_64.tar.gz: No such file or directory
224326:cp: cannot stat './nezha-dashboard': No such file or directory
224331:cp: cannot stat './nezha-agent': No such file or directory
224332:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
224333:du: cannot access './nezha-dashboard': No such file or directory
224334:cp: cannot stat './nezha-dashboard': No such file or directory
224335:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
224336:du: cannot access './nezha-agent': No such file or directory
224337:cp: cannot stat './nezha-agent': No such file or directory
224697:/tmp/toolpack_x86_64/ngrok: cannot open `/tmp/toolpack_x86_64/ngrok' (No such file or directory)
224698:du: cannot access '/tmp/toolpack_x86_64/ngrok': No such file or directory
226072:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
226073:du: cannot access './result/bin/ncat': No such file or directory
226075:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
226076:du: cannot access './result/bin/nmap': No such file or directory
226078:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
226079:du: cannot access './result/bin/nping': No such file or directory
226080:cp: cannot stat './result/bin/ncat': No such file or directory
226081:cp: cannot stat './result/bin/nmap': No such file or directory
226082:cp: cannot stat './result/bin/nping': No such file or directory
231729:find: ‘./bin’: No such file or directory
231730:find: ‘./bin’: No such file or directory
231731:find: ‘./bin’: No such file or directory
231733:rsync: [sender] change_dir "/tmp/toolpacks/7sgUvDQ_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
231739:rsync: [sender] change_dir "/tmp/toolpacks/7sgUvDQ_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
231745:rsync: [sender] change_dir "/tmp/toolpacks/7sgUvDQ_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
231751:rsync: [sender] change_dir "/tmp/toolpacks/7sgUvDQ_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
233919:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
233920:du: cannot access './result/bin/openvpn': No such file or directory
233921:cp: cannot stat './result/bin/openvpn': No such file or directory
235667:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
238013:readline-static-x86_64-unknown-linux-musl> /nix/store/sf6y4arqcm100rnnl3dhpg732i774zp6-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
238018:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
238023:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
245189:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
245190:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
245193:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
245194:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
245197:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
245198:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
248140:cp: cannot stat './pktstat': No such file or directory
248142:./pktstat: cannot open `./pktstat' (No such file or directory)
248143:du: cannot access './pktstat': No such file or directory
248144:cp: cannot stat './pktstat': No such file or directory
267655:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
267659:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
267723:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
268603:find: ‘’: No such file or directory
268608:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
268609:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
269766:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
269767:./pwait: cannot open `./pwait' (No such file or directory)
269768:du: cannot access './pwait': No such file or directory
269769:cp: cannot stat './pwait': No such file or directory
272020:readline-static-x86_64-unknown-linux-musl> /nix/store/sf6y4arqcm100rnnl3dhpg732i774zp6-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
272025:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
272030:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
278229:cp: cannot stat '': No such file or directory
278279:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
283504:cp: cannot stat './bin/qemu-nios2': No such file or directory
288743:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
288744:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
289073:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
289125:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
289126:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
290716:cp: cannot stat './rescope': No such file or directory
292254:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
293687:find: ‘/tmp/toolpack_x86_64/ruri’: No such file or directory
313508:./samu: cannot open `./samu' (No such file or directory)
313509:du: cannot access './samu': No such file or directory
313510:cp: cannot stat './samu': No such file or directory
313511:cp: cannot stat './samu': No such file or directory
313744:cp: cannot stat './sbase': No such file or directory
313745:cp: cannot stat './sbase': No such file or directory
319464:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
319466:./smenu: cannot open `./smenu' (No such file or directory)
319467:du: cannot access './smenu': No such file or directory
319468:cp: cannot stat './smenu': No such file or directory
321167:readline-static-x86_64-unknown-linux-musl> /nix/store/sf6y4arqcm100rnnl3dhpg732i774zp6-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
321172:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
321177:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
322663:cp: cannot stat './spoof-dpi': No such file or directory
324577:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
326946:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
329811:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/wkfpq2j0wmrbjlq4y60jyccj920f3h8y-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
329839:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
331744:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
333387:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
333399:binutils-static-x86_64-unknown-linux-musl> checking target system type... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
333416:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
333453:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
333456:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
333873:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
333881:binutils-static-x86_64-unknown-linux-musl> checking for ld used by GCC... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
333893:binutils-static-x86_64-unknown-linux-musl> checking for shared library run path origin... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
333908:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
334033:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
336554:libpfm-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
337406:libpfm-static-x86_64-unknown-linux-musl> /nix/store/mm0pa3z7kk6jh1i9rkxqxjqmd8h1qpxf-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
338483:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
338484:du: cannot access './result/bin/stress-ng': No such file or directory
338485:cp: cannot stat './result/bin/stress-ng': No such file or directory
342595:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
342604:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
343426:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
343427:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
343482:cp: cannot stat './tailscale': No such file or directory
343483:cp: cannot stat './tailscaled': No such file or directory
343484:cp: cannot stat './tailscale_bb': No such file or directory
343485:./tailscale: cannot open `./tailscale' (No such file or directory)
343486:du: cannot access './tailscale': No such file or directory
343487:cp: cannot stat './tailscale': No such file or directory
343488:./tailscaled: cannot open `./tailscaled' (No such file or directory)
343489:du: cannot access './tailscaled': No such file or directory
343490:cp: cannot stat './tailscaled': No such file or directory
343491:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
343492:du: cannot access './tailscale_bb': No such file or directory
343493:cp: cannot stat './tailscale_bb': No such file or directory
343494:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
343495:du: cannot access './tailscale_bb': No such file or directory
343496:cp: cannot stat './tailscale_bb': No such file or directory
351642:readline-static-x86_64-unknown-linux-musl> /nix/store/sf6y4arqcm100rnnl3dhpg732i774zp6-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
351647:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
351652:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/my5d6fsz2dn5wj3zal59n84cd7c5m104-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
356121:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
356123:./tracexec: cannot open `./tracexec' (No such file or directory)
356124:du: cannot access './tracexec': No such file or directory
356125:cp: cannot stat './tracexec': No such file or directory
357622:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
357624:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
357625:du: cannot access './tun2proxy': No such file or directory
357626:cp: cannot stat './tun2proxy': No such file or directory
358609:cp: cannot stat './ubase': No such file or directory
358610:cp: cannot stat './ubase': No such file or directory
366000:sed: can't read ./Cargo.toml: No such file or directory
366005:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
369354:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
369364:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
369365:du: cannot access './wezterm-gui': No such file or directory
369366:cp: cannot stat './wezterm-gui': No such file or directory
431366:cp: cannot stat './yggdrasil': No such file or directory
431367:cp: cannot stat './yggdrasilctl': No such file or directory
431370:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
431371:du: cannot access './yggdrasil': No such file or directory
431372:cp: cannot stat './yggdrasil': No such file or directory
431373:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
431374:du: cannot access './yggdrasilctl': No such file or directory
431375:cp: cannot stat './yggdrasilctl': No such file or directory
431947:cp: cannot stat './yq': No such file or directory
431949:./yq: cannot open `./yq' (No such file or directory)
431950:du: cannot access './yq': No such file or directory
431951:cp: cannot stat './yq': No such file or directory
435192:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/r5lb4lirgrcdhibkyzls5sbraz1whgzl-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
435204:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/r5lb4lirgrcdhibkyzls5sbraz1whgzl-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

