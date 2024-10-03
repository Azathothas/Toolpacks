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
SKIP_BUILD="YES" #WIP
if [ "${SKIP_BUILD}" == "NO" ]; then
    #simplex-chat : SimpleX Chat terminal (console) app
     export BIN="simplex-chat"
     export SOURCE_URL="https://github.com/simplex-chat/simplex-chat"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      ##Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       git clone --filter="blob:none" --depth="1" --quiet "https://github.com/simplex-chat/simplex-chat" && cd "./simplex-chat"
       git checkout stable
       DOCKER_BUILDKIT="1" docker build --output "./" "."
       staticx --loglevel DEBUG "./simplex-chat" --strip "${BINDIR}/simplex-chat"
       objcopy --remove-section=".comment" --remove-section=".note.*" "${BINDIR}/simplex-chat"
       strip --strip-debug --strip-dwo --strip-unneeded -R ".comment" -R ".gnu.version" "${BINDIR}/simplex-chat"
       file "${BINDIR}/simplex-chat" && du -sh "${BINDIR}/simplex-chat"
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