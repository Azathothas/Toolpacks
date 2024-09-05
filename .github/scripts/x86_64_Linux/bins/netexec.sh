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
    #netexec : The Network Execution Tool
     export BIN="netexec"
     export SOURCE_URL="https://github.com/Pennyw0rth/NetExec"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Fetch
       #eval "$EGET_TIMEOUT" eget "$SOURCE_URL" --asset "nxc" --to "$BINDIR/netexec_dynamic"
      ##Build: https://github.com/Pennyw0rth/NetExec/blob/main/.github/workflows/build-binaries.yml
       popd >/dev/null 2>&1
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable" 2>/dev/null
       docker run --privileged --net="host" --name "debian-builder-unstable" "azathothas/debian-builder-unstable:latest" \
        bash -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
        #https://github.com/Pennyw0rth/NetExec/blob/main/Dockerfile
         sudo apt-get update -y -qq
         sudo apt-get install -y -qq libffi-dev libxml2-dev libxslt-dev libssl-dev openssl autoconf g++ python3-dev curl git
         sudo apt-get update -y -qq
        #Build
         git clone --quiet --filter "blob:none" "https://github.com/Pennyw0rth/NetExec" && cd "./NetExec"
         pip install . --break-system-packages --force-reinstall --upgrade
         #https://github.com/Pennyw0rth/NetExec/blob/main/netexec.spec
         sed "s/upx=True/upx=False/" -i "./netexec.spec"
         pyinstaller --clean "./netexec.spec" --noconfirm
         staticx --loglevel DEBUG "./dist/nxc" --strip "/build-bins/netexec"
        #strip & info 
         cp "./dist/nxc" "/build-bins/netexec_dynamic"
         popd >/dev/null 2>&1
        '
      #Copy 
       docker cp "debian-builder-unstable:/build-bins/." "$(pwd)/"
       #Meta 
       file "./axel" && du -sh "./axel"
       cp "./axel" "$BINDIR/axel"
      #Delete Containers
       docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable"
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