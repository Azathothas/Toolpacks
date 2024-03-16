```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

50359-
50360- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
50361-
50362-remote: Support for password authentication was removed on August 13, 2021.
50363-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
50364:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
50365-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
50366-cp: cannot stat './certwatcher': No such file or directory
50367-


[-] asset * not found --> # Eget failed to find that --asset

123543-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
123544-
123545-
123546- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
123547-
123548:asset `tmux_aarch64_Linux` not found
--
133861-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
133862-
133863-
133864- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
133865-
133866:asset `arm64` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install

57673:vim-static-aarch64-unknown-linux-musl> /nix/store/xz6h70zgmd6wf2931rdg5v4khnsxfg40-bash-5.2p26/bin/bash: line 1: hostname: command not found
118366:WARNING: msgfmt command not found!
118367:WARNING: xgettext command not found!
118368:WARNING: msgmerge command not found!
128886:wget-static-aarch64-unknown-linux-musl> ./configure: line 65495: --version: command not found


[-] Dynamically Linked --> # Not Statically Linked

117:./cron:                            ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
121:./crontab:                         ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, stripped
343:./katana:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=a0e90cbb1c9d0b9847ec2405697d598020d05182, for GNU/Linux 3.7.0, stripped
463:./promtail:                        ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=0fc2e03d74332b86c8d376be1bbf0806ac017e4b, for GNU/Linux 3.7.0, stripped
511:./rqbit:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped


[-] Incorrect Arch --> # Not for aarch64

85:./chameleon:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), static-pie linked, stripped
91:./cifsiostat:                      ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
189:./elinks:                          ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
190:./elinks-lite:                     ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
323:./iostat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
397:./mpstat:                          ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
446:./pidstat:                         ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
528:./sadc:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
529:./sadf:                            ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
531:./sar:                             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
609:./tapestat:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

3540:/usr/bin/deb-systemd-helper: error: systemctl preset failed on lm-sensors.service: No such file or directory
38670:cp: cannot stat './target//release/agrind': No such file or directory
45997:cp: cannot stat './berty': No such file or directory
48351:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
50366:cp: cannot stat './certwatcher': No such file or directory
61474:cp: cannot stat './dontgo403': No such file or directory
81055:rm: cannot remove './rust-toolchain.toml': No such file or directory
84261:./src/kak.opt: cannot open `./src/kak.opt' (No such file or directory)
84262:du: cannot access './src/kak.opt': No such file or directory
84263:cp: cannot stat './src/kak.opt': No such file or directory
84494:rm: cannot remove './rust-toolchain.toml': No such file or directory
101608:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
101609:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
104225:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
110554:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
114390:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory
118495:/tmp/GnkiO_build.sh: line 45: ../tests/testsuite: No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

