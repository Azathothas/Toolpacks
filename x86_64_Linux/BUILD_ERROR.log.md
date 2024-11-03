```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

32136-
32137- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-10-28 (09:35:19 PM) UTC]
32138-
32139-remote: Support for password authentication was removed on August 13, 2021.
32140-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
32141:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
32142-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
32143-cp: cannot stat './certwatcher': No such file or directory
32144-
--
148294-go: downloading github.com/sourcegraph/conc v0.2.0
148295-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
148296-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
148297-	remote: Support for password authentication was removed on August 13, 2021.
148298-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
148299:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
148300-cp: cannot stat './gfx': No such file or directory
148301-
148302-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):05(Sec)
--
371977-
371978- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-10-29 (08:15:27 AM) UTC]
371979-
371980-remote: Support for password authentication was removed on August 13, 2021.
371981-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
371982:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
371983-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
371984-sed: can't read ./Cargo.toml: No such file or directory
371985-error: failed to parse manifest at `/tmp/toolpacks/WAqjW4A_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

109152-
109153-
109154-
109155- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-10-28 (11:27:46 PM) UTC]
109156-
109157:asset `x86_64-bin.tar.xz` not found
109158:asset `x86_64-bin.tar.xz` not found
--
121562-
121563-
121564-
121565- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-10-29 (12:02:51 AM) UTC]
121566-
121567:asset `arm` not found
121568:asset `arm` not found
--
299271-
299272-
299273-
299274- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-10-29 (05:56:07 AM) UTC]
299275-
299276:asset `ruri` not found
--
319334-
319335-
319336-
319337- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-10-29 (06:12:05 AM) UTC]
319338-
319339:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) z-tokens [https://github.com/volution/z-tokens] :: 00(Hr):01(Min):29(Sec)


[-] command not found --> # Something failed to Install

68314:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
70203:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
70695:vim-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: hostname: command not found
72773:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
73604:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.4/libtool: line 1888: ldconfig: command not found
96652:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
96761:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
97220:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
97464:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
97925:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
98144:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
101794:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
103858:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
104357:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
104359:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
113209:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
120762:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
122698:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
124919:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
128963:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
130455:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
132628:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
185436:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
185479:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
185765:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
186564:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
186727:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
187732:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.7/libtool: line 1886: ldconfig: command not found
188207:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.0.9/libtool: line 1719: ldconfig: command not found
188926:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
188975:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
188994:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
190925:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
190956:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
191002:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
198293:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
216081:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
216132:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
216150:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
216687:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
216688:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
216689:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
216812:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
216813:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
216814:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
222362:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
233566:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
238774:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
238825:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
238844:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
243302:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
243361:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
252437:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
253116:pigz-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
255395:procps-static-x86_64-unknown-linux-musl> /build/procps-3.3.17/libtool: line 1719: ldconfig: command not found
277255:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
277315:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
298500:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
300610:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
303030:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
306611:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
309141:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
313364:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
315913:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
329530:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.1/libtool: line 1890: ldconfig: command not found
330388:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
330751:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
332942:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
335349:keyutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
335451:keyutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
336622:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
338279:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
338444:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
339633:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
340040:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
340884:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
343344:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
343601:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
343805:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
343925:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
344029:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
344100:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
353660:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
353713:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
353731:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
358937:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
367372:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
369921:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
370406:vim-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

109:bed:                               ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=W54xB5ittyUb-PUwu_hA/f7IaId-zbTyq9ZEIRtmf/4WRL_Zqfp5RUUDnoYPzj/IC00C39jHPu-hlSanNn2, stripped
118:binfetch:                          ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
796:netexec_dynamic:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=04804d3c31218f938502cbed5cdd1af09d59a8f0, for GNU/Linux 2.6.32, stripped
874:pathbuster:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
924:promtail:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=c17b73b028f1a6383b2f964fc395c08e940483b4, for GNU/Linux 3.2.0, stripped
1060:rqbit:                             ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
1379:woofwoof:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=30e06184968532b6a9aa36f44ada39e4af0bda56, for GNU/Linux 2.6.32, stripped


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
376:eza.preview.png:                   PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
388:feroxbuster.preview.png:           PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
395:fget.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
396:fget.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
397:fget.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
398:fget.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
399:fget.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
400:fget.preview.png:                  GIF image data, version 89a, 1920 x 1080
408:findomain.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
413:flawz.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
415:fnm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
417:fq.preview.png:                    PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
419:freeze.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
426:fx.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
429:fzf.preview.png:                   PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
432:gdu.preview.png:                   PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
442:getJS.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
443:getJS.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
444:getJS.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
445:getJS.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
446:getJS.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
447:getJS.preview.png:                 GIF image data, version 89a, 1920 x 1080
454:gh-dash.preview.png:               PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
455:gh.preview.png:                    PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
461:git-cliff.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
471:gitea.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
478:gitoxide.preview.png:              PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
481:gitpod-cli.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
484:gitui.preview.png:                 PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
488:glow.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
495:goaccess.preview.png:              PNG image data, 725 x 411, 4-bit colormap, non-interlaced
516:gosmee.preview.png:                PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
517:gost:                              ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
523:gowitness.preview.png:             PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
526:gpg-tui.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
530:grex.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
536:gsocket.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
538:gum.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
542:hacker-scoper.preview.png:         PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
547:hakrawler.preview.png:             PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
550:halp.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
553:haylxon.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
567:hexyl.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
575:htb-cli.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
582:huggingface-cli.preview.png:       PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
584:hugo.preview.png:                  PNG image data, 900 x 450, 8-bit colormap, non-interlaced
589:husarnet.preview.png:              PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
594:hyperfine.preview.png:             PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
597:hysp.preview.png:                  PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
603:imhex.preview.png:                 PNG image data, 1528 x 948, 8-bit/color RGB, non-interlaced
608:inscope.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
609:inscope.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
610:inscope.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
611:inscope.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
612:inscope.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
613:inscope.preview.png:               GIF image data, version 89a, 1920 x 1080
617:intermodal.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
632:istio.preview.png:                 PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
641:jaeles.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
644:jc.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
649:jless.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
662:jwt-hack.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
664:k9s.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
675:kitty.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
677:kmon.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
683:kubo.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
686:lazydocker.preview.png:            PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
693:libtree.preview.png:               PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
698:listmonk.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
711:lorien.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
720:macchina.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
723:magick.preview.png:                PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
730:mantra.preview.png:                PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
734:massdns.preview.png:               PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
740:mdcat.preview.png:                 PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
745:meli.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
750:micro.preview.png:                 PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
753:miller.preview.png:                PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
758:miniserve.preview.png:             PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
782:mubeng.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
795:netexec.preview.png:               PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
812:ngocok.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
814:nicotine-plus.preview.png:         PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
826:noir.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
830:noseyparker.preview.png:           PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
847:ockam.preview.png:                 PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
849:oha.preview.png:                   PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
863:osmedeus.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
867:ov.preview.png:                    PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
876:pdfcpu.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
883:pfetch-rs.preview.png:             PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
885:pgrok.preview.png:                 PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
901:pixi.preview.png:                  PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
903:pkg.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
907:planor.preview.png:                PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
909:pls.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
912:podsync.preview.png:               PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
915:ppfuzz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
917:ppsspp.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
926:proot.preview.png:                 PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
933:puredns.preview.png:               PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
939:qbittorrent-nox.preview.png:       JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
977:qsv.preview.png:                   PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
980:quotes-escaper.preview-0.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
981:quotes-escaper.preview-1.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
982:quotes-escaper.preview-2.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
983:quotes-escaper.preview-3.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
984:quotes-escaper.preview-4.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
985:quotes-escaper.preview.png:        GIF image data, version 89a, 1920 x 1080
988:rage.preview.png:                  PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
991:rate-limit-checker.preview-0.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
992:rate-limit-checker.preview-1.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
993:rate-limit-checker.preview-2.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
994:rate-limit-checker.preview-3.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
995:rate-limit-checker.preview-4.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
996:rate-limit-checker.preview.png:    GIF image data, version 89a, 1920 x 1080
999:rathole.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1001:rattler-build.preview.png:         PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
1004:rclone.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1007:realm-tavern.preview.png:          PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
1013:redguard.preview.png:              PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
1024:rescope.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1026:resdns.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1027:resdns.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1028:resdns.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1029:resdns.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1030:resdns.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1031:resdns.preview.png:                GIF image data, version 89a, 1920 x 1080
1035:resto.preview.png:                 PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
1037:reviewdog.preview.png:             PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
1040:revive.preview.png:                PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1048:rippkgs-index.sqlite:              SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2
1069:runst.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1071:ruri.preview.png:                  PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1077:rustscan.preview.png:              PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1094:scopegen.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1095:scopegen.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1096:scopegen.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1097:scopegen.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1098:scopegen.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1099:scopegen.preview.png:              GIF image data, version 89a, 1920 x 1080
1101:scopeview.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1102:scopeview.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1103:scopeview.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1104:scopeview.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1105:scopeview.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1106:scopeview.preview.png:             GIF image data, version 89a, 1920 x 1080
1124:shell2http.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1143:smap.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1146:smartdns.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1149:sn0int.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1154:soft-serve.preview.png:            JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1178:sshportal.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1181:sshx.preview.png:                  PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1187:starship.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1189:steampipe.preview.png:             PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1191:step.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1195:stree.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1205:subxtract.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1206:subxtract.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1207:subxtract.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1208:subxtract.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1209:subxtract.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1210:subxtract.preview.png:             GIF image data, version 89a, 1920 x 1080
1234:systeroid.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1239:tailscale.preview.png:             PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1245:tailspin.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1255:termshark.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1260:tidy-viewer.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1270:tok.preview-0.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1271:tok.preview-1.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1272:tok.preview-2.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1273:tok.preview-3.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1274:tok.preview-4.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1275:tok.preview.png:                   GIF image data, version 89a, 1920 x 1080
1283:traefik.preview.png:               PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1287:trufflehog.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1298:tut.preview.png:                   PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1300:txeh.preview.png:                  PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1308:udpx.preview.png:                  PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1323:v2raya.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1330:vhs.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1332:viddy.preview.png:                 PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1345:vopono.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1349:vtm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1360:watchexec.preview.png:             PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1400:xplr.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1404:yabs.sh.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1408:yazi.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1410:yggdrasil.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1416:yt-dlp.preview.png:                PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1419:z-tokens.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1424:zellij.preview.png:                PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1435:zoxide.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1436:zoxide.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1437:zoxide.preview.png:                GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

7113:cp: cannot stat './aptly-bin': No such file or directory
7115:./aptly: cannot open `./aptly' (No such file or directory)
7116:du: cannot access './aptly': No such file or directory
7117:cp: cannot stat './aptly': No such file or directory
17163:binutils-static-x86_64-unknown-linux-musl> checking the maximum length of command line arguments... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
17167:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
17185:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
17186:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
17195:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
18491:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
18828:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
19024:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
32143:cp: cannot stat './certwatcher': No such file or directory
40352:cp: cannot stat './cobalt': No such file or directory
40353:./cobalt: cannot open `./cobalt' (No such file or directory)
40354:du: cannot access './cobalt': No such file or directory
40355:cp: cannot stat './cobalt': No such file or directory
46355:cmp: .git/hooks/applypatch-msg: No such file or directory
46356:cmp: .git/hooks/commit-msg: No such file or directory
46357:cmp: .git/hooks/pre-applypatch: No such file or directory
46358:cmp: .git/hooks/pre-commit: No such file or directory
58273:cmp: .git/hooks/applypatch-msg: No such file or directory
58274:cmp: .git/hooks/commit-msg: No such file or directory
58275:cmp: .git/hooks/pre-applypatch: No such file or directory
58276:cmp: .git/hooks/pre-commit: No such file or directory
77910:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
77913:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
77916:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
94994:cp: cannot stat './dblab': No such file or directory
94995:./dblab: cannot open `./dblab' (No such file or directory)
94996:du: cannot access './dblab': No such file or directory
94997:cp: cannot stat './dblab': No such file or directory
104841:cp: cannot stat './dnspyre': No such file or directory
104843:./dnspyre: cannot open `./dnspyre' (No such file or directory)
104844:du: cannot access './dnspyre': No such file or directory
104845:cp: cannot stat './dnspyre': No such file or directory
105252:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
108819:cp: cannot stat './eget': No such file or directory
108820:./eget: cannot open `./eget' (No such file or directory)
108821:du: cannot access './eget': No such file or directory
108822:cp: cannot stat './eget': No such file or directory
112325:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
112913:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
120472:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
123259:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/0nzvf8n4kqhbb8zkacrbpmavzkwzxmik-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
125702:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
125711:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
125719:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
125721:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... checking for sys/param.h... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
125733:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
126306:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
126326:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
126332:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
128611:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
129832:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
130263:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
132371:gcc-static-x86_64-unknown-linux-musl> /nix/store/cikszmhsiabvz1scq8ligdlj5rbifqis-stdenv-linux/setup: line 258: /nix/store/l7n97992gd5piaw8phkxzsz176gfk1yj-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
132374:gcc-static-x86_64-unknown-linux-musl> /nix/store/cikszmhsiabvz1scq8ligdlj5rbifqis-stdenv-linux/setup: line 258: /nix/store/3zy36285azrdpv2yakiz8xsrcffc35vj-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
133419:gcc-static-x86_64-unknown-linux-musl> checking whether gcc supports -Wwrite-strings... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
136220:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
136410:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
138594:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
138595:gcc-static-x86_64-unknown-linux-musl> checking how to run the C preprocessor... /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
138678:gcc-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc -O2 -I/nix/store/0m7j1a16mh58wiax7q6vghi128ryd4cp-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -B/nix/store/5qh70km7bbjlsb6vhax5g9ycw2qc02x1-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ -idirafter /nix/store/0m7j1a16mh58wiax7q6vghi128ryd4cp-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -idirafter /nix/store/zdcraj3sk2sdd8giarhrydn3q96xw7k1-x86_64-unknown-linux-musl-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-musl/13.3.0/include-fixed -isystem /nix/store/1djx5n103dv14jwpqrwfwv37w807sdpj-fortify-headers-1.1alpine3/include -Wl,-rpath,/nix/store/lcvgkpz0275d74sr15j9crn8b4k60am4-gcc-static-x86_64-unknown-linux-musl-13.3.0-lib/lib -Wl,-L/nix/store/5qh70km7bbjlsb6vhax5g9ycw2qc02x1-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-rpath -Wl,/nix/store/5qh70km7bbjlsb6vhax5g9ycw2qc02x1-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-dynamic-linker=/nix/store/5qh70km7bbjlsb6vhax5g9ycw2qc02x1-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ld-musl-x86_64.so.1 --sysroot=/   supports -fno-rtti -fno-exceptions... checking fcntl.h usability... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
138790:gcc-static-x86_64-unknown-linux-musl> checking langinfo.h presence... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
139888:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
141070:gcc-static-x86_64-unknown-linux-musl> checking whether build environment is sane... /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
141133:gcc-static-x86_64-unknown-linux-musl> checking dynamic linker characteristics... /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
143015:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
143026:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
144280:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/bfd/configure: line 6938: /usr/bin/file: No such file or directory
145213:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
145886:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/gdb/configure: line 7248: /usr/bin/file: No such file or directory
145926:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
147214:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
147426:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
147429:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
147431:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
147432:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
147433:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
148300:cp: cannot stat './gfx': No such file or directory
162438:cp: cannot stat './gocryptfs': No such file or directory
162439:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
162442:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
162443:du: cannot access './gocryptfs': No such file or directory
162444:cp: cannot stat './gocryptfs': No such file or directory
162445:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
162446:du: cannot access './gocryptfs-xray': No such file or directory
162447:cp: cannot stat './gocryptfs-xray': No such file or directory
164619:cp: cannot stat './gost-bin': No such file or directory
165682:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
165939:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
165976:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
166009:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
166036:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
185838:cp: cannot stat './ipinfo-bin': No such file or directory
185839:./ipinfo: cannot open `./ipinfo' (No such file or directory)
185840:du: cannot access './ipinfo': No such file or directory
185841:cp: cannot stat './ipinfo': No such file or directory
185842:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
191069:iptables-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: /sbin/ldconfig: No such file or directory
193513:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
193515:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
193516:du: cannot access './ironrdp-client': No such file or directory
193517:cp: cannot stat './ironrdp-client': No such file or directory
197614:cp: cannot stat './katana': No such file or directory
197615:./katana: cannot open `./katana' (No such file or directory)
197616:du: cannot access './katana': No such file or directory
197617:cp: cannot stat './katana': No such file or directory
198016:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
198018:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
198514:cp: cannot stat './ksubdomain': No such file or directory
198515:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
198516:du: cannot access './ksubdomain': No such file or directory
198517:cp: cannot stat './ksubdomain': No such file or directory
200137:cp: cannot stat './libaws': No such file or directory
200139:./libaws: cannot open `./libaws' (No such file or directory)
200140:du: cannot access './libaws': No such file or directory
200141:cp: cannot stat './libaws': No such file or directory
200142:cp: cannot stat './libaws': No such file or directory
211862:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
218558:cp: cannot stat './mirrorbits': No such file or directory
218560:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
218561:du: cannot access './mirrorbits': No such file or directory
218562:cp: cannot stat './mirrorbits': No such file or directory
223120:rsync: [sender] change_dir "/tmp/toolpacks/fRTq5ZM_linux_x86_64/./result/bin" failed: No such file or directory (2)
223126:rsync: [sender] change_dir "/tmp/toolpacks/fRTq5ZM_linux_x86_64/./result/libexec/mtd-utils" failed: No such file or directory (2)
224296:cp: cannot stat './naabu-bin': No such file or directory
224297:./naabu: cannot open `./naabu' (No such file or directory)
224298:du: cannot access './naabu': No such file or directory
224299:cp: cannot stat './naabu': No such file or directory
224398:/tmp/UzH8Z_build.sh: line 30: /download/ncdu-2.6-linux-x86_64.tar.gz: No such file or directory
229892:cp: cannot stat './nezha-dashboard': No such file or directory
229897:cp: cannot stat './nezha-agent': No such file or directory
229898:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
229899:du: cannot access './nezha-dashboard': No such file or directory
229900:cp: cannot stat './nezha-dashboard': No such file or directory
229901:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
229902:du: cannot access './nezha-agent': No such file or directory
229903:cp: cannot stat './nezha-agent': No such file or directory
230266:/tmp/toolpack_x86_64/ngrok: cannot open `/tmp/toolpack_x86_64/ngrok' (No such file or directory)
230267:du: cannot access '/tmp/toolpack_x86_64/ngrok': No such file or directory
231640:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
231641:du: cannot access './result/bin/ncat': No such file or directory
231643:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
231644:du: cannot access './result/bin/nmap': No such file or directory
231646:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
231647:du: cannot access './result/bin/nping': No such file or directory
231648:cp: cannot stat './result/bin/ncat': No such file or directory
231649:cp: cannot stat './result/bin/nmap': No such file or directory
231650:cp: cannot stat './result/bin/nping': No such file or directory
237284:find: ‘./bin’: No such file or directory
237285:find: ‘./bin’: No such file or directory
237286:find: ‘./bin’: No such file or directory
237288:rsync: [sender] change_dir "/tmp/toolpacks/RalgULD_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
237294:rsync: [sender] change_dir "/tmp/toolpacks/RalgULD_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
237300:rsync: [sender] change_dir "/tmp/toolpacks/RalgULD_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
237306:rsync: [sender] change_dir "/tmp/toolpacks/RalgULD_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
239540:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
239541:du: cannot access './result/bin/openvpn': No such file or directory
239542:cp: cannot stat './result/bin/openvpn': No such file or directory
241276:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
243624:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
243629:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
243634:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
250809:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
250810:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
250813:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
250814:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
250817:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
250818:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
253769:cp: cannot stat './pktstat': No such file or directory
253771:./pktstat: cannot open `./pktstat' (No such file or directory)
253772:du: cannot access './pktstat': No such file or directory
253773:cp: cannot stat './pktstat': No such file or directory
273205:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
273207:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
273273:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
274154:find: ‘’: No such file or directory
274159:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
274160:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
275308:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
275309:./pwait: cannot open `./pwait' (No such file or directory)
275310:du: cannot access './pwait': No such file or directory
275311:cp: cannot stat './pwait': No such file or directory
277562:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
277567:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
277572:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
283800:cp: cannot stat '': No such file or directory
283850:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
289083:cp: cannot stat './bin/qemu-nios2': No such file or directory
294325:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
294326:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
294655:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
294707:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
294708:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
296284:cp: cannot stat './rescope': No such file or directory
297839:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
299279:find: ‘/tmp/toolpack_x86_64/ruri’: No such file or directory
319091:./samu: cannot open `./samu' (No such file or directory)
319092:du: cannot access './samu': No such file or directory
319093:cp: cannot stat './samu': No such file or directory
319094:cp: cannot stat './samu': No such file or directory
319327:cp: cannot stat './sbase': No such file or directory
319328:cp: cannot stat './sbase': No such file or directory
324970:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
324972:./smenu: cannot open `./smenu' (No such file or directory)
324973:du: cannot access './smenu': No such file or directory
324974:cp: cannot stat './smenu': No such file or directory
326680:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
326685:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
326690:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
328176:cp: cannot stat './spoof-dpi': No such file or directory
330092:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
332441:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
335321:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/0nzvf8n4kqhbb8zkacrbpmavzkwzxmik-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
335348:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
337342:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
338873:binutils-static-x86_64-unknown-linux-musl> checking if the linker (x86_64-unknown-linux-musl-ld) is GNU ld... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
338919:binutils-static-x86_64-unknown-linux-musl> checking for CFLocaleCopyPreferredLanguages... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
338924:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
338925:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
338926:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... checking for dlfcn.h... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
339101:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
339153:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
339156:binutils-static-x86_64-unknown-linux-musl> checking for CET support... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
339228:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
339324:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
341965:libpfm-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
342899:libpfm-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
344376:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
344377:du: cannot access './result/bin/stress-ng': No such file or directory
344378:cp: cannot stat './result/bin/stress-ng': No such file or directory
348484:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
348493:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
349315:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
349316:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
349383:cp: cannot stat './tailscale': No such file or directory
349384:cp: cannot stat './tailscaled': No such file or directory
349385:cp: cannot stat './tailscale_bb': No such file or directory
349386:./tailscale: cannot open `./tailscale' (No such file or directory)
349387:du: cannot access './tailscale': No such file or directory
349388:cp: cannot stat './tailscale': No such file or directory
349389:./tailscaled: cannot open `./tailscaled' (No such file or directory)
349390:du: cannot access './tailscaled': No such file or directory
349391:cp: cannot stat './tailscaled': No such file or directory
349392:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
349393:du: cannot access './tailscale_bb': No such file or directory
349394:cp: cannot stat './tailscale_bb': No such file or directory
349395:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
349396:du: cannot access './tailscale_bb': No such file or directory
349397:cp: cannot stat './tailscale_bb': No such file or directory
357541:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
357546:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
357551:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
362077:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
362079:./tracexec: cannot open `./tracexec' (No such file or directory)
362080:du: cannot access './tracexec': No such file or directory
362081:cp: cannot stat './tracexec': No such file or directory
363568:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
363570:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
363571:du: cannot access './tun2proxy': No such file or directory
363572:cp: cannot stat './tun2proxy': No such file or directory
364663:cp: cannot stat './ubase': No such file or directory
364664:cp: cannot stat './ubase': No such file or directory
371984:sed: can't read ./Cargo.toml: No such file or directory
371989:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
375348:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
375358:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
375359:du: cannot access './wezterm-gui': No such file or directory
375360:cp: cannot stat './wezterm-gui': No such file or directory
437433:cp: cannot stat './yggdrasil': No such file or directory
437434:cp: cannot stat './yggdrasilctl': No such file or directory
437437:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
437438:du: cannot access './yggdrasil': No such file or directory
437439:cp: cannot stat './yggdrasil': No such file or directory
437440:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
437441:du: cannot access './yggdrasilctl': No such file or directory
437442:cp: cannot stat './yggdrasilctl': No such file or directory
438017:cp: cannot stat './yq': No such file or directory
438019:./yq: cannot open `./yq' (No such file or directory)
438020:du: cannot access './yq': No such file or directory
438021:cp: cannot stat './yq': No such file or directory
441264:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/w680c2zzx1kbvmwyjqdxs53nnhnrdnwx-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.
441276:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/w680c2zzx1kbvmwyjqdxs53nnhnrdnwx-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

