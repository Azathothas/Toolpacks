#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "${BUILD}" != "YES" ] || \
   [ -z "${BINDIR}" ] || \
   [ -z "${EGET_EXCLUDE}" ] || \
   [ -z "${EGET_TIMEOUT}" ] || \
   [ -z "${GIT_TERMINAL_PROMPT}" ] || \
   [ -z "${GIT_ASKPASS}" ] || \
   [ -z "${GITHUB_TOKEN}" ] || \
   [ -z "${SYSTMP}" ] || \
   [ -z "${TMPDIRS}" ]; then
 #exit
  echo -e "\n[+]Skipping Builds...\n"
  exit 1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
export SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "${SKIP_BUILD}" == "NO" ]; then
      #sysbox : next-generation "runc" that empowers rootless containers to run workloads such as Systemd, Docker, Kubernetes, just like VMs.
     export BIN="sysbox" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/nestybox/sysbox" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" --recursive "https://github.com/nestybox/sysbox" && cd "./sysbox"
       #https://github.com/nestybox/sysbox/blob/master/docs/developers-guide/build.md#building--installing-from-source
       make gomod-tidy 2>/dev/null ; make distclean 2>/dev/null
       make sysbox-static --jobs="$(($(nproc)+1))" --keep-going
       #Meta
       find . -mindepth 2 -type d -name "build" | xargs -I {} find {} -type f | xargs -I {} sh -c 'echo; file {}; du -sh {}; echo'
       #Strip & Move
       find . -mindepth 2 -type d -name "build" | xargs -I {} find {} -type f | xargs strip 2>/dev/null
       find . -mindepth 2 -type d -name "build" | xargs -I {} find {} -type f | xargs sha256sum
       find . -mindepth 2 -type d -name "build" | xargs -I {} find {} -type f | xargs -I {} cp {} "$BINDIR"
       make gomod-tidy 2>/dev/null ; make distclean 2>/dev/null
       sudo rm "$HOME/go/pkg/mod" -rf 2>/dev/null ; popd >/dev/null 2>&1
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