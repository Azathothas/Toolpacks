```mathematica

[-] Authentication failed --> # Invalid/Deleted GH Repos

47009-
47010- [+] (Building | Fetching) certwatcher :: https://github.com/drfabiocastro/certwatcher
47011-
47012-remote: Support for password authentication was removed on August 13, 2021.
47013-remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
47014:fatal: Authentication failed for 'https://github.com/drfabiocastro/certwatcher/'
47015-go: go.mod file not found in current directory or any parent directory; see 'go help modules'
47016-cp: cannot stat './certwatcher': No such file or directory
47017-


[-] asset * not found --> # Eget failed to find that --asset

98335-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tmux.sh
98336-
98337-
98338- [+] (Building | Fetching) tmux :: https://github.com/tmux/tmux
98339-
98340:asset `tmux_aarch64_Linux` not found
--
104703-[+] Fetching : https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/zstd.sh
104704-
104705-
104706- [+] (Building | Fetching) zstd :: https://github.com/VHSgunzo/zstd-static
104707-
104708:asset `arm64` not found


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
36764:cp: cannot stat './target//release/agrind': No such file or directory
43052:cp: cannot stat './berty': No such file or directory
45376:cp: cannot stat './target/aarch64-unknown-linux-musl/release/boxxy': No such file or directory
47016:cp: cannot stat './certwatcher': No such file or directory
65151:rm: cannot remove './rust-toolchain.toml': No such file or directory
67071:rm: cannot remove './rust-toolchain.toml': No such file or directory
82942:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuildctl': No such file or directory
82943:cp: cannot stat './target/aarch64-unknown-linux-gnu/release/rebuilderd': No such file or directory
85555:cp: cannot stat './target/aarch64-unknown-linux-musl/release/rqbit': No such file or directory
92581:find: '/usr/src/linux-headers-6.1.0-18-cloud-arm64': No such file or directory


[-] Empty (0 Sized) Bins # Usually Because Symlinks

