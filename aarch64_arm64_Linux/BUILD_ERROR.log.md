```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

26248-
26249- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-11-04 (11:34:54 PM) UTC]
26250-
26251-remote: Support for password authentication was removed on August 13, 2021.
26252-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
26253:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
26254-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
26255-cp: cannot stat './certwatcher': No such file or directory
26256-
--
161129-go: downloading github.com/sourcegraph/conc v0.2.0
161130-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
161131-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
161132-	remote: Support for password authentication was removed on August 13, 2021.
161133-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
161134:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
161135-cp: cannot stat './gfx': No such file or directory
161136-
161137-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):10(Sec)
--
424245-
424246- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-11-05 (06:34:46 PM) UTC]
424247-
424248-remote: Support for password authentication was removed on August 13, 2021.
424249-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
424250:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
424251-info: component 'rust-std' for target 'aarch64-unknown-linux-musl' is up to date
424252-sed: can't read ./Cargo.toml: No such file or directory
424253-error: failed to parse manifest at `/tmp/toolpacks/2ndgiQ3_linux_aarch64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

335290-
335291-
335292-
335293- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-11-05 (02:42:39 PM) UTC]
335294-
335295:asset `ruri` not found
--
355503-
355504-
355505-
355506- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-11-05 (03:10:46 PM) UTC]
355507-
355508:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):42(Sec)


[-] command not found --> # Something failed to Install

63797:cpufetch-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: git: command not found
68806:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
69321:vim-static-aarch64-unknown-linux-musl> /nix/store/k2wspf0nq81hxjwxsnb8r9cg08qngdk2-bash-5.2p32/bin/bash: line 1: hostname: command not found
71348:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
72180:cryptsetup-static-aarch64-unknown-linux-musl> /build/cryptsetup-2.7.4/libtool: line 1888: ldconfig: command not found
96014:libXau-static-aarch64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
96107:libXdmcp-static-aarch64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
96566:libICE-static-aarch64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
96813:libapparmor-static-aarch64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
97289:libSM-static-aarch64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
97485:libxcb-static-aarch64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
101119:dbus-static-aarch64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
102937:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
103172:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
103363:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
108882:ck-static-aarch64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
109366:ldns-static-aarch64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
109368:ldns-static-aarch64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
118314:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
131116:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
133054:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
135260:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
139190:mpfr-static-aarch64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
142289:libmpc-static-aarch64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
146280:source-highlight-static-aarch64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
200461:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
200504:lksctp-tools-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
200787:iperf-static-aarch64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
201606:libmnl-static-aarch64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
202108:libnfnetlink-static-aarch64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
202884:libnftnl-static-aarch64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
203078:libnetfilter_conntrack-static-aarch64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
203791:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
203843:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
203862:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
205832:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
205862:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
205908:iptables-static-aarch64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
213415:kmod-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
236068:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
236120:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
236138:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
236671:masscan-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: which: command not found
236672:masscan-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: which: command not found
236673:masscan-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: git: command not found
236796:masscan-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: which: command not found
236797:masscan-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: which: command not found
236798:masscan-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: git: command not found
245947:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
260642:numactl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
269184:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
269229:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
269247:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
273969:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
274075:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
274135:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
286212:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
286893:pigz-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: which: command not found
289275:procps-static-aarch64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
314569:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
314714:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
314776:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
334545:popt-static-aarch64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
336846:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
339266:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
342847:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
345375:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
349596:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
352144:file-static-aarch64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
360943:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
361172:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
361398:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
373888:squashfs-tools-ng-static-aarch64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
374730:fuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
375101:squashfuse-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
377253:libunwind-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
379474:keyutils-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
379492:keyutils-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
379936:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
383321:libomxil-bellagio-static-aarch64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
383653:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
383792:gdbm-static-aarch64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
383937:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
384521:isl-static-aarch64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
394636:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
394687:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
394705:libnl-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
399017:gnum4-static-aarch64-unknown-linux-musl> ./configure: line 8334: hostname: command not found
399424:musl-fts-static-aarch64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
399564:libffi-static-aarch64-unknown-linux-musl> /build/libffi-3.4.6/aarch64-unknown-linux-musl/libtool: line 1901: ldconfig: command not found
408370:libevent-static-aarch64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
416502:util-linux-static-aarch64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
422188:gawk-static-aarch64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
422690:vim-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

