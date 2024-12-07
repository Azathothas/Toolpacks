```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

29325-
29326- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher [Monday, 2024-11-25 (09:40:36 PM) UTC]
29327-
29328-remote: Support for password authentication was removed on August 13, 2021.
29329-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
29330:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
29331-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
29332-cp: cannot stat './certwatcher': No such file or directory
29333-
--
152980-go: downloading github.com/sourcegraph/conc v0.2.0
152981-go: downloading github.com/sourcegraph/sourcegraph/lib v0.0.0-20221216004406-749998a2ac74
152982-/home/runner/go/pkg/mod/github.com/sourcegraph/conc@v0.2.0/pool/error_pool.go:7:2: github.com/sourcegraph/sourcegraph/lib@v0.0.0-20221216004406-749998a2ac74: invalid version: git ls-remote -q origin in /home/runner/go/pkg/mod/cache/vcs/1791346fb05b02940886169dc1f2712c426dfbfdfeec0151bbb9fde71fd48a95: exit status 128:
152983-	remote: Support for password authentication was removed on August 13, 2021.
152984-	remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
152985:	fatal: Authentication failed for 'https://github.com/sourcegraph/sourcegraph/'
152986-cp: cannot stat './gfx': No such file or directory
152987-
152988-[+] Completed (Building|Fetching) gfx [https://github.com/dwisiswant0/gfx] :: 00(Hr):00(Min):05(Sec)
--
410667-
410668- [+] (Building | Fetching) vproxy :: https://github.com/gngpp/vproxy [Tuesday, 2024-11-26 (08:59:53 AM) UTC]
410669-
410670-remote: Support for password authentication was removed on August 13, 2021.
410671-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
410672:fatal: Authentication failed for 'https://github.com/gngpp/vproxy/'
410673-info: component 'rust-std' for target 'x86_64-unknown-linux-musl' is up to date
410674-sed: can't read ./Cargo.toml: No such file or directory
410675-error: failed to parse manifest at `/tmp/toolpacks/9T1SgXe_linux_x86_64/Cargo.toml`


[-] asset * not found --> # Eget failed to find that --asset

107269-
107270-
107271-
107272- [+] (Building | Fetching) elinks :: https://github.com/rkd77/elinks [Monday, 2024-11-25 (11:39:54 PM) UTC]
107273-
107274:asset `x86_64-bin.tar.xz` not found
107275:asset `x86_64-bin.tar.xz` not found
--
123102-
123103-
123104-
123105- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm [Tuesday, 2024-11-26 (12:17:46 AM) UTC]
123106-
123107:asset `arm` not found
123108:asset `arm` not found
--
230180-
230181-
230182-
230183- [+] (Building | Fetching) mdcat :: https://github.com/swsnr/mdcat [Tuesday, 2024-11-26 (03:28:50 AM) UTC]
230184-
230185:asset `x86_64-unknown-linux-musl` not found
--
327424-
327425-
327426-
327427- [+] (Building | Fetching) ruri :: https://github.com/Moe-hacker/ruri [Tuesday, 2024-11-26 (06:33:17 AM) UTC]
327428-
327429:asset `ruri` not found
--
347515-
347516-
347517-
347518- [+] (Building | Fetching) sbctl :: https://github.com/Foxboron/sbctl [Tuesday, 2024-11-26 (06:49:35 AM) UTC]
347519-
347520:asset `linux` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL

[+] Completed (Building|Fetching) zstdmt [https://github.com/facebook/zstd] :: 00(Hr):00(Min):31(Sec)


[-] command not found --> # Something failed to Install

64272:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: git: command not found
69326:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
69834:vim-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: hostname: command not found
71897:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
72725:cryptsetup-static-x86_64-unknown-linux-musl> /build/cryptsetup-2.7.5/libtool: line 1888: ldconfig: command not found
94784:libXau-static-x86_64-unknown-linux-musl> /build/libXau-1.0.11/libtool: line 1890: ldconfig: command not found
94894:libXdmcp-static-x86_64-unknown-linux-musl> /build/libXdmcp-1.1.5/libtool: line 1890: ldconfig: command not found
95337:libICE-static-x86_64-unknown-linux-musl> /build/libICE-1.1.1/libtool: line 1887: ldconfig: command not found
95561:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
96045:libSM-static-x86_64-unknown-linux-musl> /build/libSM-1.2.4/libtool: line 1887: ldconfig: command not found
96264:libxcb-static-x86_64-unknown-linux-musl> /build/libxcb-1.17.0/libtool: line 1890: ldconfig: command not found
99892:dbus-static-x86_64-unknown-linux-musl> /build/dbus-1.14.10/libtool: line 1901: ldconfig: command not found
101982:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
102481:ldns-static-x86_64-unknown-linux-musl> /build/ldns-1.8.4/libtool: line 1874: ldconfig: command not found
102483:ldns-static-x86_64-unknown-linux-musl> ./libtool: line 1874: ldconfig: command not found
111581:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
122350:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
124263:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
126517:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
131617:mpfr-static-x86_64-unknown-linux-musl> /build/mpfr-4.2.1/libtool: line 1877: ldconfig: command not found
134336:libmpc-static-x86_64-unknown-linux-musl> /build/mpc-1.3.1/libtool: line 1890: ldconfig: command not found
137327:source-highlight-static-x86_64-unknown-linux-musl> /build/source-highlight-3.1.9/libtool: line 1734: ldconfig: command not found
192808:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
192851:lksctp-tools-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
193137:iperf-static-x86_64-unknown-linux-musl> /build/iperf-3.17.1/libtool: line 1887: ldconfig: command not found
193938:libmnl-static-x86_64-unknown-linux-musl> /build/libmnl-1.0.5/libtool: line 1719: ldconfig: command not found
194100:libnfnetlink-static-x86_64-unknown-linux-musl> /build/libnfnetlink-1.0.2/libtool: line 1719: ldconfig: command not found
195177:libnftnl-static-x86_64-unknown-linux-musl> /build/libnftnl-1.2.8/libtool: line 1886: ldconfig: command not found
195418:libnetfilter_conntrack-static-x86_64-unknown-linux-musl> /build/libnetfilter_conntrack-1.1.0/libtool: line 1886: ldconfig: command not found
196233:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
196286:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
196304:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
198237:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
198268:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
198315:iptables-static-x86_64-unknown-linux-musl> /build/iptables-1.8.10/libtool: line 1887: ldconfig: command not found
205696:kmod-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
228364:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228414:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228432:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
228969:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
228970:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
228971:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: git: command not found
229094:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
229095:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
229096:masscan-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: git: command not found
237682:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
252183:numactl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
260559:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
260609:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
260627:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
265099:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
265157:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
277314:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
277992:pigz-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: which: command not found
280379:procps-static-x86_64-unknown-linux-musl> /build/procps-ng-4.0.4/libtool: line 1887: ldconfig: command not found
305369:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
305430:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
326664:popt-static-x86_64-unknown-linux-musl> /build/popt-1.19/libtool: line 1720: ldconfig: command not found
328743:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
331170:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
334758:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
337295:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
341525:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
344081:file-static-x86_64-unknown-linux-musl> /build/file-5.45/libtool: line 1723: ldconfig: command not found
360952:squashfs-tools-ng-static-x86_64-unknown-linux-musl> /build/squashfs-tools-ng-1.3.2/libtool: line 1890: ldconfig: command not found
361801:fuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
362175:squashfuse-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1887: ldconfig: command not found
365384:libunwind-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
367814:keyutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
367886:keyutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: rpmspec: command not found
369107:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
370750:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
370908:gdbm-static-x86_64-unknown-linux-musl> /build/gdbm-1.24/libtool: line 1720: ldconfig: command not found
372087:isl-static-x86_64-unknown-linux-musl> /build/isl-0.20/libtool: line 1734: ldconfig: command not found
372567:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/missing: line 52: automake-1.11: command not found
373334:libapparmor-static-x86_64-unknown-linux-musl> /build/source/libraries/libapparmor/libtool: line 1887: ldconfig: command not found
375510:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
375866:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
375941:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
376041:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
376107:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
376249:libomxil-bellagio-static-x86_64-unknown-linux-musl> /build/libomxil-bellagio-0.9.3/libtool: line 958: ldconfig: command not found
385973:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
386024:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
386043:libnl-static-x86_64-unknown-linux-musl> /build/source/libtool: line 1901: ldconfig: command not found
394423:libevent-static-x86_64-unknown-linux-musl> /build/libevent-2.1.12-stable/libtool: line 1844: ldconfig: command not found
402894:util-linux-static-x86_64-unknown-linux-musl> /build/util-linux-2.39.4/libtool: line 1901: ldconfig: command not found
408595:gawk-static-x86_64-unknown-linux-musl> /build/gawk-5.3.1/extension/libtool: line 1890: ldconfig: command not found
409094:vim-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: hostname: command not found


[-] Dynamically Linked --> # Not Statically Linked

115:bed:                               ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=ZvrO9t6lXppTO_qt5ijM/BJX0gvF_VuQG8wqDpIBC/X4XRGR_J-ZrbL9bLF_O3/UAKnTebEwUdrLjpw3I7d, stripped
124:binfetch:                          ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
805:netexec_dynamic:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=8485f6953c06d12b9865185ba3466fdbf9b4a65c, for GNU/Linux 2.6.32, stripped
883:pathbuster:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
933:promtail:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=e4f40943216c9829e415503f868ecec92b296b1c, for GNU/Linux 3.2.0, stripped
1072:rqbit:                             ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
1394:woofwoof:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=30e06184968532b6a9aa36f44ada39e4af0bda56, for GNU/Linux 2.6.32, stripped


[-] Incorrect Arch --> # Not for x86_64

3:METADATA.AIO.db:                   SQLite 3.x database, last written using SQLite version 3046000, file counter 6, database pages 1232, cookie 0x3, schema 4, UTF-8, version-valid-for 6
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
41:age.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
45:aggligator.preview.png:            PNG image data, 467 x 482, 8-bit/color RGBA, non-interlaced
50:albafetch.preview.png:             PNG image data, 685 x 396, 8-bit/color RGBA, non-interlaced
52:algernon.preview.png:              JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=6, xresolution=86, yresolution=94, resolutionunit=2, software=GIMP 2.10.14, datetime=2020:01:31 17:23:12], progressive, precision 8, 1280x640, components 3
61:amass.preview.png:                 PNG image data, 3000 x 1000, 8-bit/color RGB, non-interlaced
81:archey.preview.png:                PNG image data, 2000 x 1686, 8-bit/color RGBA, non-interlaced
85:arduino-cli.preview.png:           PNG image data, 3598 x 2411, 8-bit/color RGBA, non-interlaced
92:asn.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
96:assh.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
105:bandwhich.preview.png:             PNG image data, 654 x 321, 8-bit/color RGB, non-interlaced
106:base.default.png:                  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
110:batcat.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
118:berty.preview.png:                 JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
121:bin.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
128:binocle.preview.png:               PNG image data, 1279 x 631, 8-bit/color RGBA, non-interlaced
130:bita.preview.png:                  PNG image data, 512 x 184, 8-bit/color RGBA, non-interlaced
146:broot.preview.png:                 PNG image data, 767 x 757, 8-bit/color RGBA, non-interlaced
149:btop.preview.png:                  PNG image data, 1045 x 658, 8-bit/color RGB, non-interlaced
157:caddy.preview.png:                 PNG image data, 2000 x 1195, 8-bit/color RGB, non-interlaced
169:certstream-server-go.preview.png:  PNG image data, 896 x 338, 8-bit/color RGBA, non-interlaced
170:certstream.preview-0.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
171:certstream.preview-1.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
172:certstream.preview-2.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
173:certstream.preview-3.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
174:certstream.preview-4.png:          PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
175:certstream.preview.png:            GIF image data, version 89a, 1920 x 1080
193:cherrybomb.preview.png:            PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
199:circumflex.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
212:cloudfox.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1200x628, components 3
216:cmd-wrapped.preview.png:           PNG image data, 1651 x 824, 8-bit/color RGBA, non-interlaced
219:cocogitto.preview.png:             PNG image data, 640 x 640, 8-bit/color RGBA, non-interlaced
222:comb.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
223:comb.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
224:comb.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
225:comb.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
226:comb.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
227:comb.preview.png:                  GIF image data, version 89a, 1920 x 1080
243:croc.preview.png:                  JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], progressive, precision 8, 408x196, components 3
262:cut-cdn.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
264:cutlines.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
265:cutlines.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
266:cutlines.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
267:cutlines.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
268:cutlines.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
269:cutlines.preview.png:              GIF image data, version 89a, 1920 x 1080
274:czkawka.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
278:dagu.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
279:daktilo.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
281:dalfox.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=1], baseline, precision 8, 1280x640, components 3
288:dbeaver.preview.png:               PNG image data, 1000 x 500, 8-bit/color RGBA, non-interlaced
305:devpod.preview.png:                PNG image data, 1280 x 640, 8-bit colormap, non-interlaced
317:dnstake.preview.png:               JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
332:dotenv-linter.preview.png:         PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
342:duf.preview.png:                   PNG image data, 1122 x 726, 8-bit/color RGBA, non-interlaced
346:dvc.preview.png:                   PNG image data, 2189 x 1093, 8-bit/color RGBA, non-interlaced
369:encrypted-dns-server.preview.png:  PNG image data, 627 x 119, 8-bit colormap, non-interlaced
384:eza.preview.png:                   PNG image data, 1181 x 640, 8-bit/color RGB, non-interlaced
396:feroxbuster.preview.png:           PNG image data, 1000 x 1000, 8-bit/color RGBA, non-interlaced
403:fget.preview-0.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
404:fget.preview-1.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
405:fget.preview-2.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
406:fget.preview-3.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
407:fget.preview-4.png:                PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
408:fget.preview.png:                  GIF image data, version 89a, 1920 x 1080
416:findomain.preview.png:             JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 756x756, components 3
421:flawz.preview.png:                 JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=7, orientation=upper-left, xresolution=98, yresolution=106, resolutionunit=2, software=GIMP 2.10.36, datetime=2024:05:18 15:10:59], progressive, precision 8, 1280x640, components 3
423:fnm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
425:fq.preview.png:                    PNG image data, 1400 x 700, 8-bit/color RGBA, non-interlaced
427:freeze.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
434:fx.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
437:fzf.preview.png:                   PNG image data, 1200 x 680, 8-bit/color RGB, non-interlaced
440:gdu.preview.png:                   PNG image data, 800 x 500, 8-bit/color RGBA, non-interlaced
450:getJS.preview-0.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
451:getJS.preview-1.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
452:getJS.preview-2.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
453:getJS.preview-3.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
454:getJS.preview-4.png:               PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
455:getJS.preview.png:                 GIF image data, version 89a, 1920 x 1080
462:gh-dash.preview.png:               PNG image data, 1282 x 640, 8-bit/color RGBA, non-interlaced
463:gh.preview.png:                    PNG image data, 1200 x 630, 8-bit/color RGBA, non-interlaced
470:git-cliff.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
480:gitea.preview.png:                 JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, progressive, precision 8, 1500x500, components 3
487:gitoxide.preview.png:              PNG image data, 1384 x 656, 8-bit/color RGBA, non-interlaced
490:gitpod-cli.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 0x0, segment length 16, baseline, precision 8, 2400x1350, components 3
493:gitui.preview.png:                 PNG image data, 1000 x 600, 8-bit gray+alpha, non-interlaced
497:glow.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
504:goaccess.preview.png:              PNG image data, 725 x 411, 4-bit colormap, non-interlaced
525:gosmee.preview.png:                PNG image data, 1792 x 1024, 8-bit colormap, non-interlaced
526:gost:                              ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=OVmBQl7Gp37Wjg7ZI_qx/g0eYkNTCnwuM5xLli1Kk/Eg-FeyzgT1hpmZFPausQ/FigF6hru-9SsYb6NVoAG, stripped
532:gowitness.preview.png:             PNG image data, 710 x 172, 8-bit/color RGBA, non-interlaced
535:gpg-tui.preview.png:               JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
539:grex.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:13 17:00:02], baseline, precision 8, 1280x640, components 3
545:gsocket.preview.png:               PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
547:gum.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
551:hacker-scoper.preview.png:         PNG image data, 1000 x 482, 8-bit/color RGB, non-interlaced
556:hakrawler.preview.png:             PNG image data, 620 x 286, 8-bit/color RGBA, non-interlaced
559:halp.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
562:haylxon.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
576:hexyl.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
584:htb-cli.preview.png:               PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
591:huggingface-cli.preview.png:       PNG image data, 1260 x 640, 8-bit/color RGBA, non-interlaced
593:hugo.preview.png:                  PNG image data, 900 x 450, 8-bit colormap, non-interlaced
598:husarnet.preview.png:              PNG image data, 4782 x 2958, 8-bit/color RGBA, non-interlaced
603:hyperfine.preview.png:             PNG image data, 640 x 320, 8-bit/color RGB, non-interlaced
606:hysp.preview.png:                  PNG image data, 1366 x 768, 8-bit/color RGB, non-interlaced
612:imhex.preview.png:                 PNG image data, 1528 x 948, 8-bit/color RGB, non-interlaced
617:inscope.preview-0.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
618:inscope.preview-1.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
619:inscope.preview-2.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
620:inscope.preview-3.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
621:inscope.preview-4.png:             PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
622:inscope.preview.png:               GIF image data, version 89a, 1920 x 1080
626:intermodal.preview.png:            JPEG image data, JFIF standard 1.01, aspect ratio, density 216x216, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=6, orientation=upper-left, xresolution=86, yresolution=94, resolutionunit=2, software=Pixelmator Pro 1.5.4], baseline, precision 8, 1668x834, components 3
641:istio.preview.png:                 PNG image data, 3360 x 1676, 8-bit/color RGBA, non-interlaced
650:jaeles.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
653:jc.preview.png:                    PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
658:jless.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
671:jwt-hack.preview.png:              JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
673:k9s.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
684:kitty.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
686:kmon.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
692:kubo.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=5, xresolution=74, yresolution=82, resolutionunit=2, datetime=2023:10:03 18:40:39], baseline, precision 8, 1280x640, components 3
695:lazydocker.preview.png:            PNG image data, 726 x 413, 8-bit/color RGBA, non-interlaced
702:libtree.preview.png:               PNG image data, 737 x 511, 8-bit/color RGBA, non-interlaced
707:listmonk.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
720:lorien.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
729:macchina.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
732:magick.preview.png:                PNG image data, 1280 x 640, 16-bit/color RGB, non-interlaced
739:mantra.preview.png:                PNG image data, 1840 x 818, 8-bit/color RGBA, non-interlaced
743:massdns.preview.png:               PNG image data, 735 x 373, 8-bit/color RGBA, non-interlaced
749:mdcat.preview.png:                 PNG image data, 1560 x 566, 8-bit/color RGB, non-interlaced
754:meli.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
759:micro.preview.png:                 PNG image data, 1280 x 437, 8-bit/color RGBA, non-interlaced
762:miller.preview.png:                PNG image data, 190 x 190, 8-bit/color RGBA, non-interlaced
767:miniserve.preview.png:             PNG image data, 850 x 570, 8-bit/color RGBA, non-interlaced
791:mubeng.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
804:netexec.preview.png:               PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
821:ngocok.preview.png:                JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 2134x1066, components 3
823:nicotine-plus.preview.png:         PNG image data, 1280 x 640, 16-bit/color RGBA, non-interlaced
835:noir.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 1280x640, components 3
839:noseyparker.preview.png:           PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
856:ockam.preview.png:                 PNG image data, 2400 x 1260, 8-bit/color RGBA, non-interlaced
858:oha.preview.png:                   PNG image data, 1364 x 684, 8-bit/color RGBA, non-interlaced
872:osmedeus.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
876:ov.preview.png:                    PNG image data, 1200 x 516, 8-bit/color RGB, non-interlaced
885:pdfcpu.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
892:pfetch-rs.preview.png:             PNG image data, 804 x 350, 8-bit/color RGBA, non-interlaced
894:pgrok.preview.png:                 PNG image data, 1500 x 500, 8-bit/color RGBA, non-interlaced
910:pixi.preview.png:                  PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
912:pkg.default.png:                   PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
916:planor.preview.png:                PNG image data, 1137 x 870, 8-bit/color RGBA, non-interlaced
918:pls.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
921:podsync.preview.png:               PNG image data, 640 x 568, 8-bit/color RGB, non-interlaced
924:ppfuzz.preview.png:                JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
926:ppsspp.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
935:proot.preview.png:                 PNG image data, 200 x 200, 8-bit/color RGBA, non-interlaced
942:puredns.preview.png:               PNG image data, 1080 x 540, 8-bit/color RGBA, non-interlaced
948:qbittorrent-nox.preview.png:       JPEG image data, JFIF standard 1.02, resolution (DPI), density 96x96, segment length 16, comment: "LEADTOOLS v20.0", baseline, precision 8, 1198x687, components 3
986:qsv.preview.png:                   PNG image data, 1280 x 800, 8-bit/color RGBA, non-interlaced
989:quotes-escaper.preview-0.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
990:quotes-escaper.preview-1.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
991:quotes-escaper.preview-2.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
992:quotes-escaper.preview-3.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
993:quotes-escaper.preview-4.png:      PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
994:quotes-escaper.preview.png:        GIF image data, version 89a, 1920 x 1080
997:rage.preview.png:                  PNG image data, 1246 x 592, 8-bit/color RGBA, non-interlaced
1000:rate-limit-checker.preview-0.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1001:rate-limit-checker.preview-1.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1002:rate-limit-checker.preview-2.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1003:rate-limit-checker.preview-3.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1004:rate-limit-checker.preview-4.png:  PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1005:rate-limit-checker.preview.png:    GIF image data, version 89a, 1920 x 1080
1008:rathole.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1010:rattler-build.preview.png:         PNG image data, 2560 x 1280, 8-bit/color RGB, non-interlaced
1013:rclone.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1016:realm-tavern.preview.png:          PNG image data, 3456 x 1834, 8-bit/color RGBA, non-interlaced
1022:redguard.preview.png:              PNG image data, 640 x 365, 8-bit/color RGB, non-interlaced
1036:rescope.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1038:resdns.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1039:resdns.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1040:resdns.preview-2.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1041:resdns.preview-3.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1042:resdns.preview-4.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1043:resdns.preview.png:                GIF image data, version 89a, 1920 x 1080
1047:resto.preview.png:                 PNG image data, 1280 x 644, 8-bit/color RGBA, non-interlaced
1049:reviewdog.preview.png:             PNG image data, 927 x 461, 8-bit/color RGBA, non-interlaced
1052:revive.preview.png:                PNG image data, 1138 x 478, 8-bit/color RGBA, non-interlaced
1060:rippkgs-index.sqlite:              SQLite 3.x database, last written using SQLite version 3046000, file counter 2, database pages 3910, cookie 0x1, schema 4, UTF-8, version-valid-for 2
1081:runst.preview.png:                 JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1083:ruri.preview.png:                  PNG image data, 1600 x 800, 8-bit/color RGBA, non-interlaced
1089:rustscan.preview.png:              PNG image data, 1000 x 959, 8-bit/color RGBA, non-interlaced
1107:scopegen.preview-0.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1108:scopegen.preview-1.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1109:scopegen.preview-2.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1110:scopegen.preview-3.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1111:scopegen.preview-4.png:            PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1112:scopegen.preview.png:              GIF image data, version 89a, 1920 x 1080
1114:scopeview.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1115:scopeview.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1116:scopeview.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1117:scopeview.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1118:scopeview.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1119:scopeview.preview.png:             GIF image data, version 89a, 1920 x 1080
1137:shell2http.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1157:smap.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1160:smartdns.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1163:sn0int.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1168:soft-serve.preview.png:            JPEG image data, JFIF standard 1.02, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 1280x640, components 3
1193:sshportal.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1196:sshx.preview.png:                  PNG image data, 2660 x 1638, 8-bit/color RGBA, non-interlaced
1202:starship.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1204:steampipe.preview.png:             PNG image data, 1800 x 900, 8-bit/color RGB, non-interlaced
1206:step.preview.png:                  PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1210:stree.preview.png:                 PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1220:subxtract.preview-0.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1221:subxtract.preview-1.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1222:subxtract.preview-2.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1223:subxtract.preview-3.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1224:subxtract.preview-4.png:           PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1225:subxtract.preview.png:             GIF image data, version 89a, 1920 x 1080
1249:systeroid.preview.png:             JPEG image data, Exif standard: [TIFF image data, little-endian, direntries=0], baseline, precision 8, 1280x640, components 3
1254:tailscale.preview.png:             PNG image data, 2560 x 1280, 8-bit/color RGBA, non-interlaced
1260:tailspin.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGB, non-interlaced
1270:termshark.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1275:tidy-viewer.preview.png:           PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1285:tok.preview-0.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1286:tok.preview-1.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1287:tok.preview-2.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1288:tok.preview-3.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1289:tok.preview-4.png:                 PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1290:tok.preview.png:                   GIF image data, version 89a, 1920 x 1080
1298:traefik.preview.png:               PNG image data, 3840 x 1281, 8-bit/color RGBA, non-interlaced
1302:trufflehog.preview.png:            PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1313:tut.preview.png:                   PNG image data, 941 x 453, 8-bit/color RGBA, non-interlaced
1315:txeh.preview.png:                  PNG image data, 900 x 348, 8-bit/color RGBA, non-interlaced
1323:udpx.preview.png:                  PNG image data, 1280 x 720, 8-bit/color RGB, non-interlaced
1338:v2raya.preview.png:                PNG image data, 640 x 320, 8-bit/color RGBA, non-interlaced
1345:vhs.preview.png:                   PNG image data, 1280 x 650, 8-bit/color RGBA, non-interlaced
1347:viddy.preview.png:                 PNG image data, 1467 x 1464, 8-bit/color RGBA, non-interlaced
1360:vopono.preview.png:                PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1364:vtm.preview.png:                   PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1375:watchexec.preview.png:             PNG image data, 1024 x 1024, 8-bit/color RGBA, non-interlaced
1416:xplr.preview.png:                  JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1], baseline, precision 8, 1200x630, components 3
1420:yabs.sh.preview.png:               PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1424:yazi.preview.png:                  JPEG image data, JFIF standard 1.01, aspect ratio, density 144x144, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, xresolution=62, yresolution=70, resolutionunit=2], baseline, precision 8, 2620x1420, components 3
1426:yggdrasil.preview.png:             PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1432:yt-dlp.preview.png:                PNG image data, 500 x 500, 8-bit/color RGBA, non-interlaced
1435:z-tokens.preview.png:              PNG image data, 1280 x 640, 8-bit/color RGBA, non-interlaced
1440:zellij.preview.png:                PNG image data, 1065 x 534, 8-bit/color RGBA, non-interlaced
1451:zoxide.preview-0.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1452:zoxide.preview-1.png:              PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced
1453:zoxide.preview.png:                GIF image data, version 89a, 2002 x 1002


[-] No such file or directory # Usually Because Build Failures

5593:cp: cannot stat './aptly-bin': No such file or directory
5595:./aptly: cannot open `./aptly' (No such file or directory)
5596:du: cannot access './aptly': No such file or directory
5597:cp: cannot stat './aptly': No such file or directory
13695:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
13703:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
13706:binutils-static-x86_64-unknown-linux-musl> checking how to recognize dependent libraries... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
13722:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
13734:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... checking for sys/file.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
15024:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
15358:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
15557:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
29332:cp: cannot stat './certwatcher': No such file or directory
35962:cp: cannot stat './cobalt': No such file or directory
35963:./cobalt: cannot open `./cobalt' (No such file or directory)
35964:du: cannot access './cobalt': No such file or directory
35965:cp: cannot stat './cobalt': No such file or directory
42040:cmp: .git/hooks/applypatch-msg: No such file or directory
42041:cmp: .git/hooks/commit-msg: No such file or directory
42042:cmp: .git/hooks/pre-applypatch: No such file or directory
42043:cmp: .git/hooks/pre-commit: No such file or directory
54209:cmp: .git/hooks/applypatch-msg: No such file or directory
54210:cmp: .git/hooks/commit-msg: No such file or directory
54211:cmp: .git/hooks/pre-applypatch: No such file or directory
54212:cmp: .git/hooks/pre-commit: No such file or directory
77077:dateutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
77080:dateutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
77083:dateutils-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: ./tzmap: No such file or directory
93114:cp: cannot stat './dblab': No such file or directory
93115:./dblab: cannot open `./dblab' (No such file or directory)
93116:du: cannot access './dblab': No such file or directory
93117:cp: cannot stat './dblab': No such file or directory
102965:cp: cannot stat './dnspyre': No such file or directory
102967:./dnspyre: cannot open `./dnspyre' (No such file or directory)
102968:du: cannot access './dnspyre': No such file or directory
102969:cp: cannot stat './dnspyre': No such file or directory
103379:doas-static-x86_64-unknown-linux-musl> cp: cannot create regular file '/etc/pam.d/doas': No such file or directory
106938:cp: cannot stat './eget': No such file or directory
106939:./eget: cannot open `./eget' (No such file or directory)
106940:du: cannot access './eget': No such file or directory
106941:cp: cannot stat './eget': No such file or directory
110718:exfatprogs-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
111292:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
121858:rsync: [sender] change_dir "/tmp/toolpacks/bnLDeSK_linux_x86_64/./result/bin" failed: No such file or directory (2)
122055:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
122447:rsync: [sender] change_dir "/tmp/toolpacks/vTUwbNE_linux_x86_64/./result/bin" failed: No such file or directory (2)
124833:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/2qllbipkqkvgr5i1s7bl1azxixcyk80a-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
127330:binutils-static-x86_64-unknown-linux-musl> checking the name lister (/nix/store/n386c06iy63cgf36vxd1if9r9qlcc8ij-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm) interface... checking for CFPreferencesCopyAppValue... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
127354:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/n386c06iy63cgf36vxd1if9r9qlcc8ij-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
127355:binutils-static-x86_64-unknown-linux-musl> checking for dlfcn.h... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
127358:binutils-static-x86_64-unknown-linux-musl> checking for GNU gettext in libc... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
127380:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... checking for limits.h... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
130946:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/bfd/configure: line 6936: /usr/bin/file: No such file or directory
133358:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/opcodes/configure: line 6870: /usr/bin/file: No such file or directory
133749:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libctf/configure: line 9376: /usr/bin/file: No such file or directory
135549:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
135555:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
135560:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
136651:gcc-static-x86_64-unknown-linux-musl> /nix/store/mpfl88dxjw7864kkiyy2vp8310fdl2jl-stdenv-linux/setup: line 261: /nix/store/9bacph866qhmr2zfib1h49jixq5hhd01-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
136652:gcc-static-x86_64-unknown-linux-musl> /nix/store/mpfl88dxjw7864kkiyy2vp8310fdl2jl-stdenv-linux/setup: line 261: /nix/store/0axcnz5g1b5rgynjwgshlh8npda18f2r-x86_64-unknown-linux-musl-binutils-wrapper-2.43.1/nix-support/libc-ldflags-before: No such file or directory
138133:gcc-static-x86_64-unknown-linux-musl> checking fcntl.h usability... checking stdio.h usability... /build/gcc-13.3.0/libbacktrace/configure: line 7291: /usr/bin/file: No such file or directory
140918:gcc-static-x86_64-unknown-linux-musl> ../../../gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
141108:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/gcc/configure: line 15622: /usr/bin/file: No such file or directory
143278:gcc-static-x86_64-unknown-linux-musl> checking for grep that handles long lines and -e... /build/gcc-13.3.0/libatomic/configure: line 6889: /usr/bin/file: No such file or directory
143282:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libgomp/configure: line 6902: /usr/bin/file: No such file or directory
143365:gcc-static-x86_64-unknown-linux-musl> checking fcntl.h usability... checking if x86_64-unknown-linux-musl-gcc -O2 -I/nix/store/xc6i8vx53v90qb9jai6rnacizhs5lg38-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -B/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ -idirafter /nix/store/xc6i8vx53v90qb9jai6rnacizhs5lg38-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -idirafter /nix/store/80y7mzkpjb14m9ybc2ilijpm01pjdp3w-x86_64-unknown-linux-musl-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-musl/13.3.0/include-fixed -isystem /nix/store/3vd96xjszd1i7crhhyiary61dqlfxnx8-fortify-headers-1.1alpine3/include -Wl,-rpath,/nix/store/nyxay788ca24ak9q5pl0d1pr319w3194-gcc-static-x86_64-unknown-linux-musl-13.3.0-lib/lib -Wl,-L/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-rpath -Wl,/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-dynamic-linker=/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ld-musl-x86_64.so.1 --sysroot=/   supports -fno-rtti -fno-exceptions... checking if x86_64-unknown-linux-musl-gcc -O2 -I/nix/store/xc6i8vx53v90qb9jai6rnacizhs5lg38-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -B/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ -idirafter /nix/store/xc6i8vx53v90qb9jai6rnacizhs5lg38-musl-static-x86_64-unknown-linux-musl-1.2.5-dev/include -idirafter /nix/store/80y7mzkpjb14m9ybc2ilijpm01pjdp3w-x86_64-unknown-linux-musl-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-musl/13.3.0/include-fixed -isystem /nix/store/3vd96xjszd1i7crhhyiary61dqlfxnx8-fortify-headers-1.1alpine3/include -Wl,-rpath,/nix/store/nyxay788ca24ak9q5pl0d1pr319w3194-gcc-static-x86_64-unknown-linux-musl-13.3.0-lib/lib -Wl,-L/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-rpath -Wl,/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib -Wl,-dynamic-linker=/nix/store/mbmygy9kcsjwsfyzzzjl1yc49zj8k5l8-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/ld-musl-x86_64.so.1 --sysroot=/   supports -fno-rtti -fno-exceptions... /build/gcc-13.3.0/libquadmath/configure: line 6547: /usr/bin/file: No such file or directory
143475:gcc-static-x86_64-unknown-linux-musl> checking sys/sysctl.h usability... /build/gcc-13.3.0/libssp/configure: line 6733: /usr/bin/file: No such file or directory
144575:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libstdc++-v3/configure: line 7778: /usr/bin/file: No such file or directory
145753:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libitm/configure: line 7564: /usr/bin/file: No such file or directory
145820:gcc-static-x86_64-unknown-linux-musl> /build/gcc-13.3.0/libvtv/configure: line 8029: /usr/bin/file: No such file or directory
147701:gdb-static-x86_64-unknown-linux-musl> checking for an ANSI C-conforming const... /build/gdb-15.2/libbacktrace/configure: line 7329: /usr/bin/file: No such file or directory
147712:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/libsframe/configure: line 7297: /usr/bin/file: No such file or directory
148959:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/bfd/configure: line 6938: /usr/bin/file: No such file or directory
149902:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/opcodes/configure: line 6872: /usr/bin/file: No such file or directory
150572:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/gdb/configure: line 7248: /usr/bin/file: No such file or directory
150618:gdb-static-x86_64-unknown-linux-musl> /build/gdb-15.2/libctf/configure: line 9376: /usr/bin/file: No such file or directory
151900:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
152112:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
152113:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
152114:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
152116:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
152118:gdb-static-x86_64-unknown-linux-musl> sed: can't read version.subst: No such file or directory
152986:cp: cannot stat './gfx': No such file or directory
167173:cp: cannot stat './gocryptfs': No such file or directory
167174:cp: cannot stat './gocryptfs-xray-bin': No such file or directory
167177:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
167178:du: cannot access './gocryptfs': No such file or directory
167179:cp: cannot stat './gocryptfs': No such file or directory
167180:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
167181:du: cannot access './gocryptfs-xray': No such file or directory
167182:cp: cannot stat './gocryptfs-xray': No such file or directory
169397:cp: cannot stat './gost-bin': No such file or directory
170456:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
170715:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
170750:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
170786:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
170810:src/pcre2_jit_compile.c:85:10: fatal error: ../deps/sljit/sljit_src/sljitLir.c: No such file or directory
193210:cp: cannot stat './ipinfo-bin': No such file or directory
193211:./ipinfo: cannot open `./ipinfo' (No such file or directory)
193212:du: cannot access './ipinfo': No such file or directory
193213:cp: cannot stat './ipinfo': No such file or directory
193214:cp: cannot stat '/tmp/toolpack_x86_64/ipinfo': No such file or directory
198379:iptables-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: /sbin/ldconfig: No such file or directory
200910:cp: cannot stat './target/x86_64-unknown-linux-musl/release/ironrdp-client': No such file or directory
200912:./ironrdp-client: cannot open `./ironrdp-client' (No such file or directory)
200913:du: cannot access './ironrdp-client': No such file or directory
200914:cp: cannot stat './ironrdp-client': No such file or directory
205014:cp: cannot stat './katana': No such file or directory
205015:./katana: cannot open `./katana' (No such file or directory)
205016:du: cannot access './katana': No such file or directory
205017:cp: cannot stat './katana': No such file or directory
205419:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /usr/lib/: No such file or directory
205421:kmod-static-x86_64-unknown-linux-musl> ./autogen.sh: cd: line 13: can't cd to /lib/: No such file or directory
205917:cp: cannot stat './ksubdomain': No such file or directory
205918:./ksubdomain: cannot open `./ksubdomain' (No such file or directory)
205919:du: cannot access './ksubdomain': No such file or directory
205920:cp: cannot stat './ksubdomain': No such file or directory
207595:cp: cannot stat './libaws': No such file or directory
207597:./libaws: cannot open `./libaws' (No such file or directory)
207598:du: cannot access './libaws': No such file or directory
207599:cp: cannot stat './libaws': No such file or directory
207600:cp: cannot stat './libaws': No such file or directory
222478:lsof-static-x86_64-unknown-linux-musl> find: 'dialects/linux': No such file or directory
226437:chmod: cannot access './magick_appbundle.no_strip': No such file or directory
226439:rsync: [sender] link_stat "/tmp/toolpacks/sgnQ5sQ_linux_x86_64/magick_appbundle.no_strip" failed: No such file or directory (2)
230754:cp: cannot stat './mirrorbits': No such file or directory
230756:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
230757:du: cannot access './mirrorbits': No such file or directory
230758:cp: cannot stat './mirrorbits': No such file or directory
238439:rsync: [sender] change_dir "/tmp/toolpacks/IgTAfJI_linux_x86_64/./result/bin" failed: No such file or directory (2)
238445:rsync: [sender] change_dir "/tmp/toolpacks/IgTAfJI_linux_x86_64/./result/libexec/mtd-utils" failed: No such file or directory (2)
242742:cp: cannot stat './naabu-bin': No such file or directory
242743:./naabu: cannot open `./naabu' (No such file or directory)
242744:du: cannot access './naabu': No such file or directory
242745:cp: cannot stat './naabu': No such file or directory
242847:/tmp/Me94o_build.sh: line 30: /download/ncdu-2.7-linux-x86_64.tar.gz: No such file or directory
248334:cp: cannot stat './nezha-dashboard': No such file or directory
248339:cp: cannot stat './nezha-agent': No such file or directory
248340:./nezha-dashboard: cannot open `./nezha-dashboard' (No such file or directory)
248341:du: cannot access './nezha-dashboard': No such file or directory
248342:cp: cannot stat './nezha-dashboard': No such file or directory
248343:./nezha-agent: cannot open `./nezha-agent' (No such file or directory)
248344:du: cannot access './nezha-agent': No such file or directory
248345:cp: cannot stat './nezha-agent': No such file or directory
248705:/tmp/toolpack_x86_64/ngrok: cannot open `/tmp/toolpack_x86_64/ngrok' (No such file or directory)
248706:du: cannot access '/tmp/toolpack_x86_64/ngrok': No such file or directory
250105:./result/bin/ncat: cannot open `./result/bin/ncat' (No such file or directory)
250106:du: cannot access './result/bin/ncat': No such file or directory
250108:./result/bin/nmap: cannot open `./result/bin/nmap' (No such file or directory)
250109:du: cannot access './result/bin/nmap': No such file or directory
250111:./result/bin/nping: cannot open `./result/bin/nping' (No such file or directory)
250112:du: cannot access './result/bin/nping': No such file or directory
250113:cp: cannot stat './result/bin/ncat': No such file or directory
250114:cp: cannot stat './result/bin/nmap': No such file or directory
250115:cp: cannot stat './result/bin/nping': No such file or directory
250483:rsync: [sender] link_stat "/tmp/tmp.lTT4MqvGlP/a-utils/cmd/noroot-do/noroot-do" failed: No such file or directory (2)
250489:/build-bins/*: cannot open `/build-bins/*' (No such file or directory)
250490:du: cannot access '/build-bins/*': No such file or directory
259125:find: ‘./bin’: No such file or directory
259126:find: ‘./bin’: No such file or directory
259127:find: ‘./bin’: No such file or directory
259129:rsync: [sender] change_dir "/tmp/toolpacks/flFJLfN_linux_x86_64/static-cross-openssh/./bin" failed: No such file or directory (2)
259135:rsync: [sender] change_dir "/tmp/toolpacks/flFJLfN_linux_x86_64/static-cross-openssh/./etc" failed: No such file or directory (2)
259141:rsync: [sender] change_dir "/tmp/toolpacks/flFJLfN_linux_x86_64/static-cross-openssh/./libexec" failed: No such file or directory (2)
259147:rsync: [sender] change_dir "/tmp/toolpacks/flFJLfN_linux_x86_64/static-cross-openssh/./sbin" failed: No such file or directory (2)
261320:./result/bin/openvpn: cannot open `./result/bin/openvpn' (No such file or directory)
261321:du: cannot access './result/bin/openvpn': No such file or directory
261322:cp: cannot stat './result/bin/openvpn': No such file or directory
263071:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
268550:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
268555:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
268560:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
275685:/tmp/toolpack_x86_64/php: cannot open `/tmp/toolpack_x86_64/php' (No such file or directory)
275686:du: cannot access '/tmp/toolpack_x86_64/php': No such file or directory
275689:/tmp/toolpack_x86_64/php-fpm: cannot open `/tmp/toolpack_x86_64/php-fpm' (No such file or directory)
275690:du: cannot access '/tmp/toolpack_x86_64/php-fpm': No such file or directory
275693:/tmp/toolpack_x86_64/php-micro: cannot open `/tmp/toolpack_x86_64/php-micro' (No such file or directory)
275694:du: cannot access '/tmp/toolpack_x86_64/php-micro': No such file or directory
278645:cp: cannot stat './pktstat': No such file or directory
278647:./pktstat: cannot open `./pktstat' (No such file or directory)
278648:du: cannot access './pktstat': No such file or directory
278649:cp: cannot stat './pktstat': No such file or directory
298179:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
298183:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
298247:/usr/lib/gcc/x86_64-alpine-linux-musl/13.2.1/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -ltalloc: No such file or directory
299126:find: ‘’: No such file or directory
299131:/tmp/toolpack_x86_64/proxychain*: cannot open `/tmp/toolpack_x86_64/proxychain*' (No such file or directory)
299132:du: cannot access '/tmp/toolpack_x86_64/proxychain*': No such file or directory
303431:cp: cannot stat './STATIC_BUILD/src/pwait': No such file or directory
303432:./pwait: cannot open `./pwait' (No such file or directory)
303433:du: cannot access './pwait': No such file or directory
303434:cp: cannot stat './pwait': No such file or directory
305693:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
305698:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
305703:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
311899:cp: cannot stat '': No such file or directory
311949:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
317104:cp: cannot stat './bin/qemu-cris': No such file or directory
317105:cp: cannot stat './bin/qemu-nios2': No such file or directory
322407:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
322408:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
322779:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
322826:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuildctl': No such file or directory
322827:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
324435:cp: cannot stat './rescope': No such file or directory
326008:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
327432:find: ‘/tmp/toolpack_x86_64/ruri’: No such file or directory
347272:./samu: cannot open `./samu' (No such file or directory)
347273:du: cannot access './samu': No such file or directory
347274:cp: cannot stat './samu': No such file or directory
347275:cp: cannot stat './samu': No such file or directory
347508:cp: cannot stat './sbase': No such file or directory
347509:cp: cannot stat './sbase': No such file or directory
353215:cp: cannot stat './STATIC_BUILD/smenu': No such file or directory
353217:./smenu: cannot open `./smenu' (No such file or directory)
353218:du: cannot access './smenu': No such file or directory
353219:cp: cannot stat './smenu': No such file or directory
358100:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
358105:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
358110:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
359599:cp: cannot stat './spoof-dpi': No such file or directory
361512:fuse-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
364883:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
367783:isl-static-x86_64-unknown-linux-musl> ./configure: line 3487: cd: /nix/store/2qllbipkqkvgr5i1s7bl1azxixcyk80a-isl-static-x86_64-unknown-linux-musl-0.20: No such file or directory
367813:keyutils-static-x86_64-unknown-linux-musl> ldd: cannot load /usr/bin/make: No such file or directory
369865:libomxil-bellagio-static-x86_64-unknown-linux-musl> ./configure: line 6726: /usr/bin/file: No such file or directory
371345:binutils-static-x86_64-unknown-linux-musl> checking the maximum length of command line arguments... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
371382:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/n386c06iy63cgf36vxd1if9r9qlcc8ij-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
371387:binutils-static-x86_64-unknown-linux-musl> checking for catalogs to be installed... checking for dlfcn.h... checking for sys/file.h... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
371398:binutils-static-x86_64-unknown-linux-musl> /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
371448:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc supports -fno-rtti -fno-exceptions... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
371539:binutils-static-x86_64-unknown-linux-musl> checking the name lister (/nix/store/n386c06iy63cgf36vxd1if9r9qlcc8ij-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm) interface... /build/binutils-2.43.1/gas/configure: line 6525: /usr/bin/file: No such file or directory
371684:binutils-static-x86_64-unknown-linux-musl> checking the maximum length of command line arguments... /build/binutils-2.43.1/libsframe/configure: line 7343: /usr/bin/file: No such file or directory
371689:binutils-static-x86_64-unknown-linux-musl> checking whether the shell understands "+="... /build/binutils-2.43.1/gprof/configure: line 6403: /usr/bin/file: No such file or directory
371727:binutils-static-x86_64-unknown-linux-musl> checking command to parse /nix/store/n386c06iy63cgf36vxd1if9r9qlcc8ij-x86_64-unknown-linux-musl-gcc-wrapper-13.3.0/bin/x86_64-unknown-linux-musl-nm output from x86_64-unknown-linux-musl-gcc object... /build/binutils-2.43.1/binutils/configure: line 6831: /usr/bin/file: No such file or directory
371812:binutils-static-x86_64-unknown-linux-musl> checking if x86_64-unknown-linux-musl-gcc PIC flag -fPIC -DPIC works... /build/binutils-2.43.1/ld/configure: line 7432: /usr/bin/file: No such file or directory
374339:libpfm-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
375277:libpfm-static-x86_64-unknown-linux-musl> /nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash: line 1: /bin/echo: No such file or directory
376956:./result/bin/stress-ng: cannot open `./result/bin/stress-ng' (No such file or directory)
376957:du: cannot access './result/bin/stress-ng': No such file or directory
376958:cp: cannot stat './result/bin/stress-ng': No such file or directory
381055:find: ‘/usr/src/linux-headers-6.9.7-amd64’: No such file or directory
381064:ERROR: failed to solve: failed to read dockerfile: open Dockerfile.ubuntu-noble: no such file or directory
381886:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
381887:cp: cannot stat './target/x86_64-unknown-linux-musl/release/system_info_collector': No such file or directory
381939:cp: cannot stat './tailscale': No such file or directory
381940:cp: cannot stat './tailscaled': No such file or directory
381941:cp: cannot stat './tailscale_bb': No such file or directory
381942:./tailscale: cannot open `./tailscale' (No such file or directory)
381943:du: cannot access './tailscale': No such file or directory
381944:cp: cannot stat './tailscale': No such file or directory
381945:./tailscaled: cannot open `./tailscaled' (No such file or directory)
381946:du: cannot access './tailscaled': No such file or directory
381947:cp: cannot stat './tailscaled': No such file or directory
381948:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
381949:du: cannot access './tailscale_bb': No such file or directory
381950:cp: cannot stat './tailscale_bb': No such file or directory
381951:./tailscale_bb: cannot open `./tailscale_bb' (No such file or directory)
381952:du: cannot access './tailscale_bb': No such file or directory
381953:cp: cannot stat './tailscale_bb': No such file or directory
393019:readline-static-x86_64-unknown-linux-musl> /nix/store/k48bha2fjqzarg52picsdfwlqx75aqbb-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
393024:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libreadline.a': No such file or directory
393029:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/5kw1yybffzlx2ik3w1kzbx08c666mv4q-readline-static-x86_64-unknown-linux-musl-8.2p13/lib/libhistory.a': No such file or directory
397595:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tracexec': No such file or directory
397597:./tracexec: cannot open `./tracexec' (No such file or directory)
397598:du: cannot access './tracexec': No such file or directory
397599:cp: cannot stat './tracexec': No such file or directory
399119:cp: cannot stat './target/x86_64-unknown-linux-musl/release/tun2proxy': No such file or directory
399121:./tun2proxy: cannot open `./tun2proxy' (No such file or directory)
399122:du: cannot access './tun2proxy': No such file or directory
399123:cp: cannot stat './tun2proxy': No such file or directory
400112:cp: cannot stat './ubase': No such file or directory
400113:cp: cannot stat './ubase': No such file or directory
410674:sed: can't read ./Cargo.toml: No such file or directory
410679:cp: cannot stat './target/x86_64-unknown-linux-musl/release/vproxy': No such file or directory
414009:cp: cannot stat './target/x86_64-unknown-linux-musl/release/wezterm-gui': No such file or directory
414019:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
414020:du: cannot access './wezterm-gui': No such file or directory
414021:cp: cannot stat './wezterm-gui': No such file or directory
476134:cp: cannot stat './yggdrasil': No such file or directory
476135:cp: cannot stat './yggdrasilctl': No such file or directory
476138:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
476139:du: cannot access './yggdrasil': No such file or directory
476140:cp: cannot stat './yggdrasil': No such file or directory
476141:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
476142:du: cannot access './yggdrasilctl': No such file or directory
476143:cp: cannot stat './yggdrasilctl': No such file or directory
476715:cp: cannot stat './yq': No such file or directory
476717:./yq: cannot open `./yq' (No such file or directory)
476718:du: cannot access './yq': No such file or directory
476719:cp: cannot stat './yq': No such file or directory
483088:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/8mmriia5njgp50pxncfc8qc6ncdxgmlj-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.
483100:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/8mmriia5njgp50pxncfc8qc6ncdxgmlj-texinfo-7.1.1/share/texinfo/Texinfo/Translations.pm line 86.


[-] Empty (0 Sized) Bins # Usually Because Symlinks

