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
      #archey : Archey is a simple system information tool written in Python
     export BIN="archey" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/HorlogeSkynet/archey4" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --filter "blob:none" --quiet "https://github.com/HorlogeSkynet/archey4" && cd "./archey4"
      # #Nutika
      #  #Static Build is possible with cflags|ldflags, but pointless since most modules will be ignored
      #  #zig support: https://github.com/Nuitka/Nuitka/issues/2742
      #  # --pgo #doesn't seem to work with --standalone
      #  # --quiet
      #  # --standalone  auto enables: --follow-imports but NOT --follow-stdlib    
      #  python3 -m nuitka --onefile --standalone --lto="yes" --static-libpython="yes" --jobs="$(($(nproc)+1))" --include-package="archey.logos" --output-filename="archey" --output-dir="dist" --output-filename="archey" "./archey/__main__.py"
      # Staticx results in a coredumped exe
      # #Pyinstaller
       pyinstaller --clean "./archey/__main__.py" --noconfirm ; rm -rf "$BINDIR/archey"
       #https://github.com/HorlogeSkynet/archey4/tree/master/archey/logos
       pyinstaller --strip --onefile --hidden-import "archey.logos" \
       --hidden-import "archey.logos.alpine" \
       --hidden-import "archey.logos.android" \
       --hidden-import "archey.logos.arch" \
       --hidden-import "archey.logos.armbian" \
       --hidden-import "archey.logos.buildroot" \
       --hidden-import "archey.logos.bunsenlabs" \
       --hidden-import "archey.logos.centos" \
       --hidden-import "archey.logos.crunchbang" \
       --hidden-import "archey.logos.darwin" \
       --hidden-import "archey.logos.debian" \
       --hidden-import "archey.logos.elementary" \
       --hidden-import "archey.logos.endeavouros" \
       --hidden-import "archey.logos.enso" \
       --hidden-import "archey.logos.fedora" \
       --hidden-import "archey.logos.freebsd" \
       --hidden-import "archey.logos.gentoo" \
       --hidden-import "archey.logos.guix" \
       --hidden-import "archey.logos.kali" \
       --hidden-import "archey.logos.linux" \
       --hidden-import "archey.logos.linuxmint" \
       --hidden-import "archey.logos.manjaro" \
       --hidden-import "archey.logos.moevalent" \
       --hidden-import "archey.logos.netbsd" \
       --hidden-import "archey.logos.nixos" \
       --hidden-import "archey.logos.nobara" \
       --hidden-import "archey.logos.openbsd" \
       --hidden-import "archey.logos.opensuse" \
       --hidden-import "archey.logos.parabola" \
       --hidden-import "archey.logos.pop" \
       --hidden-import "archey.logos.quirinux" \
       --hidden-import "archey.logos.raspbian" \
       --hidden-import "archey.logos.rhel" \
       --hidden-import "archey.logos.rocky" \
       --hidden-import "archey.logos.siduction" \
       --hidden-import "archey.logos.slackware" \
       --hidden-import "archey.logos.ubuntu" \
       --hidden-import "archey.logos.univalent" \
       --hidden-import "archey.logos.windows" \
       --collect-submodules="archey" --distpath "./dist" --specpath "./dist" --name archey "./archey/__main__.py" --noconfirm
       #meta
       file "./dist/archey" && du -sh "./dist/archey"
      #StaticX
       staticx --loglevel DEBUG "./dist/archey" --strip "$BINDIR/archey" ; popd >/dev/null 2>&1
      #Test 
       docker run --privileged -it --rm --network="host" -v "$BINDIR:/mnt" "alpine" "/mnt/archey"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#