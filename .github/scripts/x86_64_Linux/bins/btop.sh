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
     #btop : htop clone | A monitor of resources 
     export BIN="btop" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/aristocratos/btop" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
      #  pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfsSL $(curl -qfsSL "https://api.github.com/repos/aristocratos/btop/actions/artifacts?per_page=100" -H "Authorization: Bearer $GITHUB_TOKEN" | jq -r '[.artifacts[] | select(.name == "btop-x86_64-linux-musl")] | sort_by(.created_at) | .[].archive_download_url') -H "Authorization: Bearer $GITHUB_TOKEN" -o "btop.zip" 
      #  unzip "./btop.zip" && find . -type f -name '*btop*' ! -name '*.zip*' -exec mv {} "$BINDIR/btop" \; && popd > /dev/null 2>&1
      #Fetch
       eval "$EGET_TIMEOUT" eget "$SOURCE_URL" --asset "linux" --asset "x86_64" --asset "musl" "$EGET_EXCLUDE" --to "$BINDIR/$BIN"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#