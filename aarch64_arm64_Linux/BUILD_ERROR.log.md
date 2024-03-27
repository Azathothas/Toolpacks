```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

51316-
51317- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
51318-
51319-remote: Support for password authentication was removed on August 13, 2021.
51320-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
51321:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
51322-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
51323-cp: cannot stat './certwatcher': No such file or directory
51324-


[-] asset * not found --> # Eget failed to find that --asset

147571-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
147572-
147573-
147574- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
147575-
147576:asset `tmux_aarch64_Linux` not found
--
158467-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
158468-
158469-
158470- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
158471-
158472:asset `arm64` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install

59205:vim-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: hostname: command not found
118946:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
119047:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
119132:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
124250:stress-ng-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: git: command not found
142399:WARNING: msgfmt command not found!
142400:WARNING: xgettext command not found!
142401:WARNING: msgmerge command not found!
153488:wget-static-aarch64-unknown-linux-musl> ./configure: line 65495: --version: command not found


[-] Dynamically Linked --> # Not Statically Linked

121:./cron:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
125:./crontab:                         ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
363:./katana:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=5dcf8d85a65a1c4aa3b6cd9efe8ed4d8a14b5eee, for GNU/Linux 3.7.0, stripped
496:./promtail:                        ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=0fc2e03d74332b86c8d376be1bbf0806ac017e4b, for GNU/Linux 3.7.0, stripped
546:./rqbit:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped


[-] Incorrect Arch --> # Not for aarch64

86:./chameleon:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), static-pie linked, stripped
92:./cifsiostat:                      ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
198:./elinks:                          ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
199:./elinks-lite:                     ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
339:./iostat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
420:./mpstat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
478:./pidstat:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
563:./sadc:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
564:./sadf:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
566:./sar:                             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
647:./tapestat:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

3541:/usr/bin/deb-systemd-helper: error: systemctl preset failed on lm-sensors.service: No such file or directory
39446:cp: cannot stat './target//release/agrind': No such file or directory
46896:cp: cannot stat './berty': No such file or directory
49308:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
51323:cp: cannot stat './certwatcher': No such file or directory
63109:cp: cannot stat './dontgo403': No such file or directory
83922:rm: cannot remove './rust-toolchain.toml': No such file or directory
88701:./src/kak.opt: cannot open `./src/kak.opt' (No such file or directory)
88702:du: cannot access './src/kak.opt': No such file or directory
88703:cp: cannot stat './src/kak.opt': No such file or directory
88947:rm: cannot remove './rust-toolchain.toml': No such file or directory
107804:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
107805:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
110418:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
116995:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
118933:keyutils-static-aarch64-unknown-linux-musl> Error loading shared library ld-linux-aarch64.so.1: No such file or directory (needed by /usr/bin/make)
121501:libgpg-error-static-aarch64-unknown-linux-musl> gcrypt: No such file or directory
138421:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory
142528:/tmp/TzOVV_build.sh: line 45: ../tests/testsuite: No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

