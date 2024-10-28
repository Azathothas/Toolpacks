```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

29966-
29967- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-10-21 (09:30:54 PM) UTC]
29968-
29969-remote: Support for password authentication was removed on August 13, 2021.
29970-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
29971:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
29972-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
29973-cp: cannot stat './certwatcher': No such file or directory
29974-
--
141346-go: downloading github.com/gobwas/glob v0.2.3
141347-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
141348-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
141349-	remote: Support for password authentication was removed on August 13, 2021.
141350-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
141351:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
141352-cp: cannot stat './gfx': No such file or directory
141353-
141354-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):05(Sec)
--
402802-
402803- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-10-22 (08:30:55 AM) UTC]
402804-
402805-remote: Support for password authentication was removed on August 13, 2021.
402806-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
402807:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
402808-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
402809-sed: can't read ./Cargo.toml: No such file or directory
402810-error: failed to parse manifest at `/tmp/toolpacks/maYL8rF_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

102895-
102896-
102897-
102898- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-10-21 (11:21:40 PM) UTC]
102899-
102900:asset `x86_64-bin.tar.xz` not found
102901:asset `x86_64-bin.tar.xz` not found
--
114624-
114625-
114626-
114627- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Monday, 2024-10-21 (11:56:23 PM) UTC]
114628-
114629:asset `arm` not found
114630:asset `arm` not found
--
350016-
350017-
350018-
350019- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-10-22 (06:22:37 AM) UTC]
350020-
350021:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

  0     0    0     0    0     0      0      0 --:--:--  0:00:10 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:11 --:--:--     0curl: (6) Could not resolve host: objects.githubusercontent.com
  0     0    0     0    0     0      0      0 --:--:--  0:00:10 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:11 --:--:--     0curl: (6) Could not resolve host: objects.githubusercontent.com
  0     0    0     0    0     0      0      0 --:--:--  0:00:10 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:11 --:--:--     0curl: (6) Could not resolve host: github.com


[-] command not found --> # Something failed to Install

62900:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
64783:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
65281:vim-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: hostname: command not found
67360:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
68198:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.4/libtool: line 1888: ldconfig: command not found
90851:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
90956:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
91418:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
91647:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
92123:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
92340:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
95990:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
97637:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
98136:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
98138:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
106555:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
113818:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
115760:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
117935:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
122017:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
123509:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
125686:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
178317:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
178360:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
178646:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
179448:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
179609:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
180614:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.7/libtool: line 1886: ldconfig: command not found
181406:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.0.9/libtool: line 1719: ldconfig: command not found
181805:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
181856:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
181874:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
183805:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
183835:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
183881:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
191254:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
230020:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
230068:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
230086:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
230623:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
230624:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
230625:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
230748:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
230749:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
230750:masscan-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: git: command not found
236274:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
248381:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
253573:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
253623:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
253641:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
258118:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
258178:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
267250:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
267932:pigz-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: which: command not found
270202:procps-static-x86_64-unknown-linux-musl> /build/procps-3.3.17/libtool: line 1719: ldconfig: command not found
307959:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
308019:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
329192:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
331289:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
333709:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
337290:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
339820:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
344043:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
346592:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
360322:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.1/libtool: line 1890: ldconfig: command not found
361180:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
361543:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
363728:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
366155:keyutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
366224:keyutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: rpmspec: command not found
367455:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
369272:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
369463:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
370589:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
370870:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
371701:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
374144:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
374307:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
374438:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
374554:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
374581:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
374801:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
384650:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
384701:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
384719:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
389944:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
398202:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
400749:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.2.2/extension/libtool: line 1890: ldconfig: command not found
401238:vim-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

