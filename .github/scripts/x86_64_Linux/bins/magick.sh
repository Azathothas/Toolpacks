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
    #magick : FOSS suite for editing and manipulating Digital Images & Files
     export BIN="magick"
     export SOURCE_URL="https://github.com/ImageMagick/ImageMagick"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Fetch
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       eval "${EGET_TIMEOUT}" eget "https://pkg.ajam.dev/$(uname -m)/magick.AppImage" --to "${BINDIR}/magick.no_strip"
       eval "${EGET_TIMEOUT}" eget "https://pkg.ajam.dev/$(uname -m)/magick.AppImage" --to "${BINDIR}/imagemagick.no_strip"
       eval "${EGET_TIMEOUT}" eget "https://pkg.ajam.dev/$(uname -m)/magick.dwfs.AppBundle" --to "./magick_appbundle.no_strip"
       chmod +x "./magick_appbundle.no_strip"
       curl -qfsSL "https://bin.ajam.dev/$(uname -m)/bin.default.png" -o "./bin.default.png"
       if ! "./magick_appbundle.no_strip" identify "./bin.default.png" 2>&1 | grep -qi "error"; then
         rsync -achLv "./magick_appbundle.no_strip" "${BINDIR}/magick_appbundle.no_strip"
       fi
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