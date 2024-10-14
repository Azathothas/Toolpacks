```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

24922-
24923- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-10-07 (09:48:02 PM) UTC]
24924-
24925-remote: Support for password authentication was removed on August 13, 2021.
24926-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
24927:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
24928-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
24929-cp: cannot stat './certwatcher': No such file or directory
24930-
--
122175-go: downloading github.com/sourcegraph/conc v0.2.0
122176-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
122177-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
122178-	remote: Support for password authentication was removed on August 13, 2021.
122179-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
122180:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
122181-cp: cannot stat './gfx': No such file or directory
122182-
122183-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):06(Sec)
--
376141-
376142- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-10-08 (08:11:40 AM) UTC]
376143-
376144-remote: Support for password authentication was removed on August 13, 2021.
376145-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
376146:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
376147-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
376148-sed: can't read ./Cargo.toml: No such file or directory
376149-error: failed to parse manifest at `/tmp/toolpacks/SpsJBon_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

84924-
84925-
84926-
84927- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-10-07 (11:35:17 PM) UTC]
84928-
84929:asset `x86_64-bin.tar.xz` not found
84930:asset `x86_64-bin.tar.xz` not found
--
95487-
95488-
95489-
95490- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-10-08 (12:06:11 AM) UTC]
95491-
95492:asset `arm` not found
95493:asset `arm` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) z-tokens [https://github.com/volution/z-tokens] :: 00(Hr):01(Min):05(Sec)


[-] command not found --> # Something failed to Install

44440:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
46299:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
46788:vim-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: hostname: command not found
48872:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
49717:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.3/libtool: line 1888: ldconfig: command not found
73300:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
73402:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
73862:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
74093:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
74542:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
74784:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
78433:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
80004:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
80496:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.3/libtool: line 1719: ldconfig: command not found
80498:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1719: ldconfig: command not found
88544:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
95002:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
96623:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
98777:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
102865:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
104332:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
106529:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
158228:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
158271:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
158557:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
159355:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
159515:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
160555:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.7/libtool: line 1886: ldconfig: command not found
161353:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.0.9/libtool: line 1719: ldconfig: command not found
161665:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
161718:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
161736:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
163737:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
163770:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
163816:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
171119:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
208274:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
208329:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
208347:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
208911:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
208912:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
208913:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
209036:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
209037:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
209038:masscan-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: git: command not found
224114:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
228994:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
229047:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
229065:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
233170:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
233230:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
242930:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
243608:pigz-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: which: command not found
245613:procps-static-x86_64-unknown-linux-musl> /build/procps-3.3.17/libtool: line 1719: ldconfig: command not found
281797:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
281857:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
304038:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
305955:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
308375:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
311956:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
314486:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
318709:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
321258:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
334502:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.1/libtool: line 1890: ldconfig: command not found
335360:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
335723:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
337845:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
340254:keyutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
340329:keyutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
341550:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
343290:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
343450:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
344741:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
344985:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
345689:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
347995:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
348501:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
348611:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
348715:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
348900:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
349073:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
358326:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
358377:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
358396:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
363577:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
371626:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
374115:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
374602:vim-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

86:binfetch:                         ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
756:netexec_dynamic:                  ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=04804d3c31218f938502cbed5cdd1af09d59a8f0, for GNU/Linux 2.6.32, stripped
833:pathbuster:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
883:promtail:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=12b150ecc8f6d62f070109e4f78264c09988f9a2, for GNU/Linux 3.2.0, stripped
1018:rqbit:                            ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped


[-] Incorrect Arch --> # Not for x86_64

8:age.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
12:aggligator.preview.png:           PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
17:albafetch.preview.png:            PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
19:algernon.preview.png:             JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
27:amass.preview.png:                PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
45:archey.preview.png:               PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
48:arduino-cli.preview.png:          PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
54:asn.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
58:assh.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
67:bandwhich.preview.png:            PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
68:base.default.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
72:batcat.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
80:berty.preview.png:                JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
83:bin.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
90:binocle.preview.png:              PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
105:broot.preview.png:                PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
108:btop.preview.png:                 PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
114:caddy.preview.png:                PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
126:certstream-server-go.preview.png: PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
127:certstream.preview-0.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
128:certstream.preview-1.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
129:certstream.preview-2.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
130:certstream.preview-3.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
131:certstream.preview-4.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
132:certstream.preview.png:           GIF image data, version 89a, 1920 x 1080
150:cherrybomb.preview.png:           PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
155:circumflex.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
168:cloudfox.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
172:cmd-wrapped.preview.png:          PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
175:cocogitto.preview.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
178:comb.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
179:comb.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
180:comb.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
181:comb.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
182:comb.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
183:comb.preview.png:                 GIF image data, version 89a, 1920 x 1080
199:croc.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
218:cut-cdn.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
220:cutlines.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
221:cutlines.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
222:cutlines.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
223:cutlines.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
224:cutlines.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
225:cutlines.preview.png:             GIF image data, version 89a, 1920 x 1080
230:czkawka.preview.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
233:dagu.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
234:daktilo.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
236:dalfox.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
243:dbeaver.preview.png:              PNG image data, 1000 x 500, 8-bit/color RGBA, non-interlaced
259:devpod.preview.png:               PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
270:dnstake.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
285:dotenv-linter.preview.png:        PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
295:duf.preview.png:                  PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
299:dvc.preview.png:                  PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
322:encrypted-dns-server.preview.png: PNG image data, 627 x 119, 8-bit colormap, non-interlaced
336:eza.preview.png:                  PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
348:feroxbuster.preview.png:          PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
355:fget.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
356:fget.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
357:fget.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
358:fget.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
359:fget.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
360:fget.preview.png:                 GIF image data, version 89a, 1920 x 1080
368:findomain.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
373:flawz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
375:fnm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
377:fq.preview.png:                   PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
379:freeze.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
386:fx.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
389:fzf.preview.png:                  PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
392:gdu.preview.png:                  PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
402:getJS.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
403:getJS.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
404:getJS.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
405:getJS.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
406:getJS.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
407:getJS.preview.png:                GIF image data, version 89a, 1920 x 1080
414:gh-dash.preview.png:              PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
415:gh.preview.png:                   PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
421:git-cliff.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
431:gitea.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
438:gitoxide.preview.png:             PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
441:gitpod-cli.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
444:gitui.preview.png:                PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
448:glow.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
455:goaccess.preview.png:             PNG image data, 725 x 411, 4-bit colormap, non-interlaced
476:gosmee.preview.png:               PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
477:gost:                             ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
483:gowitness.preview.png:            PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
486:gpg-tui.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
490:grex.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
496:gsocket.preview.png:              PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
498:gum.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
502:hacker-scoper.preview.png:        PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
507:hakrawler.preview.png:            PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
510:halp.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
513:haylxon.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
527:hexyl.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
535:htb-cli.preview.png:              PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
542:huggingface-cli.preview.png:      PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
544:hugo.preview.png:                 PNG image data, 900 x 450, 8-bit colormap, non-interlaced
549:husarnet.preview.png:             PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
554:hyperfine.preview.png:            PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
557:hysp.preview.png:                 PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
563:imhex.preview.png:                PNG image data, 1528 x 948, 8-bit/color RGB, non-interlaced
568:inscope.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
569:inscope.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
570:inscope.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
571:inscope.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
572:inscope.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
573:inscope.preview.png:              GIF image data, version 89a, 1920 x 1080
577:intermodal.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
592:istio.preview.png:                PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
601:jaeles.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
604:jc.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
609:jless.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
622:jwt-hack.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
624:k9s.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
635:kitty.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
637:kmon.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
643:kubo.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
646:lazydocker.preview.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
653:libtree.preview.png:              PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
658:listmonk.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
671:lorien.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
680:macchina.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
683:magick.preview.png:               PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
690:mantra.preview.png:               PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
694:massdns.preview.png:              PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
700:mdcat.preview.png:                PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
705:meli.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
710:micro.preview.png:                PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
713:miller.preview.png:               PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
718:miniserve.preview.png:            PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
742:mubeng.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
755:netexec.preview.png:              PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
772:ngocok.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
774:nicotine-plus.preview.png:        PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
786:noir.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
789:noseyparker.preview.png:          PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
806:ockam.preview.png:                PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
808:oha.preview.png:                  PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
822:osmedeus.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
826:ov.preview.png:                   PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
835:pdfcpu.preview.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
842:pfetch-rs.preview.png:            PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
844:pgrok.preview.png:                PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
860:pixi.preview.png:                 PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
862:pkg.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
866:planor.preview.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
868:pls.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
871:podsync.preview.png:              PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
874:ppfuzz.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
876:ppsspp.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
885:proot.preview.png:                PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
892:puredns.preview.png:              PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
898:qbittorrent-nox.preview.png:      JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
936:qsv.preview.png:                  PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
939:quotes-escaper.preview-0.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
940:quotes-escaper.preview-1.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
941:quotes-escaper.preview-2.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
942:quotes-escaper.preview-3.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
943:quotes-escaper.preview-4.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
944:quotes-escaper.preview.png:       GIF image data, version 89a, 1920 x 1080
947:rage.preview.png:                 PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
950:rate-limit-checker.preview-0.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
951:rate-limit-checker.preview-1.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
952:rate-limit-checker.preview-2.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
953:rate-limit-checker.preview-3.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
954:rate-limit-checker.preview-4.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
955:rate-limit-checker.preview.png:   GIF image data, version 89a, 1920 x 1080
957:rathole.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
959:rattler-build.preview.png:        PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
962:rclone.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
965:realm-tavern.preview.png:         PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
971:redguard.preview.png:             PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
982:rescope.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
984:resdns.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
985:resdns.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
986:resdns.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
987:resdns.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
988:resdns.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
989:resdns.preview.png:               GIF image data, version 89a, 1920 x 1080
993:resto.preview.png:                PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
995:reviewdog.preview.png:            PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
998:revive.preview.png:               PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1006:rippkgs-index.sqlite:             SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2
1027:runst.preview.png:                JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1029:ruri.preview.png:                 PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1035:rustscan.preview.png:             PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1052:scopegen.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1053:scopegen.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1054:scopegen.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1055:scopegen.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1056:scopegen.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1057:scopegen.preview.png:             GIF image data, version 89a, 1920 x 1080
1059:scopeview.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1060:scopeview.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1061:scopeview.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1062:scopeview.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1063:scopeview.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1064:scopeview.preview.png:            GIF image data, version 89a, 1920 x 1080
1080:shell2http.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1099:smap.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1102:smartdns.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1105:sn0int.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1110:soft-serve.preview.png:           JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1134:sshportal.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1137:sshx.preview.png:                 PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1143:starship.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1145:steampipe.preview.png:            PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1147:step.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1151:stree.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1161:subxtract.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1162:subxtract.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1163:subxtract.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1164:subxtract.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1165:subxtract.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1166:subxtract.preview.png:            GIF image data, version 89a, 1920 x 1080
1190:systeroid.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1195:tailscale.preview.png:            PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1201:tailspin.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1211:termshark.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1216:tidy-viewer.preview.png:          PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1226:tok.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1227:tok.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1228:tok.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1229:tok.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1230:tok.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1231:tok.preview.png:                  GIF image data, version 89a, 1920 x 1080
1239:traefik.preview.png:              PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1243:trufflehog.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1254:tut.preview.png:                  PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1256:txeh.preview.png:                 PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1263:udpx.preview.png:                 PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1278:v2raya.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1285:vhs.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1287:viddy.preview.png:                PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1298:vopono.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1302:vtm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1313:watchexec.preview.png:            PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1368:xplr.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1372:yabs.sh.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1376:yazi.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1378:yggdrasil.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1384:yt-dlp.preview.png:               PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1387:z-tokens.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1392:zellij.preview.png:               PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1403:zoxide.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1404:zoxide.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1405:zoxide.preview.png:               GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

3320:cp: cannot stat './aptly-bin': No such file or directory
3322:./aptly: cannot open `./aptly' (No such file or directory)
3323:du: cannot access './aptly': No such file or directory
3324:cp: cannot stat './aptly': No such file or directory
10191:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
10192:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
10194:binutils-static-x86_64-unknown-linux-musl> checking for ld used by GCC... checking for dlfcn.h... checking for dlfcn.h... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
10208:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
10246:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
11523:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/bfd/configure: line 6938: /usr/bin/file: No such file or directory
11862:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
12061:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libctf/configure: line 9376: /usr/bin/file: No such file or directory
24929:cp: cannot stat './certwatcher': No such file or directory
29192:cp: cannot stat './cobalt': No such file or directory
29193:./cobalt: cannot open `./cobalt' (No such file or directory)
29194:du: cannot access './cobalt': No such file or directory
29195:cp: cannot stat './cobalt': No such file or directory
35111:cmp: .git/hooks/applypatch-msg: No such file or directory
35112:cmp: .git/hooks/commit-msg: No such file or directory
35113:cmp: .git/hooks/pre-applypatch: No such file or directory
35114:cmp: .git/hooks/pre-commit: No such file or directory
41167:bash: line 17: ./configure: No such file or directory
41168:bash: line 25: ./configure: No such file or directory
41170:bash: line 30: ./configure: No such file or directory
41171:bash: line 38: ./configure: No such file or directory
54174:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
54177:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
54180:dateutils-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
71638:cp: cannot stat './dblab': No such file or directory
71639:./dblab: cannot open `./dblab' (No such file or directory)
71640:du: cannot access './dblab': No such file or directory
71641:cp: cannot stat './dblab': No such file or directory
80980:cp: cannot stat './dnspyre': No such file or directory
80982:./dnspyre: cannot open `./dnspyre' (No such file or directory)
80983:du: cannot access './dnspyre': No such file or directory
80984:cp: cannot stat './dnspyre': No such file or directory
81385:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
84591:cp: cannot stat './eget': No such file or directory
84592:./eget: cannot open `./eget' (No such file or directory)
84593:du: cannot access './eget': No such file or directory
84594:cp: cannot stat './eget': No such file or directory
87666:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
88254:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
94706:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
97177:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iyi8z1j8vljd6fbiizhyc09567j86cgz-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
99579:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
99597:binutils-static-x86_64-unknown-linux-musl> checking if the linker (x86_64-unknown-linux-musl-ld) is GNU ld... /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
99600:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
99609:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
99641:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
100241:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
100253:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
100262:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
102545:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/bfd/configure: line 6938: /usr/bin/file: No such file or directory
103765:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
104130:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libctf/configure: line 9376: /usr/bin/file: No such file or directory
105858:gcc-static-x86_64-unknown-linux-musl> /nix/store/dwhbqwrvr5dj76xf28smnfrfxv8arx90-stdenv-linux/setup: line 258: /nix/store/b74nxf0yn2dzha02mgdxyklaqjaijzqp-binutils-wrapper-2.42/nix-support/libc-ldflags-before: No such file or directory
105859:gcc-static-x86_64-unknown-linux-musl> /nix/store/dwhbqwrvr5dj76xf28smnfrfxv8arx90-stdenv-linux/setup: line 258: /nix/store/8k1rdgsbvc3mgi2xdsafiymvf6bzgxnl-x86_64-unknown-linux-musl-binutils-wrapper-2.42/nix-support/libc-ldflags-before: No such file or directory
107319:gcc-static-x86_64-unknown-linux-musl> checking stddef.h presence... checking stddef.h usability... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
110119:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
110309:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
112494:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
112495:gcc-static-x86_64-unknown-linux-musl> checking how to run the C preprocessor... /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
112577:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
112689:gcc-static-x86_64-unknown-linux-musl> checking for uint64_t... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
113788:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
114966:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
115033:gcc-static-x86_64-unknown-linux-musl> checking dynamic linker characteristics... /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
116914:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
116926:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
118195:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/bfd/configure: line 6938: /usr/bin/file: No such file or directory
119098:gdb-static-x86_64-unknown-linux-musl> checking for elf_fpregset_t in sys/procfs.h... /build/gdb-15.1/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
119778:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/gdb/configure: line 7248: /usr/bin/file: No such file or directory
119804:gdb-static-x86_64-unknown-linux-musl> checking whether the x86_64-unknown-linux-musl-gcc linker (x86_64-unknown-linux-musl-ld) supports shared libraries... /build/gdb-15.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
121112:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
121327:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
121328:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
121329:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
121330:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
121331:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
122181:cp: cannot stat './gfx': No such file or directory
136052:cp: cannot stat './gocryptfs': No such file or directory
136053:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
136056:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
136057:du: cannot access './gocryptfs': No such file or directory
136058:cp: cannot stat './gocryptfs': No such file or directory
136059:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
136060:du: cannot access './gocryptfs-xray': No such file or directory
136061:cp: cannot stat './gocryptfs-xray': No such file or directory
138158:cp: cannot stat './gost-bin': No such file or directory
139186:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
139440:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
139476:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
139512:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
139537:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158630:cp: cannot stat './ipinfo-bin': No such file or directory
158631:./ipinfo: cannot open `./ipinfo' (No such file or directory)
158632:du: cannot access './ipinfo': No such file or directory
158633:cp: cannot stat './ipinfo': No such file or directory
158634:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
163880:iptables-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /sbin/ldconfig: No such file or directory
166475:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
166477:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
166478:du: cannot access './ironrdp-client': No such file or directory
166479:cp: cannot stat './ironrdp-client': No such file or directory
170440:cp: cannot stat './katana': No such file or directory
170441:./katana: cannot open `./katana' (No such file or directory)
170442:du: cannot access './katana': No such file or directory
170443:cp: cannot stat './katana': No such file or directory
170842:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
170844:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
171319:cp: cannot stat './ksubdomain': No such file or directory
171320:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
171321:du: cannot access './ksubdomain': No such file or directory
171322:cp: cannot stat './ksubdomain': No such file or directory
172925:cp: cannot stat './libaws': No such file or directory
172927:./libaws: cannot open `./libaws' (No such file or directory)
172928:du: cannot access './libaws': No such file or directory
172929:cp: cannot stat './libaws': No such file or directory
172930:cp: cannot stat './libaws': No such file or directory
204214:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
210568:cp: cannot stat './mirrorbits': No such file or directory
210570:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
210571:du: cannot access './mirrorbits': No such file or directory
210572:cp: cannot stat './mirrorbits': No such file or directory
215285:cp: cannot stat './naabu-bin': No such file or directory
215286:./naabu: cannot open `./naabu' (No such file or directory)
215287:du: cannot access './naabu': No such file or directory
215288:cp: cannot stat './naabu': No such file or directory
215384:/tmp/FdvlR_build.sh: line 30: /download/ncdu-2.6-linux-x86_64.tar.gz: No such file or directory
220800:cp: cannot stat './nezha-dashboard': No such file or directory
220805:cp: cannot stat './nezha-agent': No such file or directory
220806:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
220807:du: cannot access './nezha-dashboard': No such file or directory
220808:cp: cannot stat './nezha-dashboard': No such file or directory
220809:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
220810:du: cannot access './nezha-agent': No such file or directory
220811:cp: cannot stat './nezha-agent': No such file or directory
222503:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
222504:du: cannot access './result/bin/ncat': No such file or directory
222506:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
222507:du: cannot access './result/bin/nmap': No such file or directory
222509:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
222510:du: cannot access './result/bin/nping': No such file or directory
222511:cp: cannot stat './result/bin/ncat': No such file or directory
222512:cp: cannot stat './result/bin/nmap': No such file or directory
222513:cp: cannot stat './result/bin/nping': No such file or directory
227530:find: ‘./bin’: No such file or directory
227531:find: ‘./bin’: No such file or directory
227532:find: ‘./bin’: No such file or directory
227534:rsync: [sender] change_dir "/tmp/toolpacks/5OjpSRV_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
227540:rsync: [sender] change_dir "/tmp/toolpacks/5OjpSRV_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
227546:rsync: [sender] change_dir "/tmp/toolpacks/5OjpSRV_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
227552:rsync: [sender] change_dir "/tmp/toolpacks/5OjpSRV_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
229761:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
229762:du: cannot access './result/bin/openvpn': No such file or directory
229763:cp: cannot stat './result/bin/openvpn': No such file or directory
231497:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
233637:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
233642:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
233649:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
241309:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
241310:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
241313:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
241314:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
241317:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
241318:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
244029:cp: cannot stat './pktstat': No such file or directory
244031:./pktstat: cannot open `./pktstat' (No such file or directory)
244032:du: cannot access './pktstat': No such file or directory
244033:cp: cannot stat './pktstat': No such file or directory
278142:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
278143:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
278210:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
279091:find: ‘’: No such file or directory
279096:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
279097:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
280170:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
280171:./pwait: cannot open `./pwait' (No such file or directory)
280172:du: cannot access './pwait': No such file or directory
280173:cp: cannot stat './pwait': No such file or directory
282206:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
282211:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
282216:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
294933:cp: cannot stat './bin/qemu-nios2': No such file or directory
300025:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
300026:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
300354:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
300406:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
300407:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
301896:cp: cannot stat './rescope': No such file or directory
303379:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
304520:result/bin/rsync: cannot open `result/bin/rsync' (No such file or directory)
304521:du: cannot access 'result/bin/rsync': No such file or directory
304522:cp: cannot stat 'result/bin/rsync': No such file or directory
304523:cp: cannot stat 'result/bin/rsync-ssl': No such file or directory
324433:./samu: cannot open `./samu' (No such file or directory)
324434:du: cannot access './samu': No such file or directory
324435:cp: cannot stat './samu': No such file or directory
324436:cp: cannot stat './samu': No such file or directory
324669:cp: cannot stat './sbase': No such file or directory
324670:cp: cannot stat './sbase': No such file or directory
330098:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
330100:./smenu: cannot open `./smenu' (No such file or directory)
330101:du: cannot access './smenu': No such file or directory
330102:cp: cannot stat './smenu': No such file or directory
331671:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
331676:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
331681:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
333161:cp: cannot stat './spoof-dpi': No such file or directory
335064:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
337344:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
340225:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/iyi8z1j8vljd6fbiizhyc09567j86cgz-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
340253:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
342326:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
343843:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
343874:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
343892:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/kgc6yccw7qf063fyjjjql4qk4mnmscdd-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.42/gprof/configure: line 6405: /usr/bin/file: No such file or directory
343901:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
343903:binutils-static-x86_64-unknown-linux-musl> checking target system type... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
343907:binutils-static-x86_64-unknown-linux-musl> checking for CFLocaleCopyPreferredLanguages... /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
343913:binutils-static-x86_64-unknown-linux-musl> checking for objdir... /build/binutils-2.42/binutils/configure: line 6608: /usr/bin/file: No such file or directory
343939:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.42/gas/configure: line 6527: /usr/bin/file: No such file or directory
343948:binutils-static-x86_64-unknown-linux-musl> checking for objdir... /build/binutils-2.42/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
343953:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... /build/binutils-2.42/ld/configure: line 7432: /usr/bin/file: No such file or directory
346856:libpfm-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
347772:libpfm-static-x86_64-unknown-linux-musl> /nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
349161:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
349162:du: cannot access './result/bin/stress-ng': No such file or directory
349163:cp: cannot stat './result/bin/stress-ng': No such file or directory
353235:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
353244:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
354064:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
354065:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
354111:cp: cannot stat './tailscale': No such file or directory
354112:cp: cannot stat './tailscaled': No such file or directory
354113:cp: cannot stat './tailscale_bb': No such file or directory
354114:./tailscale: cannot open `./tailscale' (No such file or directory)
354115:du: cannot access './tailscale': No such file or directory
354116:cp: cannot stat './tailscale': No such file or directory
354117:./tailscaled: cannot open `./tailscaled' (No such file or directory)
354118:du: cannot access './tailscaled': No such file or directory
354119:cp: cannot stat './tailscaled': No such file or directory
354120:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
354121:du: cannot access './tailscale_bb': No such file or directory
354122:cp: cannot stat './tailscale_bb': No such file or directory
354123:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
354124:du: cannot access './tailscale_bb': No such file or directory
354125:cp: cannot stat './tailscale_bb': No such file or directory
362193:readline-static-x86_64-unknown-linux-musl> /nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
362198:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
362203:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/biw2sn12yzhcwh63762ll590wibmj4c5-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
366709:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
366711:./tracexec: cannot open `./tracexec' (No such file or directory)
366712:du: cannot access './tracexec': No such file or directory
366713:cp: cannot stat './tracexec': No such file or directory
368118:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
368120:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
368121:du: cannot access './tun2proxy': No such file or directory
368122:cp: cannot stat './tun2proxy': No such file or directory
368976:cp: cannot stat './ubase': No such file or directory
368977:cp: cannot stat './ubase': No such file or directory
376148:sed: can't read ./Cargo.toml: No such file or directory
376153:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
379527:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
379537:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
379538:du: cannot access './wezterm-gui': No such file or directory
379539:cp: cannot stat './wezterm-gui': No such file or directory
474148:cp: cannot stat './yggdrasil': No such file or directory
474149:cp: cannot stat './yggdrasilctl': No such file or directory
474152:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
474153:du: cannot access './yggdrasil': No such file or directory
474154:cp: cannot stat './yggdrasil': No such file or directory
474155:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
474156:du: cannot access './yggdrasilctl': No such file or directory
474157:cp: cannot stat './yggdrasilctl': No such file or directory
474732:cp: cannot stat './yq': No such file or directory
474734:./yq: cannot open `./yq' (No such file or directory)
474735:du: cannot access './yq': No such file or directory
474736:cp: cannot stat './yq': No such file or directory
477946:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/4zi0kvynzy1w4xnx7kshgm4pwlp36cli-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.
477958:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/4zi0kvynzy1w4xnx7kshgm4pwlp36cli-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

