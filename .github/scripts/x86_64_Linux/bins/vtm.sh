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
     #vtm : virtual terminal multiplexer
     export BIN="vtm" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/directvt/vtm" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/directvt/vtm/releases/latest" -H "Authorization: Bearer $GITHUB_TOKEN" | jq -r '.assets[].browser_download_url' | grep -i 'linux_x86_64.zip')
       find . -type f -name '*.zip' -exec unzip {} \;
       find . -type f -name '*.tar' -exec tar -xvf {} \; && rm *.tar *.zip 2>/dev/null
       find . -type f -name 'vtm' -exec mv {} "$BINDIR/vtm" \; && popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#