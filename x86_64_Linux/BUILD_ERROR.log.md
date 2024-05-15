```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

20334-
20335- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
20336-
20337-remote: Support for password authentication was removed on August 13, 2021.
20338-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
20339:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
20340-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
20341-cp: cannot stat './certwatcher': No such file or directory
20342-


[-] asset * not found --> # Eget failed to find that --asset

36372-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/bins/garm.sh
36373-
36374-
36375- [+] (Building | Fetching) garm :: https://github.com/cloudbase/garm
36376-
36377:asset `arm` not found
36378:asset `arm` not found
--
40581-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/bins/gitui.sh
40582-
40583-
40584- [+] (Building | Fetching) gitui :: https://github.com/extrawurst/gitui
40585-
40586:asset `gitui-linux-musl.tar.gz` not found
--
141414-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/bins/tokei.sh
141415-
141416-
141417- [+] (Building | Fetching) tokei :: https://github.com/XAMPPRocky/tokei
141418-
141419:asset `x86_64-unknown-linux-musl.tar.gz` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install

24033:cpufetch-static-x86_64-unknown-linux-musl> /nix/store/h3bhzvz9ipglcybbcvkxvm4vg9lwvqg4-bash-5.2p26/bin/bash: line 1: git: command not found
25755:vim-static-x86_64-unknown-linux-musl> /nix/store/h3bhzvz9ipglcybbcvkxvm4vg9lwvqg4-bash-5.2p26/bin/bash: line 1: hostname: command not found
29242:ck-static-x86_64-unknown-linux-musl> Detecting git SHA................./configure: line 91: which: command not found
43758:./bootstrap: line 244: gettext: command not found
91105:pigz-static-x86_64-unknown-linux-musl> /nix/store/h3bhzvz9ipglcybbcvkxvm4vg9lwvqg4-bash-5.2p26/bin/bash: line 1: which: command not found
110009:keyutils-static-x86_64-unknown-linux-musl> /nix/store/h3bhzvz9ipglcybbcvkxvm4vg9lwvqg4-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
110104:keyutils-static-x86_64-unknown-linux-musl> /nix/store/h3bhzvz9ipglcybbcvkxvm4vg9lwvqg4-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
110202:libgpg-error-static-x86_64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
115324:stress-ng-static-x86_64-unknown-linux-musl> /nix/store/h3bhzvz9ipglcybbcvkxvm4vg9lwvqg4-bash-5.2p26/bin/bash: line 1: git: command not found
131560:WARNING: msgfmt command not found!
131561:WARNING: xgettext command not found!
131562:WARNING: msgmerge command not found!
149459:wget-static-x86_64-unknown-linux-musl> ./configure: line 65495: --version: command not found


[-] Dynamically Linked --> # Not Statically Linked

53:./binfetch:                        ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=517a1cdaf792842fa173cf8b8ba69e0e07204088, for GNU/Linux 3.2.0, stripped
393:./jc:                              ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=e41f28c9f3cc7052576866b78ab58d496e51b97c, stripped
399:./jless:                           ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=c88c164307a1b56c1a877753850101226b7b0bce, for GNU/Linux 3.2.0, stripped
417:./katana:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=a322cd19aa9d9c34987a52b2bea44a4718536586, for GNU/Linux 3.2.0, stripped
424:./ksubdomain:                      ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=0e2f34dc274cbf6532d10016a83203c480832d51, for GNU/Linux 3.2.0, stripped
491:./naabu:                           ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=ef14f57ce5153f1d7aaa8edc13e7188aee080daa, for GNU/Linux 3.2.0, stripped
545:./pathbuster:                      ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=d19278069f3c32a7b05819e3c64a1ffc30ad2336, for GNU/Linux 3.2.0, stripped
575:./promtail:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=3d94a6f12f77fd87b53bfdadac97047fbd766dce, for GNU/Linux 3.2.0, stripped
666:./rqbit:                           ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.16, stripped
824:./twingate-connector:              ELF 64-bit LSB pie executable, x86-64, version 1 (GNU/Linux), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=6dfe339f40223952ee5ace2158b12395e52954db, for GNU/Linux 3.2.0, stripped


[-] Incorrect Arch --> # Not for x86_64



[-] No such file or directory # Usually Because Build Failures

3521:/usr/bin/deb-systemd-helper: error: systemctl preset failed on inetutils-syslogd.service: No such file or directory
3538:/usr/bin/deb-systemd-helper: error: systemctl preset failed on inetutils-inetd.service: No such file or directory
11101:chmod: cannot access './target/x86_64-unknown-linux-musl/release/amp': No such file or directory
11102:cp: cannot stat './target/x86_64-unknown-linux-musl/release/amp': No such file or directory
11463:./apkeep: cannot open `./apkeep' (No such file or directory)
11464:du: cannot access './apkeep': No such file or directory
11465:cp: cannot stat './apkeep': No such file or directory
11479:./aptly: cannot open `./aptly' (No such file or directory)
11480:du: cannot access './aptly': No such file or directory
11481:cp: cannot stat './aptly': No such file or directory
13193:./axel: cannot open `./axel' (No such file or directory)
13194:du: cannot access './axel': No such file or directory
13195:cp: cannot stat './axel': No such file or directory
15922:cp: cannot stat './berty': No such file or directory
16320:./bingrep: cannot open `./bingrep' (No such file or directory)
16321:du: cannot access './bingrep': No such file or directory
16322:cp: cannot stat './bingrep': No such file or directory
20341:cp: cannot stat './certwatcher': No such file or directory
28919:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/dizi': No such file or directory
30195:./dnspyre: cannot open `./dnspyre' (No such file or directory)
30196:du: cannot access './dnspyre': No such file or directory
30197:cp: cannot stat './dnspyre': No such file or directory
32192:./encrypted-dns: cannot open `./encrypted-dns' (No such file or directory)
32193:du: cannot access './encrypted-dns': No such file or directory
32194:cp: cannot stat './encrypted-dns': No such file or directory
32768:./fastfetch: cannot open `./fastfetch' (No such file or directory)
32769:du: cannot access './fastfetch': No such file or directory
32770:./flashfetch: cannot open `./flashfetch' (No such file or directory)
32771:du: cannot access './flashfetch': No such file or directory
32772:cp: cannot stat './fastfetch': No such file or directory
32773:cp: cannot stat './flashfetch': No such file or directory
33818:./fi6s: cannot open `./fi6s' (No such file or directory)
33819:du: cannot access './fi6s': No such file or directory
33820:cp: cannot stat './fi6s': No such file or directory
35933:./fio: cannot open `./fio' (No such file or directory)
35934:du: cannot access './fio': No such file or directory
35935:cp: cannot stat './fio': No such file or directory
37667:./geodns: cannot open `./geodns' (No such file or directory)
37668:du: cannot access './geodns': No such file or directory
37669:cp: cannot stat './geodns': No such file or directory
37670:./geoping: cannot open `./geoping' (No such file or directory)
37671:du: cannot access './geoping': No such file or directory
37672:cp: cannot stat './geoping': No such file or directory
39019:./git-xet: cannot open `./git-xet' (No such file or directory)
39020:du: cannot access './git-xet': No such file or directory
39021:cp: cannot stat './git-xet': No such file or directory
39022:./xetmnt: cannot open `./xetmnt' (No such file or directory)
39023:du: cannot access './xetmnt': No such file or directory
39024:cp: cannot stat './xetmnt': No such file or directory
40611:./go-audit: cannot open `./go-audit' (No such file or directory)
40612:du: cannot access './go-audit': No such file or directory
40613:cp: cannot stat './go-audit': No such file or directory
41183:./goaccess: cannot open `./goaccess' (No such file or directory)
41184:du: cannot access './goaccess': No such file or directory
41185:cp: cannot stat './goaccess': No such file or directory
41391:./gocryptfs: cannot open `./gocryptfs' (No such file or directory)
41392:du: cannot access './gocryptfs': No such file or directory
41393:cp: cannot stat './gocryptfs': No such file or directory
41394:./gocryptfs-xray: cannot open `./gocryptfs-xray' (No such file or directory)
41395:du: cannot access './gocryptfs-xray': No such file or directory
41396:cp: cannot stat './gocryptfs-xray': No such file or directory
43360:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/gpg-tui': No such file or directory
43762:/tmp/R6AKr_build.sh: line 52: ./configure: No such file or directory
43765:./src/grep: cannot open `./src/grep' (No such file or directory)
43766:du: cannot access './src/grep': No such file or directory
43767:cp: cannot stat './src/grep': No such file or directory
43768:cp: cannot stat './src/grep': No such file or directory
52225:./hwatch: cannot open `./hwatch' (No such file or directory)
52226:du: cannot access './hwatch': No such file or directory
52227:cp: cannot stat './hwatch': No such file or directory
54747:FileNotFoundError: [Errno 2] No such file or directory
55247:./jobs: cannot open `./jobs' (No such file or directory)
55248:du: cannot access './jobs': No such file or directory
55249:cp: cannot stat './jobs': No such file or directory
56903:./src/kak.opt: cannot open `./src/kak.opt' (No such file or directory)
56904:du: cannot access './src/kak.opt': No such file or directory
56905:cp: cannot stat './src/kak.opt': No such file or directory
57047:FileNotFoundError: [Errno 2] No such file or directory
57847:open ./ksubdomain: no such file or directory
57886:FileNotFoundError: [Errno 2] No such file or directory: './ksubdomain'
65545:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/meli': No such file or directory
65651:./mirrorbits: cannot open `./mirrorbits' (No such file or directory)
65652:du: cannot access './mirrorbits': No such file or directory
65653:cp: cannot stat './mirrorbits': No such file or directory
65951:./monolith: cannot open `./monolith' (No such file or directory)
65952:du: cannot access './monolith': No such file or directory
65953:cp: cannot stat './monolith': No such file or directory
67329:FileNotFoundError: [Errno 2] No such file or directory
70144:readline-static-x86_64-unknown-linux-musl> /nix/store/ddypgcb25zgi0gwvklxlzazjrh9s63dg-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
70149:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/wl4yk874v8r17a5cqnxibxhi96x9nvna-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
70154:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/wl4yk874v8r17a5cqnxibxhi96x9nvna-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
73075:./noseyparker: cannot open `./noseyparker' (No such file or directory)
73076:du: cannot access './noseyparker': No such file or directory
73077:cp: cannot stat './noseyparker': No such file or directory
74360:cp: cannot stat './target/x86_64-unknown-linux-musl/release/openapi-tui': No such file or directory
88629:cp: cannot stat './target/x86_64-unknown-linux-musl/release/pathbuster': No such file or directory
91137:./pingmole: cannot open `./pingmole' (No such file or directory)
91138:du: cannot access './pingmole': No such file or directory
91139:cp: cannot stat './pingmole': No such file or directory
93673:cp: cannot stat '': No such file or directory
93720:FileNotFoundError: [Errno 2] No such file or directory: './dist/xet'
93760:cat: qemu.cid: No such file or directory
93762:cat: qemu.cid: No such file or directory
93764:rm: cannot remove './qemu.cid': No such file or directory
93767:./bin/*: cannot open `./bin/*' (No such file or directory)
93768:du: cannot access './bin/*': No such file or directory
93769:cp: cannot stat './bin/qemu-aarch64': No such file or directory
93770:cp: cannot stat './bin/qemu-aarch64_be': No such file or directory
93771:cp: cannot stat './bin/qemu-alpha': No such file or directory
93772:cp: cannot stat './bin/qemu-arm': No such file or directory
93773:cp: cannot stat './bin/qemu-armeb': No such file or directory
93774:cp: cannot stat './bin/qemu-cris': No such file or directory
93775:cp: cannot stat './bin/qemu-hexagon': No such file or directory
93776:cp: cannot stat './bin/qemu-hppa': No such file or directory
93777:cp: cannot stat './bin/qemu-i386': No such file or directory
93778:cp: cannot stat './bin/qemu-loongarch64': No such file or directory
93779:cp: cannot stat './bin/qemu-m68k': No such file or directory
93780:cp: cannot stat './bin/qemu-microblaze': No such file or directory
93781:cp: cannot stat './bin/qemu-microblazeel': No such file or directory
93782:cp: cannot stat './bin/qemu-mips': No such file or directory
93783:cp: cannot stat './bin/qemu-mips64': No such file or directory
93784:cp: cannot stat './bin/qemu-mips64el': No such file or directory
93785:cp: cannot stat './bin/qemu-mipsel': No such file or directory
93786:cp: cannot stat './bin/qemu-mipsn32': No such file or directory
93787:cp: cannot stat './bin/qemu-mipsn32el': No such file or directory
93788:cp: cannot stat './bin/qemu-nios2': No such file or directory
93789:cp: cannot stat './bin/qemu-or1k': No such file or directory
93790:cp: cannot stat './bin/qemu-ppc': No such file or directory
93791:cp: cannot stat './bin/qemu-ppc64': No such file or directory
93792:cp: cannot stat './bin/qemu-ppc64le': No such file or directory
93793:cp: cannot stat './bin/qemu-riscv32': No such file or directory
93794:cp: cannot stat './bin/qemu-riscv64': No such file or directory
93795:cp: cannot stat './bin/qemu-s390x': No such file or directory
93796:cp: cannot stat './bin/qemu-sh4': No such file or directory
93797:cp: cannot stat './bin/qemu-sh4eb': No such file or directory
93798:cp: cannot stat './bin/qemu-sparc': No such file or directory
93799:cp: cannot stat './bin/qemu-sparc32plus': No such file or directory
93800:cp: cannot stat './bin/qemu-sparc64': No such file or directory
93801:cp: cannot stat './bin/qemu-x86_64': No such file or directory
93802:cp: cannot stat './bin/qemu-xtensa': No such file or directory
93803:cp: cannot stat './bin/qemu-xtensaeb': No such file or directory
95957:cp: cannot stat './target/x86_64-unknown-linux-musl/release/golem': No such file or directory
95958:cp: cannot stat './target/x86_64-unknown-linux-musl/release/imix': No such file or directory
96218:  = note: /usr/bin/ld: cannot find -lsqlite3: No such file or directory
96271:cp: cannot stat './target/x86_64-unknown-linux-gnu/release/rebuilderd': No such file or directory
98931:cp: cannot stat './target/x86_64-unknown-linux-musl/release/rqbit': No such file or directory
100481:./samu: cannot open `./samu' (No such file or directory)
100482:du: cannot access './samu': No such file or directory
100483:cp: cannot stat './samu': No such file or directory
100484:cp: cannot stat './samu': No such file or directory
100716:cp: cannot stat './sbase': No such file or directory
100717:cp: cannot stat './sbase': No such file or directory
103694:./smenu: cannot open `./smenu' (No such file or directory)
103695:du: cannot access './smenu': No such file or directory
103696:cp: cannot stat './smenu': No such file or directory
104967:readline-static-x86_64-unknown-linux-musl> /nix/store/ddypgcb25zgi0gwvklxlzazjrh9s63dg-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
104972:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/wl4yk874v8r17a5cqnxibxhi96x9nvna-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
104977:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/wl4yk874v8r17a5cqnxibxhi96x9nvna-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
108066:libunwind-static-x86_64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
112821:libgpg-error-static-x86_64-unknown-linux-musl> gcrypt: No such file or directory
131340:cp: cannot stat './target/x86_64-unknown-linux-musl/release/syncat': No such file or directory
131689:/tmp/R6AKr_build.sh: line 45: ../tests/testsuite: No such file or directory
132974:cp: cannot stat './target/x86_64-unknown-linux-musl/release/taplo': No such file or directory
139629:readline-static-x86_64-unknown-linux-musl> /nix/store/ddypgcb25zgi0gwvklxlzazjrh9s63dg-coreutils-9.5/bin/install: cannot stat './rltest2.c': No such file or directory
139634:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/wl4yk874v8r17a5cqnxibxhi96x9nvna-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libreadline.a': No such file or directory
139639:readline-static-x86_64-unknown-linux-musl> mv: cannot stat '/nix/store/wl4yk874v8r17a5cqnxibxhi96x9nvna-readline-static-x86_64-unknown-linux-musl-8.2p10/lib/libhistory.a': No such file or directory
140759:libevent-static-x86_64-unknown-linux-musl> /usr/bin/env: 'python': No such file or directory
141447:./tracexec: cannot open `./tracexec' (No such file or directory)
141448:du: cannot access './tracexec': No such file or directory
141449:cp: cannot stat './tracexec': No such file or directory
142669:cp: cannot stat './ubase': No such file or directory
142670:cp: cannot stat './ubase': No such file or directory
148152:./generate-bidi: cannot open `./generate-bidi' (No such file or directory)
148153:du: cannot access './generate-bidi': No such file or directory
148154:cp: cannot stat './generate-bidi': No such file or directory
148155:./strip-ansi-escapes: cannot open `./strip-ansi-escapes' (No such file or directory)
148156:du: cannot access './strip-ansi-escapes': No such file or directory
148157:cp: cannot stat './strip-ansi-escapes': No such file or directory
148158:./sync-color-schemes: cannot open `./sync-color-schemes' (No such file or directory)
148159:du: cannot access './sync-color-schemes': No such file or directory
148160:cp: cannot stat './sync-color-schemes': No such file or directory
148161:./wezterm: cannot open `./wezterm' (No such file or directory)
148162:du: cannot access './wezterm': No such file or directory
148163:cp: cannot stat './wezterm': No such file or directory
148164:./wezterm-gui: cannot open `./wezterm-gui' (No such file or directory)
148165:du: cannot access './wezterm-gui': No such file or directory
148166:cp: cannot stat './wezterm-gui': No such file or directory
148167:./wezterm-mux-server: cannot open `./wezterm-mux-server' (No such file or directory)
148168:du: cannot access './wezterm-mux-server': No such file or directory
148169:cp: cannot stat './wezterm-mux-server': No such file or directory
151913:./wg: cannot open `./wg' (No such file or directory)
151914:du: cannot access './wg': No such file or directory
151915:cp: cannot stat './wg': No such file or directory
151916:cp: cannot stat './wg-quick': No such file or directory
153873:./yggdrasil: cannot open `./yggdrasil' (No such file or directory)
153874:du: cannot access './yggdrasil': No such file or directory
153875:cp: cannot stat './yggdrasil': No such file or directory
153876:./yggdrasilctl: cannot open `./yggdrasilctl' (No such file or directory)
153877:du: cannot access './yggdrasilctl': No such file or directory
153878:cp: cannot stat './yggdrasilctl': No such file or directory
156946:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/vr87qp2zwhwqhas8zbf80g27ialbr83m-texinfo-7.0.3/share/texinfo/Texinfo/Translations.pm line 82.
156960:zsh-static-x86_64-unknown-linux-musl> Can't exec "locale": No such file or directory at /nix/store/vr87qp2zwhwqhas8zbf80g27ialbr83m-texinfo-7.0.3/share/texinfo/Texinfo/Translations.pm line 82.
157024:sh: 0: getcwd() failed: No such file or directory
157025:sh: 0: getcwd() failed: No such file or directory
157026:sh: 0: getcwd() failed: No such file or directory
157027:sh: 0: getcwd() failed: No such file or directory
157028:sh: 0: getcwd() failed: No such file or directory
157029:sh: 0: getcwd() failed: No such file or directory
157030:sh: 0: getcwd() failed: No such file or directory
157031:sh: 0: getcwd() failed: No such file or directory
157032:sh: 0: getcwd() failed: No such file or directory
157033:sh: 0: getcwd() failed: No such file or directory
157034:sh: 0: getcwd() failed: No such file or directory
157035:sh: 0: getcwd() failed: No such file or directory
157036:sh: 0: getcwd() failed: No such file or directory
157037:sh: 0: getcwd() failed: No such file or directory
157038:sh: 0: getcwd() failed: No such file or directory
157039:sh: 0: getcwd() failed: No such file or directory
157040:sh: 0: getcwd() failed: No such file or directory
157041:sh: 0: getcwd() failed: No such file or directory
157042:sh: 0: getcwd() failed: No such file or directory
157043:sh: 0: getcwd() failed: No such file or directory
157044:sh: 0: getcwd() failed: No such file or directory
157045:sh: 0: getcwd() failed: No such file or directory
157046:sh: 0: getcwd() failed: No such file or directory
157047:sh: 0: getcwd() failed: No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