102:bed:                              ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=W54xB5ittyUb-PUwu_hA/f7IaId-zbTyq9ZEIRtmf/4WRL_Zqfp5RUUDnoYPzj/IC00C39jHPu-hlSanNn2, stripped
111:binfetch:                         ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
786:netexec_dynamic:                  ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=04804d3c31218f938502cbed5cdd1af09d59a8f0, for GNU/Linux 2.6.32, stripped
864:pathbuster:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
914:promtail:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=c17b73b028f1a6383b2f964fc395c08e940483b4, for GNU/Linux 3.2.0, stripped
1050:rqbit:                            ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
1369:woofwoof:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=30e06184968532b6a9aa36f44ada39e4af0bda56, for GNU/Linux 2.6.32, stripped


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
68:archey.preview.png:               PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
72:arduino-cli.preview.png:          PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
79:asn.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
83:assh.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
92:bandwhich.preview.png:            PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
93:base.default.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
97:batcat.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
105:berty.preview.png:                JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
108:bin.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
115:binocle.preview.png:              PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
131:broot.preview.png:                PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
134:btop.preview.png:                 PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
142:caddy.preview.png:                PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
154:certstream-server-go.preview.png: PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
155:certstream.preview-0.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
156:certstream.preview-1.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
157:certstream.preview-2.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
158:certstream.preview-3.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
159:certstream.preview-4.png:         PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
160:certstream.preview.png:           GIF image data, version 89a, 1920 x 1080
178:cherrybomb.preview.png:           PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
184:circumflex.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
197:cloudfox.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
201:cmd-wrapped.preview.png:          PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
204:cocogitto.preview.png:            PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
207:comb.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
208:comb.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
209:comb.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
210:comb.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
211:comb.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
212:comb.preview.png:                 GIF image data, version 89a, 1920 x 1080
228:croc.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
247:cut-cdn.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
249:cutlines.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
250:cutlines.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
251:cutlines.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
252:cutlines.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
253:cutlines.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
254:cutlines.preview.png:             GIF image data, version 89a, 1920 x 1080
259:czkawka.preview.png:              PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
262:dagu.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
263:daktilo.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
265:dalfox.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
272:dbeaver.preview.png:              PNG image data, 1000 x 500, 8-bit/color RGBA, non-interlaced
289:devpod.preview.png:               PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
300:dnstake.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
315:dotenv-linter.preview.png:        PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
325:duf.preview.png:                  PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
329:dvc.preview.png:                  PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
352:encrypted-dns-server.preview.png: PNG image data, 627 x 119, 8-bit colormap, non-interlaced
366:eza.preview.png:                  PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
378:feroxbuster.preview.png:          PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
385:fget.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
386:fget.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
387:fget.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
388:fget.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
389:fget.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
390:fget.preview.png:                 GIF image data, version 89a, 1920 x 1080
398:findomain.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
403:flawz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
405:fnm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
407:fq.preview.png:                   PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
409:freeze.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
416:fx.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
419:fzf.preview.png:                  PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
422:gdu.preview.png:                  PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
432:getJS.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
433:getJS.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
434:getJS.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
435:getJS.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
436:getJS.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
437:getJS.preview.png:                GIF image data, version 89a, 1920 x 1080
444:gh-dash.preview.png:              PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
445:gh.preview.png:                   PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
451:git-cliff.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
461:gitea.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
468:gitoxide.preview.png:             PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
471:gitpod-cli.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
474:gitui.preview.png:                PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
478:glow.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
485:goaccess.preview.png:             PNG image data, 725 x 411, 4-bit colormap, non-interlaced
506:gosmee.preview.png:               PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
507:gost:                             ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
513:gowitness.preview.png:            PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
516:gpg-tui.preview.png:              JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
520:grex.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
526:gsocket.preview.png:              PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
528:gum.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
532:hacker-scoper.preview.png:        PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
537:hakrawler.preview.png:            PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
540:halp.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
543:haylxon.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
557:hexyl.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
565:htb-cli.preview.png:              PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
572:huggingface-cli.preview.png:      PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
574:hugo.preview.png:                 PNG image data, 900 x 450, 8-bit colormap, non-interlaced
579:husarnet.preview.png:             PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
584:hyperfine.preview.png:            PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
587:hysp.preview.png:                 PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
593:imhex.preview.png:                PNG image data, 1528 x 948, 8-bit/color RGB, non-interlaced
598:inscope.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
599:inscope.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
600:inscope.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
601:inscope.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
602:inscope.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
603:inscope.preview.png:              GIF image data, version 89a, 1920 x 1080
607:intermodal.preview.png:           JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
622:istio.preview.png:                PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
631:jaeles.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
634:jc.preview.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
639:jless.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
652:jwt-hack.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
654:k9s.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
665:kitty.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
667:kmon.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
673:kubo.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
676:lazydocker.preview.png:           PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
683:libtree.preview.png:              PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
688:listmonk.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
701:lorien.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
710:macchina.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
713:magick.preview.png:               PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
720:mantra.preview.png:               PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
724:massdns.preview.png:              PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
730:mdcat.preview.png:                PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
735:meli.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
740:micro.preview.png:                PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
743:miller.preview.png:               PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
748:miniserve.preview.png:            PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
772:mubeng.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
785:netexec.preview.png:              PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
802:ngocok.preview.png:               JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
804:nicotine-plus.preview.png:        PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
816:noir.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
820:noseyparker.preview.png:          PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
837:ockam.preview.png:                PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
839:oha.preview.png:                  PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
853:osmedeus.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
857:ov.preview.png:                   PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
866:pdfcpu.preview.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
873:pfetch-rs.preview.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
875:pgrok.preview.png:                PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
891:pixi.preview.png:                 PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
893:pkg.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
897:planor.preview.png:               PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
899:pls.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
902:podsync.preview.png:              PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
905:ppfuzz.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
907:ppsspp.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
916:proot.preview.png:                PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
923:puredns.preview.png:              PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
929:qbittorrent-nox.preview.png:      JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
967:qsv.preview.png:                  PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
970:quotes-escaper.preview-0.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
971:quotes-escaper.preview-1.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
972:quotes-escaper.preview-2.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
973:quotes-escaper.preview-3.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
974:quotes-escaper.preview-4.png:     PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
975:quotes-escaper.preview.png:       GIF image data, version 89a, 1920 x 1080
978:rage.preview.png:                 PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
981:rate-limit-checker.preview-0.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
982:rate-limit-checker.preview-1.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
983:rate-limit-checker.preview-2.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
984:rate-limit-checker.preview-3.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
985:rate-limit-checker.preview-4.png: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
986:rate-limit-checker.preview.png:   GIF image data, version 89a, 1920 x 1080
989:rathole.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
991:rattler-build.preview.png:        PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
994:rclone.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
997:realm-tavern.preview.png:         PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
1003:redguard.preview.png:             PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
1014:rescope.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1016:resdns.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1017:resdns.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1018:resdns.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1019:resdns.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1020:resdns.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1021:resdns.preview.png:               GIF image data, version 89a, 1920 x 1080
1025:resto.preview.png:                PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
1027:reviewdog.preview.png:            PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
1030:revive.preview.png:               PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1038:rippkgs-index.sqlite:             SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2
1059:runst.preview.png:                JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1061:ruri.preview.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1067:rustscan.preview.png:             PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1084:scopegen.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1085:scopegen.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1086:scopegen.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1087:scopegen.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1088:scopegen.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1089:scopegen.preview.png:             GIF image data, version 89a, 1920 x 1080
1091:scopeview.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1092:scopeview.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1093:scopeview.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1094:scopeview.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1095:scopeview.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1096:scopeview.preview.png:            GIF image data, version 89a, 1920 x 1080
1114:shell2http.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1133:smap.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1136:smartdns.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1139:sn0int.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1144:soft-serve.preview.png:           JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1168:sshportal.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1171:sshx.preview.png:                 PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1177:starship.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1179:steampipe.preview.png:            PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1181:step.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1185:stree.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1195:subxtract.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1196:subxtract.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1197:subxtract.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1198:subxtract.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1199:subxtract.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1200:subxtract.preview.png:            GIF image data, version 89a, 1920 x 1080
1224:systeroid.preview.png:            JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1229:tailscale.preview.png:            PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1235:tailspin.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1245:termshark.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1250:tidy-viewer.preview.png:          PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1260:tok.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1261:tok.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1262:tok.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1263:tok.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1264:tok.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1265:tok.preview.png:                  GIF image data, version 89a, 1920 x 1080
1273:traefik.preview.png:              PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1277:trufflehog.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1288:tut.preview.png:                  PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1290:txeh.preview.png:                 PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1298:udpx.preview.png:                 PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1313:v2raya.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1320:vhs.preview.png:                  PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1322:viddy.preview.png:                PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1335:vopono.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1339:vtm.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1350:watchexec.preview.png:            PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1390:xplr.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1394:yabs.sh.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1398:yazi.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1400:yggdrasil.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1406:yt-dlp.preview.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1409:z-tokens.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1414:zellij.preview.png:               PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1425:zoxide.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1426:zoxide.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1427:zoxide.preview.png:               GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

