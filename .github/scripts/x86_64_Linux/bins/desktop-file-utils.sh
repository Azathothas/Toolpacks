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
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "${SKIP_BUILD}" == "NO" ]; then
    #desktop-file-utils: Command line utilities for working with .desktop files
     export BIN="desktop-file-utils"
     export SOURCE_URL="https://gitlab.freedesktop.org/xdg/desktop-file-utils"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      ##Fetch: https://github.com/probonopd/static-tools
      # #desktop-file-install
      # eval "${EGET_TIMEOUT}" eget "${SOURCE_URL}" --asset "desktop-file-install" --asset "x86_64" --to "${BINDIR}/desktop-file-install"
      # objcopy --remove-section=".comment" --remove-section=".note.*" "${BINDIR}/desktop-file-install"
      # strip --strip-debug --strip-dwo --strip-unneeded -R ".comment" -R ".gnu.version" "${BINDIR}/desktop-file-install"
      # realpath "${BINDIR}/desktop-file-install" | xargs -I {} sh -c 'file {}; b3sum {}; sha256sum {}; du -sh {}'
      # #desktop-file-validate
      # eval "${EGET_TIMEOUT}" eget "${SOURCE_URL}" --asset "desktop-file-validate" --asset "x86_64" --to "${BINDIR}/desktop-file-validate"
      # objcopy --remove-section=".comment" --remove-section=".note.*" "${BINDIR}/desktop-file-validate"
      # strip --strip-debug --strip-dwo --strip-unneeded -R ".comment" -R ".gnu.version" "${BINDIR}/desktop-file-validate"
      # realpath "${BINDIR}/desktop-file-validate" | xargs -I {} sh -c 'file {}; b3sum {}; sha256sum {}; du -sh {}'
      # #update-desktop-database
      # eval "${EGET_TIMEOUT}" eget "${SOURCE_URL}" --asset "update-desktop-database" --asset "x86_64" --to "${BINDIR}/update-desktop-database"
      # objcopy --remove-section=".comment" --remove-section=".note.*" "${BINDIR}/update-desktop-database"
      # strip --strip-debug --strip-dwo --strip-unneeded -R ".comment" -R ".gnu.version" "${BINDIR}/update-desktop-database"
      # realpath "${BINDIR}/update-desktop-database" | xargs -I {} sh -c 'file {}; b3sum {}; sha256sum {}; du -sh {}'     
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       NIXPKGS_ALLOW_BROKEN="1" NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM="1" nix-build '<nixpkgs>' --attr "pkgsStatic.desktop-file-utils" --cores "$(($(nproc)+1))" --max-jobs "$(($(nproc)+1))" --log-format bar-with-logs
       sudo rsync -av --copy-links "./result/bin/." "$BINDIR/"
       sudo chown -R "$(whoami):$(whoami)" "$BINDIR/" && chmod -R 755 "$BINDIR/"
       #Strip
       find "$BINDIR" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
       nix-collect-garbage >/dev/null 2>&1 ; popd >/dev/null 2>&1
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