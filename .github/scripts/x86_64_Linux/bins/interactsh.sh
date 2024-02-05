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
      #interactsh : An OOB interaction gathering server and client library
     export BIN="interactsh" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/projectdiscovery/interactsh" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch  
       eval "$EGET_TIMEOUT" eget "projectdiscovery/interactsh" --asset "amd64" --asset "linux" --asset "interactsh-client" --to "$BINDIR/interactsh-client"
       eval "$EGET_TIMEOUT" eget "projectdiscovery/interactsh" --asset "amd64" --asset "linux" --asset "interactsh-server" --to "$BINDIR/interactsh-server"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#