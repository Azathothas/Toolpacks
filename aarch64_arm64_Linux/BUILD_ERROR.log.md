```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

51236-
51237- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
51238-
51239-remote: Support for password authentication was removed on August 13, 2021.
51240-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
51241:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
51242-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
51243-cp: cannot stat './certwatcher': No such file or directory
51244-


[-] asset * not found --> # Eget failed to find that --asset

143138-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
143139-
143140-
143141- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
143142-
143143:asset `tmux_aarch64_Linux` not found
--
154035-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
154036-
154037-
154038- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
154039-
154040:asset `arm64` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install

58552:vim-static-aarch64-unknown-linux-musl> 2786 translated messages/nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: hostname: command not found
114519:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
114610:keyutils-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
114696:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3817: hostname: command not found
119816:stress-ng-static-aarch64-unknown-linux-musl> /nix/store/k4rn5s600l1mvf9l10q13fw1r7r21yi7-bash-5.2p26/bin/bash: line 1: git: command not found
137964:WARNING: msgfmt command not found!
137965:WARNING: xgettext command not found!
137966:WARNING: msgmerge command not found!
149051:wget-static-aarch64-unknown-linux-musl> ./configure: line 65495: --version: command not found


[-] Dynamically Linked --> # Not Statically Linked

117:./cron:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
121:./crontab:                         ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
347:./katana:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=a0e90cbb1c9d0b9847ec2405697d598020d05182, for GNU/Linux 3.7.0, stripped
470:./promtail:                        ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=0fc2e03d74332b86c8d376be1bbf0806ac017e4b, for GNU/Linux 3.7.0, stripped
518:./rqbit:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped


[-] Incorrect Arch --> # Not for aarch64

85:./chameleon:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), static-pie linked, stripped
91:./cifsiostat:                      ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
189:./elinks:                          ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
190:./elinks-lite:                     ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
326:./iostat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
401:./mpstat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
452:./pidstat:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
535:./sadc:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
536:./sadf:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
538:./sar:                             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
617:./tapestat:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

3540:/usr/bin/deb-systemd-helper: error: systemctl preset failed on lm-sensors.service: No such file or directory
39444:cp: cannot stat './target//release/agrind': No such file or directory
46893:cp: cannot stat './berty': No such file or directory
49228:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
51243:cp: cannot stat './certwatcher': No such file or directory
62346:cp: cannot stat './dontgo403': No such file or directory
82216:rm: cannot remove './rust-toolchain.toml': No such file or directory
85449:./src/kak.opt: cannot open `./src/kak.opt' (No such file or directory)
85450:du: cannot access './src/kak.opt': No such file or directory
85451:cp: cannot stat './src/kak.opt': No such file or directory
85694:rm: cannot remove './rust-toolchain.toml': No such file or directory
103510:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
103511:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
106125:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
108446:aclocal-1.16: warning: couldn't open directory 'm4': No such file or directory
112568:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
114505:keyutils-static-aarch64-unknown-linux-musl> Error loading shared library ld-linux-aarch64.so.1: No such file or directory (needed by /usr/bin/make)
117067:libgpg-error-static-aarch64-unknown-linux-musl> gcrypt: No such file or directory
133987:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory
138093:/tmp/JLo09_build.sh: line 45: ../tests/testsuite: No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

