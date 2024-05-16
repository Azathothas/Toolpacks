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
    #localxpose : reverse proxy that enables you to expose your localhost to the internet.
     export BIN="loclx" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://localxpose.io/" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && curl -A "$USER_AGENT" -qfsSLJO "https://loclx-client.s3.amazonaws.com/loclx-linux-amd64.zip"
       find . -type f -name '*.zip*' -exec unzip -o {} \; && find . -type f -name '*.zip' -exec rm -rf {} \;
       find . -type f -name 'loclx*' -exec strip {} \; >/dev/null 2>&1
       find . -type f -name 'loclx*' ! -name '*.*' -exec mv {} "$BINDIR/loclx" \;
       cp "$BINDIR/loclx" "$BINDIR/localxpose"
       file "$BINDIR/loclx" && du -sh "$BINDIR/loclx"
       popd >/dev/null 2>&1
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