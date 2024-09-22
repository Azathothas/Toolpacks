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
   #void: Portable Ephemeral Void Linux Docker Image (DockerC)
     export BIN="void"
     export SOURCE_URL="hhttps://github.com/void-linux/void-containers"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       #glibc
       sudo docker pull "ghcr.io/void-linux/void-glibc-full:latest"
       sudo dockerc --image "docker-daemon:ghcr.io/void-linux/void-glibc-full:latest" --output "$BINDIR/void-glibc.no_strip"
       sudo chown -R "$(whoami):$(whoami)" "$BINDIR/void-glibc.no_strip" && chmod -R 755 "$BINDIR/void-glibc.no_strip"
       file "$BINDIR/void-glibc.no_strip" && du -sh "$BINDIR/void-glibc.no_strip"      
       #musl
       sudo docker pull "ghcr.io/void-linux/void-musl-full:latest"
       sudo dockerc --image "docker-daemon:ghcr.io/void-linux/void-musl-full:latest" --output "$BINDIR/void-musl.no_strip"
       sudo chown -R "$(whoami):$(whoami)" "$BINDIR/void-musl.no_strip" && chmod -R 755 "$BINDIR/void-musl.no_strip"
       file "$BINDIR/void-musl.no_strip" && du -sh "$BINDIR/void-musl.no_strip"
      #cleanup
       sudo docker rmi "ghcr.io/void-linux/void-glibc-full:latest" --force
       sudo docker rmi "ghcr.io/void-linux/void-musl-full:latest" --force
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