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
      #mubeng : An incredibly fast proxy checker & IP rotator with ease     
     export BIN="mubeng" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/kitabisa/mubeng" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       #eval "$EGET_TIMEOUT" eget "kitabisa/mubeng" --asset "amd64" --asset "linux" --to "$BINDIR/mubeng"
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/kitabisa/mubeng" && cd "./mubeng"
       CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/mubeng" ; mv "./mubeng" "$BINDIR/mubeng" ; popd > /dev/null 2>&1
       go clean -cache -fuzzcache -modcache -testcache
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#