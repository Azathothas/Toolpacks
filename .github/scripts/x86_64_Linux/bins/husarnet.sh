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
   #husarnet : Peer-to-Peer VPN to connect your laptops, servers and microcontrollers over the Internet with zero configuration.
     export BIN="husarnet" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/husarnet/husarnet" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       #RUN_URL="$(gh run list -R "${SOURCE_URL}" --json "url,conclusion" | jq -r '.[] | select(.conclusion == "success") | .url' | uniq | head -n 1)"
       #RUN_ID="$(echo ${RUN_URL} | awk -F/ '{print $NF}' | tr -d '[:space:]')"
       #gh run download -R "${SOURCE_URL}" "${RUN_ID}" -p '*release*linux*amd64*'
       #curl -qfsSL $(curl -qfsSL "https://api.github.com/repos/husarnet/husarnet/actions/artifacts?per_page=100" -H "Authorization: Bearer $GITHUB_TOKEN" | jq -r '[.artifacts[] | select(.name == "release-linux-amd64")] | sort_by(.created_at) | .[].archive_download_url' | sort -V | tail -n 1 ) -H "Authorization: Bearer $GITHUB_TOKEN" -o "husarnet.zip" 
       #unzip "./husarnet.zip" && find . -type f -name '*husarnet*' ! -name '*.zip*' -exec cp {} "$BINDIR/husarnet" \;
       #eval "$EGET_TIMEOUT" eget "$SOURCE_URL" --asset "linux" --asset "amd64" --asset "tar" --download-only
       eval "$EGET_TIMEOUT" eget "https://install.husarnet.com/tar/husarnet-latest-amd64.tar" --download-only
       ouch decompress "./"* --yes
       find . -type d -name '*bin*' ! -name 'build-bins' -print0 | xargs -0 -I {} sh -c 'mkdir -p ./build-bins && cp -r {}/* ./build-bins/'
       strip "./build-bins/"* ; file "./build-bins/"* && du -sh "./build-bins/"*
       rsync -av --copy-links --checksum --progress "./build-bins/" "$BINDIR"
       #popd >/dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#