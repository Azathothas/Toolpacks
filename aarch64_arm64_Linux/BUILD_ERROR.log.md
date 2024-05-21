```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

51342-
51343- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
51344-
51345-remote: Support for password authentication was removed on August 13, 2021.
51346-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
51347:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
51348-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
51349-cp: cannot stat './certwatcher': No such file or directory
51350-


[-] asset * not found --> # Eget failed to find that --asset

147922-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
147923-
147924-
147925- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
147926-
147927:asset `tmux_aarch64_Linux` not found
--
158821-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
158822-
158823-
158824- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
158825-
158826:asset `arm64` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install

59224:vim-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: hostname: command not found
119255:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
119349:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
119435:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
124553:stress-ng-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: git: command not found
142750:WARNING: msgfmt command not found!
142751:WARNING: xgettext command not found!
142752:WARNING: msgmerge command not found!
153838:wget-static-aarch64-unknown-linux-musl> ./configure: line 65495: --version: command not found


[-] Dynamically Linked --> # Not Statically Linked

121:./cron:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
125:./crontab:                         ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
365:./katana:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=5dcf8d85a65a1c4aa3b6cd9efe8ed4d8a14b5eee, for GNU/Linux 3.7.0, stripped
499:./promtail:                        ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=9c4b67e439e5c304d7b06155330d9312158da6e7, for GNU/Linux 3.7.0, stripped
549:./rqbit:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped


[-] Incorrect Arch --> # Not for aarch64

86:./chameleon:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), static-pie linked, stripped
92:./cifsiostat:                      ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
198:./elinks:                          ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
199:./elinks-lite:                     ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
341:./iostat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
422:./mpstat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
481:./pidstat:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
566:./sadc:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
567:./sadf:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
569:./sar:                             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
652:./tapestat:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

3555:/usr/bin/deb-systemd-helper: error: systemctl preset failed on lm-sensors.service: No such file or directory
39471:cp: cannot stat './target//release/agrind': No such file or directory
46922:cp: cannot stat './berty': No such file or directory
49335:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
51349:cp: cannot stat './certwatcher': No such file or directory
83905:rm: cannot remove './rust-toolchain.toml': No such file or directory
88696:./src/kak.opt: cannot open `./src/kak.opt' (No such file or directory)
88697:du: cannot access './src/kak.opt': No such file or directory
88698:cp: cannot stat './src/kak.opt': No such file or directory
88942:rm: cannot remove './rust-toolchain.toml': No such file or directory
107955:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
107956:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
110568:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
117298:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
119241:keyutils-static-aarch64-unknown-linux-musl> Error loading shared library ld-linux-aarch64.so.1: No such file or directory (needed by /usr/bin/make)
121804:libgpg-error-static-aarch64-unknown-linux-musl> gcrypt: No such file or directory
138767:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory
142879:/tmp/V1FEY_build.sh: line 45: ../tests/testsuite: No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

