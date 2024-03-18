```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

50358-
50359- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
50360-
50361-remote: Support for password authentication was removed on August 13, 2021.
50362-remote: Please see https://docs.github.com/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
50363:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
50364-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
50365-cp: cannot stat './certwatcher': No such file or directory
50366-


[-] asset * not found --> # Eget failed to find that --asset

68917-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/fx.sh
68918-
68919-
68920- [+] (Building | Fetching) fx :: https://github.com/antonmedv/fx
68921-
68922:asset `linux` not found
--
141262-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
141263-
141264-
141265- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
141266-
141267:asset `tmux_aarch64_Linux` not found
--
152154-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
152155-
152156-
152157- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
152158-
152159:asset `arm64` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install

57677:vim-static-aarch64-unknown-linux-musl> /nix/store/xz6h70zgmd6wf2931rdg5v4khnsxfg40-bash-5.2p26/bin/bash: line 1: hostname: command not found
112693:keyutils-static-aarch64-unknown-linux-musl> /nix/store/xz6h70zgmd6wf2931rdg5v4khnsxfg40-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
112784:keyutils-static-aarch64-unknown-linux-musl> /nix/store/xz6h70zgmd6wf2931rdg5v4khnsxfg40-bash-5.2p26/bin/bash: line 1: rpmspec: command not found
112880:libgpg-error-static-aarch64-unknown-linux-musl> ./configure: line 3393: hostname: command not found
117944:stress-ng-static-aarch64-unknown-linux-musl> /nix/store/xz6h70zgmd6wf2931rdg5v4khnsxfg40-bash-5.2p26/bin/bash: line 1: git: command not found
136094:WARNING: msgfmt command not found!
136095:WARNING: xgettext command not found!
136096:WARNING: msgmerge command not found!
147179:wget-static-aarch64-unknown-linux-musl> ./configure: line 65495: --version: command not found


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
610:./tapestat:                        ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped


[-] No such file or directory # Usually Because Build Failures

3540:/usr/bin/deb-systemd-helper: error: systemctl preset failed on lm-sensors.service: No such file or directory
38669:cp: cannot stat './target//release/agrind': No such file or directory
45996:cp: cannot stat './berty': No such file or directory
48350:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
50365:cp: cannot stat './certwatcher': No such file or directory
61470:cp: cannot stat './dontgo403': No such file or directory
81066:rm: cannot remove './rust-toolchain.toml': No such file or directory
84269:./src/kak.opt: cannot open `./src/kak.opt' (No such file or directory)
84270:du: cannot access './src/kak.opt': No such file or directory
84271:cp: cannot stat './src/kak.opt': No such file or directory
84502:rm: cannot remove './rust-toolchain.toml': No such file or directory
101759:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
101760:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
104376:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
110706:libunwind-static-aarch64-unknown-linux-musl> aclocal: warning: couldn't open directory 'm4': No such file or directory
112682:keyutils-static-aarch64-unknown-linux-musl> Error loading shared library ld-linux-aarch64.so.1: No such file or directory (needed by /usr/bin/make)
115195:libgpg-error-static-aarch64-unknown-linux-musl> gcrypt: No such file or directory
132114:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory
136223:/tmp/wdJdC_build.sh: line 45: ../tests/testsuite: No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

