```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

47298-
47299- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
47300-
47301-remote: Support for password authentication was removed on August 13, 2021.
47302-remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
47303:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
47304-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
47305-cp: cannot stat './certwatcher': No such file or directory
47306-


[-] asset * not found --> # Eget failed to find that --asset

99008-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
99009-
99010-
99011- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
99012-
99013:asset `tmux_aarch64_Linux` not found
--
105322-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
105323-
105324-
105325- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
105326-
105327:asset `arm64` not found


[-] Could not resolve host --> # Curl Failed to connect, usually Invalid URL




[-] command not found --> # Something failed to Install



[-] Dynamically Linked --> # Not Statically Linked

318:./katana:                          ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=a0e90cbb1c9d0b9847ec2405697d598020d05182, for GNU/Linux 3.7.0, stripped
427:./promtail:                        ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=81b5724ea8c46eb7c50a6fc8ab9b5e5efcf84b95, for GNU/Linux 3.7.0, stripped
475:./rqbit:                           ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped


[-] Incorrect Arch --> # Not for aarch64

80:./chameleon:                       ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), static-pie linked, stripped
173:./elinks:                          ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header
174:./elinks-lite:                     ELF 32-bit LSB executable, ARM, EABI5 version 1 (GNU/Linux), statically linked, no section header


[-] No such file or directory # Usually Because Build Failures

1452:/usr/bin/deb-systemd-helper: error: systemctl preset failed on lm-sensors.service: No such file or directory
36784:cp: cannot stat './target//release/agrind': No such file or directory
43072:cp: cannot stat './berty': No such file or directory
45395:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
47305:cp: cannot stat './certwatcher': No such file or directory
65822:rm: cannot remove './rust-toolchain.toml': No such file or directory
67742:rm: cannot remove './rust-toolchain.toml': No such file or directory
83617:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
83618:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
86230:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
93255:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

