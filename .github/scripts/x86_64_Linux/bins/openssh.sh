#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "$BUILD" != "YES" ] || \
   [ -z "$BINDIR" ] || \
   [ -z "$EGET_EXCLUDE" ] || \
   [ -z "$EGET_TIMEOUT" ] || \
   [ -z "$GIT_TERMINAL_PROMPT" ] || \
   [ -z "$GIT_ASKPASS" ] || \
   [ -z "$GITHUB_TOKEN" ] || \
   [ -z "$SYSTMP" ] || \
   [ -z "$TMPDIRS" ]; then
 #exit
  echo -e "\n[+]Skipping Builds...\n"
  exit 1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
export SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
      #openssh
     export BIN="ssh" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/openssh/openssh-portable" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/binary-manu/static-cross-openssh" && cd "./static-cross-openssh"
       #make
       make --jobs="$(($(nproc)+1))" --keep-going ARCH="x86-64" __all__/VERSION="latest" PREFIX="/usr" all
       #Extract
       find "./bin" -type f -name '*.tgz' -exec sh -c 'mkdir -p "${1%.tgz}" && tar -xzf "$1" -C "${1%.tgz}" --strip-components=1' sh {} \;
       rm -rf "./bin/"*.tgz && find "./bin" -empty -delete 
       #Meta
       cd "$(find "./bin" -maxdepth 1 -type d -name '*openssh*')"
       #ssh-add : adds RSA or DSA identities to the authentication agent ssh-agent
       strip "./bin/ssh-add" ; file "./bin/ssh-add" && du -sh "./bin/ssh-add" && cp "./bin/ssh-add" "$BINDIR/ssh-add"
       #ssh-agent : OpenSSH authentication agent
       strip "./bin/ssh-agent" ; file "./bin/ssh-agent" && du -sh "./bin/ssh-agent" && cp "./bin/ssh-agent" "$BINDIR/ssh-agent"
       #ssh-keygen : OpenSSH authentication key utility
       strip "./bin/ssh-keygen" ; file "./bin/ssh-keygen" && du -sh "./bin/ssh-keygen" && cp "./bin/ssh-keygen" "$BINDIR/ssh-keygen"
       #ssh-keyscan : gather SSH public keys from servers
       strip "./bin/ssh-keyscan" ; file "./bin/ssh-keyscan" && du -sh "./bin/ssh-keyscan" && cp "./bin/ssh-keyscan" "$BINDIR/ssh-keyscan"
       #ssh-keysign : OpenSSH helper for host-based authentication
       strip "./libexec/ssh-keysign" ; file "./libexec/ssh-keysign" && du -sh "./libexec/ssh-keysign" && cp "./libexec/ssh-keysign" "$BINDIR/ssh-keysign"
       #scp : copies files between hosts on a network using SFTP protocol over ssh
       strip "./bin/scp" ; file "./bin/scp" && du -sh "./bin/scp" && cp "./bin/scp" "$BINDIR/scp"
       #sftp : ssh sftp deps
       strip "./bin/sftp" ; file "./bin/sftp" && du -sh "./bin/sftp" && cp "./bin/sftp" "$BINDIR/sftp"
       strip "./libexec/sftp-server" ; file "./libexec/sftp-server" && du -sh "./libexec/sftp-server" && cp "./libexec/sftp-server" "$BINDIR/sftp-server"
       #sshd : Main SSH Server Daemon
       strip "./sbin/sshd" ; file "./sbin/sshd" && du -sh "./sbin/sshd" && cp "./sbin/sshd" "$BINDIR/sshd"
       #sshd_config
       cp "./etc/sshd_config" "$BINDIR/sshd_config"       
       popd >/dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#