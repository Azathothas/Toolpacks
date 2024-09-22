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
   #debian: Portable Ephemeral debian Linux Docker Image (DockerC)
     export BIN="debian"
     export SOURCE_URL="ttps://github.com/debuerreotype/docker-debian-artifacts"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       #base
       sudo dockerc --image "docker://debian:latest" --output "$BINDIR/debian.no_strip"
       sudo chown -R "$(whoami):$(whoami)" "$BINDIR/debian.no_strip" && chmod -R 755 "$BINDIR/debian.no_strip"
       file "$BINDIR/debian.no_strip" && du -sh "$BINDIR/debian.no_strip"
       #slim
       sudo dockerc --image "docker://debian:stable-slim" --output "$BINDIR/debian-slim.no_strip"
       sudo chown -R "$(whoami):$(whoami)" "$BINDIR/debian-slim.no_strip" && chmod -R 755 "$BINDIR/debian-slim.no_strip"
       file "$BINDIR/debian-slim.no_strip" && du -sh "$BINDIR/debian-slim.no_strip"
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