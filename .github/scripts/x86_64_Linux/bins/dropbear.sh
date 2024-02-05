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
     #Dropbear : A smallish SSH server and client
     export BIN="dropbear" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/mkj/dropbear" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dbclient_amd_x86_64_Linux" --to "$BINDIR/dbclient"
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbear_amd_x86_64_Linux" --to "$BINDIR/dropbear"
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearconvert_amd_x86_64_Linux" --to "$BINDIR/dropbearconvert"
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearkey_amd_x86_64_Linux" --to "$BINDIR/dropbearkey"
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearmulti_amd_x86_64_Linux" --to "$BINDIR/dropbearmulti"
       eval "$EGET_TIMEOUT" eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearscp_amd_x86_64_Linux" --to "$BINDIR/dropbearscp"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#