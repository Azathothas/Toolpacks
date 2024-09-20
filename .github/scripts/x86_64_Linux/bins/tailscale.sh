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
    #tailscale : The easiest, most secure way to use WireGuard and 2FA
     export BIN="tailscale" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/tailscale/tailscale" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" --pull="always" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Build
         git clone --quiet --filter "blob:none" "https://github.com/tailscale/tailscale" && cd "./tailscale"
         #tailscale
         GOOS="linux" GOARCH="amd64" CGO_ENABLED="1" CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" "./cmd/tailscale"
         #tailscaled
         GOOS="linux" GOARCH="amd64" CGO_ENABLED="1" CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" "./cmd/tailscaled"
         #combined
         GOOS="linux" GOARCH="amd64" CGO_ENABLED="1" CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" -tags "ts_include_cli" -o "./tailscale_bb" "./cmd/tailscaled"
        #strip & info
         strip "./tailscale" "./tailscaled" "./tailscale_bb"
         cp "./tailscale" "/build-bins/tailscale"
         cp "./tailscaled" "/build-bins/tailscaled"
         cp "./tailscale_bb" "/build-bins/tailscale_bb"
        '
      #Copy
       docker cp "alpine-builder:/build-bins/." "$(pwd)/"
       #Meta 
       file "./tailscale" && du -sh "./tailscale" ; cp "./tailscale" "$BINDIR/tailscale"
       file "./tailscaled" && du -sh "./tailscaled" ; cp "./tailscaled" "$BINDIR/tailscaled"
       file "./tailscale_bb" && du -sh "./tailscale_bb" ; cp "./tailscale_bb" "$BINDIR/tailscale_bb"
       file "./tailscale_bb" && du -sh "./tailscale_bb" ; cp "./tailscale_bb" "$BINDIR/tailscale_merged"
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