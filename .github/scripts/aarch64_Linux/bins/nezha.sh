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
    #nezha : Self-hosted, lightweight server and website monitoring and O&M tool
     export BIN="nezha" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/naiba/nezha" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Build
         #Dashboard
         git clone --quiet --filter "blob:none" "https://github.com/naiba/nezha" && cd "./nezha"
         rm -rf "./go.mod" "./go.sum" 2>/dev/null
         go mod init "github.com/naiba/nezha" ; go mod tidy
         GOOS="linux" GOARCH="arm64" CGO_ENABLED="1" CGO_CFLAGS="-D_LARGEFILE64_SOURCE -O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" -o "./nezha-dashboard" "./cmd/dashboard"
         strip "./nezha-dashboard" ; cp "./nezha-dashboard" "/build-bins/nezha-dashboard"
         #Agent
         git clone --quiet --filter "blob:none" "https://github.com/nezhahq/agent" && cd "./agent"
         rm -rf "./go.mod" "./go.sum" 2>/dev/null
         go mod init "github.com/nezhahq/agent" ; go mod tidy
         GOOS="linux" GOARCH="arm64" CGO_ENABLED="1" CGO_CFLAGS="-D_LARGEFILE64_SOURCE -O2 -flto=auto -fPIE -fpie -static -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -static-pie -Wl,--build-id=none'\''" -o "./nezha-agent" "./cmd/agent"
         strip "./nezha-agent" ; cp "./nezha-agent" "/build-bins/nezha-agent"
        '
      #Addons
       curl -qfsSL "https://raw.githubusercontent.com/naiba/nezha/master/script/install_en.sh" -o "$BINDIR/nezha-install.sh"
      #Binaries
       docker cp "alpine-builder:/build-bins/." "$(pwd)/"
       file "./nezha-dashboard" && du -sh "./nezha-dashboard" ; cp "./nezha-dashboard" "$BINDIR/nezha-dashboard"
       file "./nezha-agent" && du -sh "./nezha-agent" ; cp "./nezha-agent" "$BINDIR/nezha-agent"
      #Services
       curl -qfsSL "https://raw.githubusercontent.com/naiba/nezha/master/script/nezha-dashboard.service" -o "$BINDIR/nezha-dashboard.service"
       curl -qfsSL "https://raw.githubusercontent.com/naiba/nezha/master/script/nezha-dashboard" -o "$BINDIR/nezha-dashboard.openrc"
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