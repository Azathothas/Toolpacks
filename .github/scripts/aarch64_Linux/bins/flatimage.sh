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
  #flatimage : A hybrid of Flatpak sandboxing with AppImage portability
     export BIN="flatimage"
     export SOURCE_URL="https://github.com/ruanformigoni/flatimage"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Fetch
       #eval "${EGET_TIMEOUT}" eget "${SOURCE_URL}" --asset "alpine" --asset "flatimage" --asset "^.sha" --to "${BINDIR}/alpine-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/alpine.flatimage" --to "${BINDIR}/alpine-flatimage.no_strip"
       #eval "${EGET_TIMEOUT}" eget "${SOURCE_URL}" --asset "arch" --asset "flatimage" --asset "^.sha" --to "${BINDIR}/archlinux-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/archlinux.flatimage" --to "${BINDIR}/archlinux-flatimage.no_strip"
       #eval "${EGET_TIMEOUT}" eget "${SOURCE_URL}" --asset "blueprint" --asset "flatimage" --asset "^.sha" --to "${BINDIR}/blueprint-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/artix.flatimage" --to "${BINDIR}/artix-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/blueprint.flatimage" --to "${BINDIR}/blueprint-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/cachyos.flatimage" --to "${BINDIR}/cachyos-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/debian.flatimage" --to "${BINDIR}/debian-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/ubuntu.flatimage" --to "${BINDIR}/ubuntu-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/void-glibc.flatimage" --to "${BINDIR}/void-glibc-flatimage.no_strip"
       eget "https://github.com/Azathothas/flatimage-base/releases/download/aarch64/void-musl.flatimage" --to "${BINDIR}/void-musl-flatimage.no_strip"
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