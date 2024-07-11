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
    #exatorrent : 🧲 Self-Hostable easy to use Torrent Client which allows direct stream  in Browser/Media Player
     export BIN="exatorrent"
     export SOURCE_URL="https://github.com/varbhat/exatorrent"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        bash -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
        #Build: https://github.com/varbhat/exatorrent/blob/main/Makefile
         git clone --quiet --filter "blob:none" "https://github.com/varbhat/exatorrent" && cd "./exatorrent"
         #web files
         cd "./internal/web" && npm install && npm run build ; cd "../../"
         GOOS="linux" GOARCH="arm64" CGO_ENABLED="1" CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" -o "./exatorrent-bin" "./exatorrent.go"
         GOOS="linux" GOARCH="arm64" CGO_ENABLED="1" CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" -tags "noui" -o "./exatorrent-bin-noui" "./exatorrent.go"
        #strip & info
         strip "./exatorrent-bin" ; cp "./exatorrent-bin" "/build-bins/exatorrent"
         strip "./exatorrent-bin-noui" ; cp "./exatorrent-bin-noui" "/build-bins/exatorrent-noui"
        '
      #Copy
       docker cp "alpine-builder:/build-bins/." "./"
       #Meta
       file "./exatorrent" && du -sh "./exatorrent" ; cp "./exatorrent" "$BINDIR/exatorrent"
       file "./exatorrent-noui" && du -sh "./exatorrent-noui" ; cp "./exatorrent-noui" "$BINDIR/exatorrent-noui"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
       popd >/dev/null 2>&1
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
#-------------------------------------------------------#