234:cron:                              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
238:crontab:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
390:filan:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
666:linuxdeploy.no_strip:              ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=0cb09c8cecdebf11ffcbb472525d94d86d6400b9, stripped
768:netexec_dynamic:                   ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=b63b89a15f6ec03744182679a2baeb3902697a02, for GNU/Linux 3.7.0, stripped
886:procan:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
889:promtail:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=6f43d8c296faf48183f86fb42259d4610813973d, for GNU/Linux 3.7.0, stripped
1016:rqbit:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
1104:socat:                             ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped


[-] Incorrect Arch --> # Not for aarch64

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
36:age.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
40:aggligator.preview.png:            PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
45:albafetch.preview.png:             PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
47:algernon.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
56:amass.preview.png:                 PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
76:archey.preview.png:                PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
80:arduino-cli.preview.png:           PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
87:asn.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
91:assh.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
100:bandwhich.preview.png:             PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
101:base.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
105:batcat.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
113:berty.preview.png:                 JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
116:bin.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
123:binocle.preview.png:               PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
125:bita.preview.png:                  PNG image data, 512 x 184, 8-bit/color RGBA, non-interlaced
140:broot.preview.png:                 PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
143:btop.preview.png:                  PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
151:caddy.preview.png:                 PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
162:certstream-server-go.preview.png:  PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
163:certstream.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
164:certstream.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
165:certstream.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
166:certstream.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
167:certstream.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
168:certstream.preview.png:            GIF image data, version 89a, 1920 x 1080
185:cherrybomb.preview.png:            PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
191:circumflex.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
203:cloudfox.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
207:cmd-wrapped.preview.png:           PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
210:cocogitto.preview.png:             PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
213:comb.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
214:comb.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
215:comb.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
216:comb.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
217:comb.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
218:comb.preview.png:                  GIF image data, version 89a, 1920 x 1080
233:croc.preview.png:                  JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
252:cut-cdn.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
254:cutlines.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
255:cutlines.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
256:cutlines.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
257:cutlines.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
258:cutlines.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
259:cutlines.preview.png:              GIF image data, version 89a, 1920 x 1080
263:czkawka.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
266:dagu.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
267:daktilo.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
269:dalfox.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
292:devpod.preview.png:                PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
304:dnstake.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
319:dotenv-linter.preview.png:         PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
329:duf.preview.png:                   PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
333:dvc.preview.png:                   PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
350:elinks:                            ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
351:elinks-lite:                       ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
356:encrypted-dns-server.preview.png:  PNG image data, 627 x 119, 8-bit colormap, non-interlaced
370:eza.preview.png:                   PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
381:feroxbuster.preview.png:           PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
388:fget.preview.png:                  GIF image data, version 89a, 1920 x 1080
395:findomain.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
399:flawz.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
401:fnm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
403:fq.preview.png:                    PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
405:freeze.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
412:fx.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
415:fzf.preview.png:                   PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
420:gdu.preview.png:                   PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
430:getJS.preview.png:                 GIF image data, version 89a, 1920 x 1080
437:gh-dash.preview.png:               PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
438:gh.preview.png:                    PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
444:git-cliff.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
454:gitea.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
461:gitoxide.preview.png:              PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
464:gitpod-cli.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
467:gitui.preview.png:                 PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
471:glow.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
478:goaccess.preview.png:              PNG image data, 725 x 411, 4-bit colormap, non-interlaced
499:gosmee.preview.png:                PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
505:gowitness.preview.png:             PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
508:gpg-tui.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
512:grex.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
518:gsocket.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
520:gum.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
524:hacker-scoper.preview.png:         PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
529:hakrawler.preview.png:             PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
532:halp.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
535:haylxon.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
549:hexyl.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
557:htb-cli.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
564:huggingface-cli.preview.png:       PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
566:hugo.preview.png:                  PNG image data, 900 x 450, 8-bit colormap, non-interlaced
571:husarnet.preview.png:              PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
576:hyperfine.preview.png:             PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
577:hypervisor-fw:                     Linux kernel ARM64 boot executable Image, little-endian
579:hysp.preview.png:                  PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
588:inscope.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
589:inscope.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
590:inscope.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
591:inscope.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
592:inscope.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
593:inscope.preview.png:               GIF image data, version 89a, 1920 x 1080
597:intermodal.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
609:istio.preview.png:                 PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
612:jaeles.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
615:jc.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
620:jless.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
633:jwt-hack.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
635:k9s.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
646:kitty.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
648:kmon.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
655:kubo.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
658:lazydocker.preview.png:            PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
664:libtree.preview.png:               PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
669:listmonk.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
681:lorien.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
690:macchina.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
693:magick.preview.png:                PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
700:mantra.preview.png:                PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
704:massdns.preview.png:               PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
710:mdcat.preview.png:                 PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
715:meli.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
720:micro.preview.png:                 PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
723:miller.preview.png:                PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
728:miniserve.preview.png:             PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
752:mubeng.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
767:netexec.preview.png:               PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
784:ngocok.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
786:nicotine-plus.preview.png:         PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
794:noir.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
798:noseyparker.preview.png:           PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
814:ockam.preview.png:                 PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
816:oha.preview.png:                   PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
829:osmedeus.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
833:ov.preview.png:                    PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
841:pdfcpu.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
849:pfetch-rs.preview.png:             PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
851:pgrok.preview.png:                 PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
866:pixi.preview.png:                  PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
868:pkg.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
872:planor.preview.png:                PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
874:pls.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
877:podsync.preview.png:               PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
880:ppfuzz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
882:ppsspp.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
891:proot.preview.png:                 PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
900:puredns.preview.png:               PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
906:qbittorrent-nox.preview.png:       JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
944:qsv.preview.png:                   PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
947:quotes-escaper.preview-0.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
948:quotes-escaper.preview-1.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
949:quotes-escaper.preview-2.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
950:quotes-escaper.preview-3.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
951:quotes-escaper.preview-4.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
952:quotes-escaper.preview.png:        GIF image data, version 89a, 1920 x 1080
955:rage.preview.png:                  PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
958:rate-limit-checker.preview.png:    GIF image data, version 89a, 1920 x 1080
961:rathole.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
963:rattler-build.preview.png:         PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
966:rclone.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
969:realm-tavern.preview.png:          PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
973:redguard.preview.png:              PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
983:rescope.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
985:resdns.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
986:resdns.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
987:resdns.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
988:resdns.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
989:resdns.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
990:resdns.preview.png:                GIF image data, version 89a, 1920 x 1080
994:resto.preview.png:                 PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
996:reviewdog.preview.png:             PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
999:revive.preview.png:                PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1025:runst.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1027:ruri.preview.png:                  PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1029:rust-hypervisor-firmware:          Linux kernel ARM64 boot executable Image, little-endian
1033:rustscan.preview.png:              PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1043:sadf:                              ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
1049:scopegen.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1050:scopegen.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1051:scopegen.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1052:scopegen.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1053:scopegen.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1054:scopegen.preview.png:              GIF image data, version 89a, 1920 x 1080
1056:scopeview.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1057:scopeview.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1058:scopeview.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1059:scopeview.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1060:scopeview.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1061:scopeview.preview.png:             GIF image data, version 89a, 1920 x 1080
1079:shell2http.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1096:smap.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1099:smartdns.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1101:sn0int.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1106:soft-serve.preview.png:            JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1123:sshportal.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1126:sshx.preview.png:                  PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1132:starship.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1134:steampipe.preview.png:             PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1135:step.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1139:stree.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1149:subxtract.preview.png:             GIF image data, version 89a, 1920 x 1080
1169:systeroid.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1173:tailscale.preview.png:             PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1178:tailspin.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1188:termshark.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1193:tidy-viewer.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1203:tok.preview-0.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1204:tok.preview-1.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1205:tok.preview-2.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1206:tok.preview-3.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1207:tok.preview-4.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1208:tok.preview.png:                   GIF image data, version 89a, 1920 x 1080
1214:traefik.preview.png:               PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1218:trufflehog.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1229:tut.preview.png:                   PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1231:txeh.preview.png:                  PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1239:udpx.preview.png:                  PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1254:v2raya.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1261:vhs.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1263:viddy.preview.png:                 PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1274:vopono.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1278:vtm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1289:watchexec.preview.png:             PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1342:xplr.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1346:yabs.sh.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1350:yazi.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1352:yggdrasil.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1358:yt-dlp.preview.png:                PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1361:z-tokens.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1366:zellij.preview.png:                PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1377:zoxide.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1378:zoxide.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1379:zoxide.preview.png:                GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

