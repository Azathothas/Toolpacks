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
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#