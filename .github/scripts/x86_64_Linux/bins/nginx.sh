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
    #nginx : Static Nginx and njs binaries for Linux
     export BIN="nginx" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/jirutka/nginx-binaries" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       # https://github.com/jirutka/nginx-binaries --> binaries branch
       eval "$EGET_TIMEOUT" eget "$(curl -qfsSL "https://api.github.com/repos/jirutka/nginx-binaries/contents/?ref=binaries" -H "Accept: application/vnd.github.v3+json" -H "Authorization: Bearer $GITHUB_TOKEN" | jq -r '.[].download_url' | grep -i "x86_64-linux$" | grep -iv "njs\|debug" | sort -u | tail -n 1)" --to "$BINDIR/nginx"
       eval "$EGET_TIMEOUT" eget "$(curl -qfsSL "https://api.github.com/repos/jirutka/nginx-binaries/contents/?ref=binaries" -H "Accept: application/vnd.github.v3+json" -H "Authorization: Bearer $GITHUB_TOKEN" | jq -r '.[].download_url' | grep -i "x86_64-linux$" | grep -iv "debug" | sort -u | tail -n 1)" --to "$BINDIR/njs"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#