5327:cp: cannot stat './aptly-bin': No such file or directory
5329:./aptly: cannot open `./aptly' (No such file or directory)
5330:du: cannot access './aptly': No such file or directory
5331:cp: cannot stat './aptly': No such file or directory
16328:binutils-static-x86_64-unknown-linux-musl> checking for ld used by GCC... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
16342:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
16355:binutils-static-x86_64-unknown-linux-musl> checking for CFLocaleCopyPreferredLanguages... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
16357:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
16368:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
17662:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
17996:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
18164:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
29973:cp: cannot stat './certwatcher': No such file or directory
34921:cp: cannot stat './cobalt': No such file or directory
34922:./cobalt: cannot open `./cobalt' (No such file or directory)
34923:du: cannot access './cobalt': No such file or directory
34924:cp: cannot stat './cobalt': No such file or directory
40943:cmp: .git/hooks/applypatch-msg: No such file or directory
40944:cmp: .git/hooks/commit-msg: No such file or directory
40945:cmp: .git/hooks/pre-applypatch: No such file or directory
40946:cmp: .git/hooks/pre-commit: No such file or directory
52861:cmp: .git/hooks/applypatch-msg: No such file or directory
52862:cmp: .git/hooks/commit-msg: No such file or directory
52863:cmp: .git/hooks/pre-applypatch: No such file or directory
52864:cmp: .git/hooks/pre-commit: No such file or directory
72451:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
72454:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
72457:dateutils-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: ./tzmap: No such file or directory
89190:cp: cannot stat './dblab': No such file or directory
89191:./dblab: cannot open `./dblab' (No such file or directory)
89192:du: cannot access './dblab': No such file or directory
89193:cp: cannot stat './dblab': No such file or directory
98620:cp: cannot stat './dnspyre': No such file or directory
98622:./dnspyre: cannot open `./dnspyre' (No such file or directory)
98623:du: cannot access './dnspyre': No such file or directory
98624:cp: cannot stat './dnspyre': No such file or directory
99031:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
102562:cp: cannot stat './eget': No such file or directory
102563:./eget: cannot open `./eget' (No such file or directory)
102564:du: cannot access './eget': No such file or directory
102565:cp: cannot stat './eget': No such file or directory
105671:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
106259:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
113522:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
116321:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/0nzvf8n4kqhbb8zkacrbpmavzkwzxmik-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
118743:binutils-static-x86_64-unknown-linux-musl> checking the maximum length of command line arguments... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
118753:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
118755:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
118770:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
118783:binutils-static-x86_64-unknown-linux-musl> checking target system type... checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
119319:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
119334:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
119341:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
121715:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
122934:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
123273:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
124976:gcc-static-x86_64-unknown-linux-musl> /nix/store/cikszmhsiabvz1scq8ligdlj5rbifqis-stdenv-linux/setup: line 258: /nix/store/l7n97992gd5piaw8phkxzsz176gfk1yj-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
124977:gcc-static-x86_64-unknown-linux-musl> /nix/store/cikszmhsiabvz1scq8ligdlj5rbifqis-stdenv-linux/setup: line 258: /nix/store/3zy36285azrdpv2yakiz8xsrcffc35vj-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
126498:gcc-static-x86_64-unknown-linux-musl> checking stdio.h presence... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
129273:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
129463:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
131647:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
131649:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
131731:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
131843:gcc-static-x86_64-unknown-linux-musl> checking sys/sysctl.h presence... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
132941:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
134119:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
134186:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
136067:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
136078:gdb-static-x86_64-unknown-linux-musl> checking for xlocale.h... /build/gdb-15.1/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
137385:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/bfd/configure: line 6938: /usr/bin/file: No such file or directory
138286:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
138892:gdb-static-x86_64-unknown-linux-musl> checking for strings.h... /build/gdb-15.1/gdb/configure: line 7248: /usr/bin/file: No such file or directory
139021:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
140267:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
140479:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
140480:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
140482:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
140484:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
140486:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
141352:cp: cannot stat './gfx': No such file or directory
155355:cp: cannot stat './gocryptfs': No such file or directory
155356:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
155359:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
155360:du: cannot access './gocryptfs': No such file or directory
155361:cp: cannot stat './gocryptfs': No such file or directory
155362:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
155363:du: cannot access './gocryptfs-xray': No such file or directory
155364:cp: cannot stat './gocryptfs-xray': No such file or directory
157551:cp: cannot stat './gost-bin': No such file or directory
158609:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
158868:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158903:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158938:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
158963:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
178719:cp: cannot stat './ipinfo-bin': No such file or directory
178720:./ipinfo: cannot open `./ipinfo' (No such file or directory)
178721:du: cannot access './ipinfo': No such file or directory
178722:cp: cannot stat './ipinfo': No such file or directory
178723:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
183947:iptables-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: /sbin/ldconfig: No such file or directory
186476:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
186478:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
186479:du: cannot access './ironrdp-client': No such file or directory
186480:cp: cannot stat './ironrdp-client': No such file or directory
190575:cp: cannot stat './katana': No such file or directory
190576:./katana: cannot open `./katana' (No such file or directory)
190577:du: cannot access './katana': No such file or directory
190578:cp: cannot stat './katana': No such file or directory
190977:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
190979:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
191493:cp: cannot stat './ksubdomain': No such file or directory
191494:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
191495:du: cannot access './ksubdomain': No such file or directory
191496:cp: cannot stat './ksubdomain': No such file or directory
193118:cp: cannot stat './libaws': No such file or directory
193120:./libaws: cannot open `./libaws' (No such file or directory)
193121:du: cannot access './libaws': No such file or directory
193122:cp: cannot stat './libaws': No such file or directory
193123:cp: cannot stat './libaws': No such file or directory
225809:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
232446:cp: cannot stat './mirrorbits': No such file or directory
232448:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
232449:du: cannot access './mirrorbits': No such file or directory
232450:cp: cannot stat './mirrorbits': No such file or directory
239163:cp: cannot stat './naabu-bin': No such file or directory
239164:./naabu: cannot open `./naabu' (No such file or directory)
239165:du: cannot access './naabu': No such file or directory
239166:cp: cannot stat './naabu': No such file or directory
239265:/tmp/dqJVM_build.sh: line 30: /download/ncdu-2.6-linux-x86_64.tar.gz: No such file or directory
244767:cp: cannot stat './nezha-dashboard': No such file or directory
244772:cp: cannot stat './nezha-agent': No such file or directory
244773:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
244774:du: cannot access './nezha-dashboard': No such file or directory
244775:cp: cannot stat './nezha-dashboard': No such file or directory
244776:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
244777:du: cannot access './nezha-agent': No such file or directory
244778:cp: cannot stat './nezha-agent': No such file or directory
246515:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
246516:du: cannot access './result/bin/ncat': No such file or directory
246518:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
246519:du: cannot access './result/bin/nmap': No such file or directory
246521:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
246522:du: cannot access './result/bin/nping': No such file or directory
246523:cp: cannot stat './result/bin/ncat': No such file or directory
246524:cp: cannot stat './result/bin/nmap': No such file or directory
246525:cp: cannot stat './result/bin/nping': No such file or directory
252083:find: ‘./bin’: No such file or directory
252084:find: ‘./bin’: No such file or directory
252085:find: ‘./bin’: No such file or directory
252087:rsync: [sender] change_dir "/tmp/toolpacks/yY6VJHY_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
252093:rsync: [sender] change_dir "/tmp/toolpacks/yY6VJHY_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
252099:rsync: [sender] change_dir "/tmp/toolpacks/yY6VJHY_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
252105:rsync: [sender] change_dir "/tmp/toolpacks/yY6VJHY_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
254337:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
254338:du: cannot access './result/bin/openvpn': No such file or directory
254339:cp: cannot stat './result/bin/openvpn': No such file or directory
256091:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
258439:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
258444:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
258449:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
265625:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
265626:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
265629:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
265630:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
265633:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
265634:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
268585:cp: cannot stat './pktstat': No such file or directory
268587:./pktstat: cannot open `./pktstat' (No such file or directory)
268588:du: cannot access './pktstat': No such file or directory
268589:cp: cannot stat './pktstat': No such file or directory
303888:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
303906:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
303970:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
304851:find: ‘’: No such file or directory
304856:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
304857:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
306014:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
306015:./pwait: cannot open `./pwait' (No such file or directory)
306016:du: cannot access './pwait': No such file or directory
306017:cp: cannot stat './pwait': No such file or directory
308268:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
308273:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
308278:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
314506:cp: cannot stat '': No such file or directory
314556:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
319780:cp: cannot stat './bin/qemu-nios2': No such file or directory
325019:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
325020:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
325350:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
325401:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
325402:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
326996:cp: cannot stat './rescope': No such file or directory
328531:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
349773:./samu: cannot open `./samu' (No such file or directory)
349774:du: cannot access './samu': No such file or directory
349775:cp: cannot stat './samu': No such file or directory
349776:cp: cannot stat './samu': No such file or directory
350009:cp: cannot stat './sbase': No such file or directory
350010:cp: cannot stat './sbase': No such file or directory
355765:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
355767:./smenu: cannot open `./smenu' (No such file or directory)
355768:du: cannot access './smenu': No such file or directory
355769:cp: cannot stat './smenu': No such file or directory
357469:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
357474:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
357479:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
358965:cp: cannot stat './spoof-dpi': No such file or directory
360884:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
363227:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
366127:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/0nzvf8n4kqhbb8zkacrbpmavzkwzxmik-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
366154:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
368134:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
369444:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
369446:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
369503:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
369603:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
369606:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
369953:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
370007:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
370067:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
370100:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc static flag -static works... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
370112:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... checking for dlfcn.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
372838:libpfm-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
373784:libpfm-static-x86_64-unknown-linux-musl> /nix/store/717iy55ncqs0wmhdkwc5fg2vci5wbmq8-bash-5.2p32/bin/bash: line 1: /bin/echo: No such file or directory
375387:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
375388:du: cannot access './result/bin/stress-ng': No such file or directory
375389:cp: cannot stat './result/bin/stress-ng': No such file or directory
379498:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
379507:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
380329:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
380330:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
380385:cp: cannot stat './tailscale': No such file or directory
380386:cp: cannot stat './tailscaled': No such file or directory
380387:cp: cannot stat './tailscale_bb': No such file or directory
380388:./tailscale: cannot open `./tailscale' (No such file or directory)
380389:du: cannot access './tailscale': No such file or directory
380390:cp: cannot stat './tailscale': No such file or directory
380391:./tailscaled: cannot open `./tailscaled' (No such file or directory)
380392:du: cannot access './tailscaled': No such file or directory
380393:cp: cannot stat './tailscaled': No such file or directory
380394:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
380395:du: cannot access './tailscale_bb': No such file or directory
380396:cp: cannot stat './tailscale_bb': No such file or directory
380397:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
380398:du: cannot access './tailscale_bb': No such file or directory
380399:cp: cannot stat './tailscale_bb': No such file or directory
388545:readline-static-x86_64-unknown-linux-musl> /nix/store/ph44jcx3ddmlwh394mh1wb7f1qigxqb1-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
388550:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
388555:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/a3jb8r78z6jir07ra7vmhfcrv45wp3d9-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
393044:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
393046:./tracexec: cannot open `./tracexec' (No such file or directory)
393047:du: cannot access './tracexec': No such file or directory
393048:cp: cannot stat './tracexec': No such file or directory
394510:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
394512:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
394513:du: cannot access './tun2proxy': No such file or directory
394514:cp: cannot stat './tun2proxy': No such file or directory
395497:cp: cannot stat './ubase': No such file or directory
395498:cp: cannot stat './ubase': No such file or directory
402809:sed: can't read ./Cargo.toml: No such file or directory
402814:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
406163:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
406173:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
406174:du: cannot access './wezterm-gui': No such file or directory
406175:cp: cannot stat './wezterm-gui': No such file or directory
504222:cp: cannot stat './yggdrasil': No such file or directory
504223:cp: cannot stat './yggdrasilctl': No such file or directory
504226:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
504227:du: cannot access './yggdrasil': No such file or directory
504228:cp: cannot stat './yggdrasil': No such file or directory
504229:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
504230:du: cannot access './yggdrasilctl': No such file or directory
504231:cp: cannot stat './yggdrasilctl': No such file or directory
504806:cp: cannot stat './yq': No such file or directory
504808:./yq: cannot open `./yq' (No such file or directory)
504809:du: cannot access './yq': No such file or directory
504810:cp: cannot stat './yq': No such file or directory
508054:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/w680c2zzx1kbvmwyjqdxs53nnhnrdnwx-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.
508066:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/w680c2zzx1kbvmwyjqdxs53nnhnrdnwx-texinfo-7.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

