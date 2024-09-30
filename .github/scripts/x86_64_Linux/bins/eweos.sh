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
export SKIP_BUILD="NO"
if [ "$SKIP_BUILD" == "NO" ]; then
   #eweos: Portable Ephemeral eweOS Docker Image (DockerC)
     export BIN="eweos"
     export SOURCE_URL="https://github.com/eweOS/docker"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       #glibc
       sudo docker pull "ghcr.io/eweos/docker:nightly"
       sudo dockerc --image "docker-daemon:ghcr.io/eweos/docker:nightly" --output "$BINDIR/eweos.no_strip"
       sudo chown -R "$(whoami):$(whoami)" "$BINDIR/eweos.no_strip" && chmod -R 755 "$BINDIR/eweos.no_strip"
       file "$BINDIR/eweos.no_strip" && du -sh "$BINDIR/eweos.no_strip"
      #cleanup
       sudo docker rmi "ghcr.io/eweos/docker:nightly" --force
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