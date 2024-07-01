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
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
    #patchelf : A small utility to modify the dynamic linker and RPATH of ELF executables
     export BIN="patchelf"
     export SOURCE_URL="https://github.com/NixOS/patchelf"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build (nix) 
      # pushd "$($TMPDIRS)" >/dev/null 2>&1
      # NIXPKGS_ALLOW_BROKEN="1" NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM="1" nix-build '<nixpkgs>' --attr "pkgsStatic.patchelf" --cores "$(($(nproc)+1))" --max-jobs "$(($(nproc)+1))" --log-format bar-with-logs
      # sudo strip "./result/bin/patchelf" ; file "./result/bin/patchelf" && du -sh "./result/bin/patchelf"
      # cp "./result/bin/patchelf" "$BINDIR/patchelf"
      # nix-collect-garbage >/dev/null 2>&1 ; popd >/dev/null 2>&1
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        bash -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/NixOS/patchelf" && cd "./patchelf"
         export CFLAGS="-O2 -flto=auto -static -w -pipe"
         export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none"
         bash "./bootstrap.sh" ; "./configure" --disable-shared --disable-Werror --enable-static
         make --jobs="$(($(nproc)+1))" --keep-going
        #strip & info
         strip "./src/patchelf" ; "./src/patchelf" --version ; cp "./src/patchelf" "/build-bins/patchelf"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/." "./"
       #Meta 
       file "./patchelf" && du -sh "./patchelf" ; cp "./patchelf" "$BINDIR/patchelf"
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