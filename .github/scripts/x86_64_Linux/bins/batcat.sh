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
     #batcat: cat with colors & syntax highlights
     export BIN="batcat" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/sharkdp/bat" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       eval "$EGET_TIMEOUT" eget "$SOURCE_URL" --asset "x86_64-unknown-linux-musl.tar.gz" "$EGET_EXCLUDE" --to "$BINDIR/bat"
       eval "$EGET_TIMEOUT" eget "$SOURCE_URL" --asset "x86_64-unknown-linux-musl.tar.gz" "$EGET_EXCLUDE" --to "$BINDIR/batcat"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#