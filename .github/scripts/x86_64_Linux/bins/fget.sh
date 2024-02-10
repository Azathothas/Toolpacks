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
    #fget : Multithread download for a list of files.
     export BIN="fget" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/Azathothas/Arsenal" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir fget && cd "./fget"
       curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/fget/main.go"
       curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/fget/go.mod"
       go get "github.com/Azathothas/Arsenal/fget"
       CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -o "./fget" ; mv "./fget" "$BINDIR/fget" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#