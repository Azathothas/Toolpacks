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
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
      #openssh
     export BIN="ssh" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/openssh/openssh-portable" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch  
      #ssh
       eval "$EGET_TIMEOUT" eget "https://files.serverless.industries/bin/ssh.amd64" --to "$BINDIR/ssh"
       #eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh_amd_x86_64_Linux" --to "$BINDIR/ssh"
       #ssh-add : adds RSA or DSA identities to the authentication agent ssh-agent
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-add_amd_x86_64_Linux" --to "$BINDIR/ssh-add"
       #ssh-agent : OpenSSH authentication agent
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-agent_amd_x86_64_Linux" --to "$BINDIR/ssh-agent"
       #ssh-keygen : OpenSSH authentication key utility
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-keygen_amd_x86_64_Linux" --to "$BINDIR/ssh-keygen"
       #ssh-keyscan : gather SSH public keys from servers
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-keyscan_amd_x86_64_Linux" --to "$BINDIR/ssh-keyscan"
       #ssh-keysign : OpenSSH helper for host-based authentication
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-keysign_amd_x86_64_Linux" --to "$BINDIR/ssh-keysign"
       #sshd
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "sshd_amd_x86_64_Linux" --to "$BINDIR/sshd"
       #eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/openssh/sshd_amd_x86_64_Linux" --to "$BINDIR/sshd"
       #sshd_config
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "sshd_config_amd_x86_64_Linux" --to "$BINDIR/sshd_config"
       #eval "$EGET_TIMEOUT" eget "https://raw.githubusercontent.com/Azathothas/Static-Binaries/main/openssh/sshd_config_amd_x86_64_Linux" --to "$BINDIR/sshd_config"
       #sftp : Dependency for sshd
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "sftp_amd_x86_64_Linux" --to "$BINDIR/sftp"
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "openssh" --asset "sftp_server_amd_x86_64_Linux" --to "$BINDIR/sftp-server"
       #eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/openssh/sftp_server_amd_x86_64_Linux" --to "$BINDIR/sftp"
       #scp : copies files between hosts on a network using SFTP protocol over ssh
       eval "$EGET_TIMEOUT" eget "https://files.serverless.industries/bin/scp.amd64" --to "$BINDIR/scp"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#