1042:cp: cannot stat './target//release/agrind': No such file or directory
3242:  No such file or directory (os error 2)
3243:find: ‘./target/x86_64-unknown-linux-musl/release’: No such file or directory
3806:cp: cannot stat './aptly-bin': No such file or directory
3808:./aptly: cannot open `./aptly' (No such file or directory)
3809:du: cannot access './aptly': No such file or directory
3810:cp: cannot stat './aptly': No such file or directory
15725:Error: open /tmp/tmp.HKA2lysdCF/temp.yaml: no such file or directory
15726:Error: open /tmp/tmp.HKA2lysdCF/temp.yaml: no such file or directory
15727:Error: open /tmp/tmp.HKA2lysdCF/temp.yaml: no such file or directory
15728:Error: open /tmp/tmp.HKA2lysdCF/temp.yaml: no such file or directory
15729:Error: open /tmp/tmp.HKA2lysdCF/temp.yaml: no such file or directory
15847:Error: open /tmp/tmp.GpLvTcEDHb/temp.yaml: no such file or directory
15848:Error: open /tmp/tmp.GpLvTcEDHb/temp.yaml: no such file or directory
15849:Error: open /tmp/tmp.GpLvTcEDHb/temp.yaml: no such file or directory
15850:Error: open /tmp/tmp.GpLvTcEDHb/temp.yaml: no such file or directory
15851:Error: open /tmp/tmp.GpLvTcEDHb/temp.yaml: no such file or directory
17234:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/boltconn': No such file or directory
18274:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
26255:cp: cannot stat './certwatcher': No such file or directory
35490:cp: cannot stat './cloudfox': No such file or directory
35603:cp: cannot stat './cobalt': No such file or directory
35604:./cobalt: cannot open `./cobalt' (No such file or directory)
35605:du: cannot access './cobalt': No such file or directory
35606:cp: cannot stat './cobalt': No such file or directory
41907:cmp: .git/hooks/applypatch-msg: No such file or directory
41908:cmp: .git/hooks/commit-msg: No such file or directory
41909:cmp: .git/hooks/pre-applypatch: No such file or directory
41910:cmp: .git/hooks/pre-commit: No such file or directory
53981:cmp: .git/hooks/applypatch-msg: No such file or directory
53982:cmp: .git/hooks/commit-msg: No such file or directory
53983:cmp: .git/hooks/pre-applypatch: No such file or directory
53984:cmp: .git/hooks/pre-commit: No such file or directory
76500:dateutils-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
76503:dateutils-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
76506:dateutils-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
94365:cp: cannot stat './dblab': No such file or directory
94366:./dblab: cannot open `./dblab' (No such file or directory)
94367:du: cannot access './dblab': No such file or directory
94368:cp: cannot stat './dblab': No such file or directory
102499:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
108572:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/dizi': No such file or directory
109847:cp: cannot stat './dnspyre': No such file or directory
109849:./dnspyre: cannot open `./dnspyre' (No such file or directory)
109850:du: cannot access './dnspyre': No such file or directory
109851:cp: cannot stat './dnspyre': No such file or directory
110253:doas-static-aarch64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
113811:cp: cannot stat './eget': No such file or directory
113812:./eget: cannot open `./eget' (No such file or directory)
113813:du: cannot access './eget': No such file or directory
113814:cp: cannot stat './eget': No such file or directory
114954:cp: cannot stat './entropy': No such file or directory
114955:./entropy: cannot open `./entropy' (No such file or directory)
114956:du: cannot access './entropy': No such file or directory
114957:cp: cannot stat './entropy': No such file or directory
117444:exfatprogs-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
118028:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
130629:rsync: [sender] change_dir "/tmp/toolpacks/or9R9P2_linux_aarch64/./result/bin" failed: No such file or directory (2)
130830:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
131213:rsync: [sender] change_dir "/tmp/toolpacks/3OqURLy_linux_aarch64/./result/bin" failed: No such file or directory (2)
133619:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/z5kf3pf3qn3v1rmkcnxakxv9xpm3qf98-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
144144:readline-static-aarch64-unknown-linux-musl> /nix/store/y0b3ma3hs7pbnym8zg5jslr72aj47981-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
144150:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
144155:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
145251:gcc-static-aarch64-unknown-linux-musl> /nix/store/p8aiklvfqqr9ddaq4crxxf9k7xrbikhg-stdenv-linux/setup: line 260: /nix/store/anmwlb2bqlxh43gk5z3jf07v5z2jfgii-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
145252:gcc-static-aarch64-unknown-linux-musl> /nix/store/p8aiklvfqqr9ddaq4crxxf9k7xrbikhg-stdenv-linux/setup: line 260: /nix/store/lyz207sxcb43sn0d8fv60jr4b6alxdc2-aarch64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
160037:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160250:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160251:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160252:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160253:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
160255:gdb-static-aarch64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
161135:cp: cannot stat './gfx': No such file or directory
174637:cp: cannot stat './go-audit': No such file or directory
174638:./go-audit: cannot open `./go-audit' (No such file or directory)
174639:du: cannot access './go-audit': No such file or directory
174640:cp: cannot stat './go-audit': No such file or directory
174875:cp: cannot stat './gocryptfs': No such file or directory
174876:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
174879:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
174880:du: cannot access './gocryptfs': No such file or directory
174881:cp: cannot stat './gocryptfs': No such file or directory
174882:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
174883:du: cannot access './gocryptfs-xray': No such file or directory
174884:cp: cannot stat './gocryptfs-xray': No such file or directory
177596:cp: cannot stat './gowitness': No such file or directory
177989:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/gpg-tui': No such file or directory
178248:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
178286:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
178324:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
178346:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
188114:cp: cannot stat './target/aarch64-unknown-linux-musl/release/horust': No such file or directory
193189:rm: cannot remove './rust-toolchain.toml': No such file or directory
200860:cp: cannot stat './ipinfo-bin': No such file or directory
200861:./ipinfo: cannot open `./ipinfo' (No such file or directory)
200862:du: cannot access './ipinfo': No such file or directory
200863:cp: cannot stat './ipinfo': No such file or directory
200864:cp: cannot stat '/tmp/toolpack_aarch64/ipinfo': No such file or directory
205972:iptables-static-aarch64-unknown-linux-musl> /nix/store/j5z5pvvahd58k9ffy6v74m9rkbi9nqqh-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
208452:cp: cannot stat './target/aarch64-unknown-linux-musl/release/ironrdp-client': No such file or directory
208454:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
208455:du: cannot access './ironrdp-client': No such file or directory
208456:cp: cannot stat './ironrdp-client': No such file or directory
212754:cp: cannot stat './katana': No such file or directory
212755:./katana: cannot open `./katana' (No such file or directory)
212756:du: cannot access './katana': No such file or directory
212757:cp: cannot stat './katana': No such file or directory
213138:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
213140:kmod-static-aarch64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
213572:rm: cannot remove './rust-toolchain.toml': No such file or directory
213762:cp: cannot stat './ksubdomain': No such file or directory
213763:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
213764:du: cannot access './ksubdomain': No such file or directory
213765:cp: cannot stat './ksubdomain': No such file or directory
215434:cp: cannot stat './libaws': No such file or directory
215436:./libaws: cannot open `./libaws' (No such file or directory)
215437:du: cannot access './libaws': No such file or directory
215438:cp: cannot stat './libaws': No such file or directory
215439:cp: cannot stat './libaws': No such file or directory
230197:lsof-static-aarch64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
234140:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
234142:rsync: [sender] link_stat "/tmp/toolpacks/aax3pQr_linux_aarch64/magick_appbundle.no_strip" failed: No such file or directory (2)
238978:cp: cannot stat './mirrorbits': No such file or directory
238980:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
238981:du: cannot access './mirrorbits': No such file or directory
238982:cp: cannot stat './mirrorbits': No such file or directory
246713:rsync: [sender] change_dir "/tmp/toolpacks/pbWZHeD_linux_aarch64/./result/bin" failed: No such file or directory (2)
246719:rsync: [sender] change_dir "/tmp/toolpacks/pbWZHeD_linux_aarch64/./result/libexec/mtd-utils" failed: No such file or directory (2)
251012:cp: cannot stat './naabu-bin': No such file or directory
251013:./naabu: cannot open `./naabu' (No such file or directory)
251014:du: cannot access './naabu': No such file or directory
251015:cp: cannot stat './naabu': No such file or directory
251300:/tmp/UF4GO_build.sh: line 30: /download/ncdu-2.6-linux-aarch64.tar.gz: No such file or directory
256756:cp: cannot stat './nezha-dashboard': No such file or directory
256761:cp: cannot stat './nezha-agent': No such file or directory
256762:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
256763:du: cannot access './nezha-dashboard': No such file or directory
256764:cp: cannot stat './nezha-dashboard': No such file or directory
256765:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
256766:du: cannot access './nezha-agent': No such file or directory
256767:cp: cannot stat './nezha-agent': No such file or directory
257139:/tmp/toolpack_aarch64/ngrok: cannot open `/tmp/toolpack_aarch64/ngrok' (No such file or directory)
257140:du: cannot access '/tmp/toolpack_aarch64/ngrok': No such file or directory
258247:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
258248:du: cannot access './result/bin/ncat': No such file or directory
258250:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
258251:du: cannot access './result/bin/nmap': No such file or directory
258253:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
258254:du: cannot access './result/bin/nping': No such file or directory
258255:cp: cannot stat './result/bin/ncat': No such file or directory
258256:cp: cannot stat './result/bin/nmap': No such file or directory
258257:cp: cannot stat './result/bin/nping': No such file or directory
267757:find: ‘./bin’: No such file or directory
267758:find: ‘./bin’: No such file or directory
267759:find: ‘./bin’: No such file or directory
267761:rsync: [sender] change_dir "/tmp/toolpacks/PqqpXyK_linux_aarch64/static-cross-openssh/./bin" failed: No such file or directory (2)
267767:rsync: [sender] change_dir "/tmp/toolpacks/PqqpXyK_linux_aarch64/static-cross-openssh/./etc" failed: No such file or directory (2)
267773:rsync: [sender] change_dir "/tmp/toolpacks/PqqpXyK_linux_aarch64/static-cross-openssh/./libexec" failed: No such file or directory (2)
267779:rsync: [sender] change_dir "/tmp/toolpacks/PqqpXyK_linux_aarch64/static-cross-openssh/./sbin" failed: No such file or directory (2)
269937:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
269938:du: cannot access './result/bin/openvpn': No such file or directory
269939:cp: cannot stat './result/bin/openvpn': No such file or directory
277464:readline-static-aarch64-unknown-linux-musl> /nix/store/y0b3ma3hs7pbnym8zg5jslr72aj47981-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
277469:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
277474:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
284596:/tmp/toolpack_aarch64/php: cannot open `/tmp/toolpack_aarch64/php' (No such file or directory)
284597:du: cannot access '/tmp/toolpack_aarch64/php': No such file or directory
284600:/tmp/toolpack_aarch64/php-fpm: cannot open `/tmp/toolpack_aarch64/php-fpm' (No such file or directory)
284601:du: cannot access '/tmp/toolpack_aarch64/php-fpm': No such file or directory
284604:/tmp/toolpack_aarch64/php-micro: cannot open `/tmp/toolpack_aarch64/php-micro' (No such file or directory)
284605:du: cannot access '/tmp/toolpack_aarch64/php-micro': No such file or directory
287546:cp: cannot stat './pktstat': No such file or directory
287548:./pktstat: cannot open `./pktstat' (No such file or directory)
287549:du: cannot access './pktstat': No such file or directory
287550:cp: cannot stat './pktstat': No such file or directory
307185:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
307189:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
307249:/usr/lib/gcc/aarch64-alpine-linux-musl/13.2.1/../../../../aarch64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
312481:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
312482:./pwait: cannot open `./pwait' (No such file or directory)
312483:du: cannot access './pwait': No such file or directory
312484:cp: cannot stat './pwait': No such file or directory
315029:readline-static-aarch64-unknown-linux-musl> /nix/store/y0b3ma3hs7pbnym8zg5jslr72aj47981-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
315034:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
315039:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
321234:cp: cannot stat '': No such file or directory
321283:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
326506:cp: cannot stat './bin/qemu-nios2': No such file or directory
330559:cp: cannot stat './target/aarch64-unknown-linux-musl/release/golem': No such file or directory
330560:cp: cannot stat './target/aarch64-unknown-linux-musl/release/imix': No such file or directory
330870:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
330927:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
330928:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
332485:cp: cannot stat './rescope': No such file or directory
333890:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
335298:find: ‘/tmp/toolpack_aarch64/ruri’: No such file or directory
355328:./samu: cannot open `./samu' (No such file or directory)
355329:du: cannot access './samu': No such file or directory
355330:cp: cannot stat './samu': No such file or directory
355331:cp: cannot stat './samu': No such file or directory
355492:./sbase-box: cannot open `./sbase-box' (No such file or directory)
355493:du: cannot access './sbase-box': No such file or directory
355494:cp: cannot stat './sbase-box': No such file or directory
355495:cp: cannot stat './sbase-box': No such file or directory
355496:cp: cannot stat './sbase': No such file or directory
355497:cp: cannot stat './sbase': No such file or directory
360417:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
366221:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
366223:./smenu: cannot open `./smenu' (No such file or directory)
366224:du: cannot access './smenu': No such file or directory
366225:cp: cannot stat './smenu': No such file or directory
371054:readline-static-aarch64-unknown-linux-musl> /nix/store/y0b3ma3hs7pbnym8zg5jslr72aj47981-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
371059:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
371064:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
372547:cp: cannot stat './spoof-dpi': No such file or directory
374444:fuse-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
376744:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
379423:isl-static-aarch64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/z5kf3pf3qn3v1rmkcnxakxv9xpm3qf98-isl-static-aarch64-unknown-linux-musl-0.20: No such file or directory
379473:keyutils-static-aarch64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
384414:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
384698:musl-obstack-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
384998:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
384999:du: cannot access './result/bin/stress-ng': No such file or directory
385000:cp: cannot stat './result/bin/stress-ng': No such file or directory
389015:find: ‘/usr/src/linux-headers-6.1.0-25-arm64’: No such file or directory
389024:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
389829:cp: cannot stat './target/aarch64-unknown-linux-musl/release/system_info_collector': No such file or directory
389830:cp: cannot stat './target/aarch64-unknown-linux-musl/release/system_info_collector': No such file or directory
398484:musl-fts-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
406340:readline-static-aarch64-unknown-linux-musl> /nix/store/y0b3ma3hs7pbnym8zg5jslr72aj47981-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
406347:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
406353:readline-static-aarch64-unknown-linux-musl> mv: cannot stat '/nix/store/yh21rzjc3w0zlwv2zyazv9lhgzlqwb4h-readline-static-aarch64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
411129:  = note: No such file or directory (os error 2)
411281:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tracexec': No such file or directory
411283:./tracexec: cannot open `./tracexec' (No such file or directory)
411284:du: cannot access './tracexec': No such file or directory
411285:cp: cannot stat './tracexec': No such file or directory
412782:cp: cannot stat './target/aarch64-unknown-linux-musl/release/tun2proxy': No such file or directory
412784:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
412785:du: cannot access './tun2proxy': No such file or directory
412786:cp: cannot stat './tun2proxy': No such file or directory
413781:cp: cannot stat './ubase': No such file or directory
413782:cp: cannot stat './ubase': No such file or directory
424252:sed: can't read ./Cargo.toml: No such file or directory
424257:cp: cannot stat './target/aarch64-unknown-linux-musl/release/vproxy': No such file or directory
427608:cp: cannot stat './target/aarch64-unknown-linux-musl/release/wezterm-gui': No such file or directory
427618:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
427619:du: cannot access './wezterm-gui': No such file or directory
427620:cp: cannot stat './wezterm-gui': No such file or directory
448981:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448982:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
448983:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448984:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
448985:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448986:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
448987:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448988:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
448989:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448990:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
448991:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448992:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
448993:cat: /tmp/baseutils_aarch64/wirelesstools/BLAKE3SUM.txt: No such file or directory
448994:cat: /tmp/baseutils_aarch64/wirelesstools/SHA256SUM.txt: No such file or directory
488784:cp: cannot stat './target/aarch64-unknown-linux-musl/release/xplr': No such file or directory
489909:cp: cannot stat './yggdrasil': No such file or directory
489910:cp: cannot stat './yggdrasilctl': No such file or directory
489913:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
489914:du: cannot access './yggdrasil': No such file or directory
489915:cp: cannot stat './yggdrasil': No such file or directory
489916:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
489917:du: cannot access './yggdrasilctl': No such file or directory
489918:cp: cannot stat './yggdrasilctl': No such file or directory
490785:static-1  | Error loading shared library ld-musl-aarch64-99c589a2.so.1: No such file or directory (needed by /root/.local/share/pipx/venvs/pyinstaller/lib/python3.11/site-packages/curl_cffi.libs/libcurl-impersonate-chrome-6202098e.so.4.8.0)
497107:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/xsn1rrfdr14vj079bl12z94vzfza94b7-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
497119:zsh-static-aarch64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/xsn1rrfdr14vj079bl12z94vzfza94b7-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

