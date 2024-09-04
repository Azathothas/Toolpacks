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
   #yt-dlp : A feature-rich command-line audio/video downloader
     export BIN="yt-dlp"
     export SOURCE_URL="https://github.com/yt-dlp/yt-dlp-nightly-builds"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Fetch
      # eval "$EGET_TIMEOUT" eget "$SOURCE_URL" --asset "yt-dlp_linux" --asset "^aarch64" --asset "^armv7" "$EGET_EXCLUDE" --to "$BINDIR/yt-dlp"
      #Build: https://github.com/yt-dlp/yt-dlp/blob/master/bundle/docker/static/entrypoint.sh
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/yt-dlp/yt-dlp" && cd "./yt-dlp"
       #https://github.com/yt-dlp/yt-dlp/blob/master/.github/workflows/build.yml
       cd "./bundle/docker" && docker compose up --build "static"
       #copy
       INSTANCE_ID="$(docker ps -a --format '{{json .}}' | jq -rs 'sort_by(.CreatedAt) | reverse | .[] | select(.Status | contains("Exited")) | .ID' | head -n 1)" && export INSTANCE_ID="${INSTANCE_ID}"
       docker cp "${INSTANCE_ID}:/build/yt-dlp_linux" "./yt-dlp"
       #Meta 
       file "./yt-dlp" && du -sh "./yt-dlp" ; cp "./yt-dlp" "$BINDIR/yt-dlp"
      #Delete Containers
       docker stop "${INSTANCE_ID}" 2>/dev/null ; docker rm "${INSTANCE_ID}"
       unset INSTANCE_ID ; popd >/dev/null 2>&1
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