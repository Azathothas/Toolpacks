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
    #rescope : A scope generation tool for Burp Suite & ZAP 
     export BIN="rescope" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/root4loot/rescope" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       # Installton will require placing a $SYSTMP/rescope/configs/avoid.txt
       # mkdir -p "$SYSTMP/rescope/configs" ; curl -qfsSL "https://raw.githubusercontent.com/root4loot/rescope/master/configs/avoid.txt" -o "$SYSTMP/rescope/configs/avoid.txt"
       cd $SYSTMP && git clone --quiet --filter "blob:none" "https://github.com/root4loot/rescope" && cd "./rescope"
       CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./rescope" "$BINDIR/rescope" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#