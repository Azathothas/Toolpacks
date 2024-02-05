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
     #dysk : A linux utility to get information on filesystems, like df but better
     export BIN="dysk" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/Canop/dysk" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build    
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/Canop/dysk/releases/latest" | jq -r '.assets[].browser_download_url' | grep -i 'dysk' | grep -i 'zip')
       find . -type f -name '*.zip*' -exec unzip -o {} \;
       find . -type f -name '*.md' -exec rm {} \;
       #mv "$(find . -type d -name '*x86_64*' -name '*linux*' ! -name '*musl*')/dysk" "$BINDIR/dysk_gcc"   
       mv "$(find . -type d -name '*x86_64*' -name '*linux*' -name '*musl*')/dysk" "$BINDIR/dysk" ; popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#