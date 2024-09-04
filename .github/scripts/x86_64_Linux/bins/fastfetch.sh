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
    #fastfetch : Like neofetch, but much faster because written in C.
     export BIN="fastfetch" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/fastfetch-cli/fastfetch" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Install Deps:: https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/alpine-builder.dockerfile
        #https://github.com/fastfetch-cli/fastfetch/blob/dev/.github/workflows/ci.yml
         apk update && apk upgrade --no-interactive
         apk add chafa-dev --latest --upgrade --no-interactive
         apk add dconf-dev --latest --upgrade --no-interactive
         apk add dbus-dev --latest --upgrade --no-interactive
         apk add ddcutil-dev --latest --upgrade --no-interactive
         apk add imagemagick-dev --latest --upgrade --no-interactive
         apk add imagemagick-static --latest --upgrade --no-interactive
         apk add libdrm-dev --latest --upgrade --no-interactive
         apk add libxcb-dev --latest --upgrade --no-interactive
         apk add libxcb-static --latest --upgrade --no-interactive
         apk add libxrandr-dev --latest --upgrade --no-interactive
         apk add libva-glx-dev --latest --upgrade --no-interactive
         apk add mesa-dev --latest --upgrade --no-interactive
         apk add networkmanager-dev --latest --upgrade --no-interactive
         apk add opencl-dev --latest --upgrade --no-interactive
         apk add pulseaudio-dev --latest --upgrade --no-interactive
         apk del rpm --force --no-interactive
         apk add samurai --latest --upgrade --no-interactive
         apk add vulkan-loader-dev --latest --upgrade --no-interactive
         apk add xfconf-dev --latest --upgrade --no-interactive
         apk add wayland-dev --latest --upgrade --no-interactive
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/fastfetch-cli/fastfetch" && cd "./fastfetch"
         mkdir -p "./STATIC_BUILD"
         cmake -DCMAKE_C_FLAGS="-O2 -flto=auto -static -w -pipe" \
         -DCMAKE_EXE_LINKER_FLAGS="-static -s -Wl,-S -Wl,--build-id=none" \
         -DCMAKE_BUILD_TYPE="Release" \
         -DCMAKE_INSTALL_PREFIX="/usr" \
         -DIS_MUSL="ON" \
         -DBUILD_SHARED_LIBS="Off" \
         -DBUILD_TESTS="Off" \
         -DSET_TWEAK="Off" \
         -GNinja \
         -B "./STATIC_BUILD"
         cmake --build "./STATIC_BUILD" --target package -j"$(($(nproc)+1))"
        #copy
         find "./STATIC_BUILD" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} cp --force {} /build-bins/
        '
      #Copy
       docker cp "alpine-builder:/build-bins/." "./"
       #Meta
       find "." -maxdepth 1 -type f -exec sh -c 'file "{}"; du -sh "{}"' \;
       sudo rsync -av --copy-links --exclude="*/" "./." "$BINDIR"
       #Test
       docker run --privileged -it --rm --network="bridge" -v "$BINDIR:/mnt" "alpine" "/mnt/fastfetch"
       docker run --privileged -it --rm --network="bridge" -v "$BINDIR:/mnt" "alpine" "/mnt/flashfetch"       
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
