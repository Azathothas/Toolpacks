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
    #bubblewrap: Unprivileged sandboxing tool
     export BIN="bubblewrap"
     export SOURCE_URL="https://github.com/containers/bubblewrap"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      ##Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" --pull="always" "azathothas/alpine-builder:latest" \
        bash -l -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
        #Build (Regular)
         git clone --filter "blob:none" --quiet "https://github.com/containers/bubblewrap" && cd "./bubblewrap"
         #https://github.com/containers/bubblewrap/blob/main/meson_options.txt
         meson setup --buildtype="release" \
            --default-library="static" \
            --prefer-static \
            -Dc_args="-O2 -flto=auto -static -w -pipe" \
            -Dc_link_args="-static -s -Wl,-S -Wl,--build-id=none" \
            -Dcpp_args="-static -s -Wl,-S -Wl,--build-id=none" \
            -Db_lto="true" \
            -Db_pie="true" \
            -Db_staticpic="true" \
            -Dtests="false" \
            -Dman="disabled" \
            -Dselinux="disabled" \
            --strip --reconfigure --wipe --clearcache "./STATIC_BUILD" "./"
            ninja -C "./STATIC_BUILD" -j "$(($(nproc)+1))" install
        #Copy
         #cp "./STATIC_BUILD/bwrap" "/build-bins/bwrap"
         find "./STATIC_BUILD" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} rsync -achvL "{}" "/build-bins/"
        #Build (Patched) #Allows nested bubblewraps with capabilities
         pushd "$(mktemp -d)" >/dev/null 2>&1 && git clone --filter "blob:none" --quiet "https://github.com/containers/bubblewrap" && cd "./bubblewrap"
         sed '\''/real_uid != 0 && has_caps ()/,/^[[:space:]]*else/!b; /real_uid != 0 && has_caps/s/^/\/\/ /; /^[[:space:]]*else/!s/^/\/\/ /'\'' -i "./bubblewrap.c"
         meson setup --buildtype="release" \
            --default-library="static" \
            --prefer-static \
            -Dc_args="-O2 -flto=auto -static -w -pipe" \
            -Dc_link_args="-static -s -Wl,-S -Wl,--build-id=none" \
            -Dcpp_args="-static -s -Wl,-S -Wl,--build-id=none" \
            -Db_lto="true" \
            -Db_pie="true" \
            -Db_staticpic="true" \
            -Dtests="false" \
            -Dman="disabled" \
            -Dselinux="disabled" \
            --strip --reconfigure --wipe --clearcache "./STATIC_BUILD" "./"
            ninja -C "./STATIC_BUILD" -j "$(($(nproc)+1))" install
        #Copy
         find "./STATIC_BUILD" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | grep -im1 "wrap" | xargs -I {} rsync -achvL "{}" "/build-bins/bwrap-patched"
        #strip & info 
         find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
         find "/build-bins/" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         rsync -achL "/build-bins/bwrap" "/build-bins/bubblewrap"
         file "/build-bins/"* && du -sh "/build-bins/"*
         popd >/dev/null 2>&1
        '
      #Copy & Meta
       docker cp "alpine-builder:/build-bins/." "$(pwd)/"
       find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath
       #Meta
       find "." -maxdepth 1 -type f -print | xargs -I {} sh -c 'file {}; b3sum {}; sha256sum {}; du -sh {}'
       sudo rsync -av --copy-links --exclude="*/" "./." "${BINDIR}"
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