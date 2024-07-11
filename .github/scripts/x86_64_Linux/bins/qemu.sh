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
    #qemu: machine & userspace emulator and virtualizer
     export BIN="qemu" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/qemu/qemu" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/ziglang/qemu-static" && cd "./qemu-static"
       #Get latest versions: https://download.qemu.org/
       QEMU_LATEST="$(git ls-remote https://github.com/qemu/qemu | awk '{print $2}' | grep "refs/tags/" | grep -v '[{}]' |  cut -d '/' -f 3 | sed 's/\^{}$//' | sed 's/^v//' | tail -n 1 | tr -d '[:space:]')" && export QEMU_LATEST="${QEMU_LATEST}"
       echo -e "\n[+] Qemu Version: ${QEMU_LATEST}\n"
       #Replace
       #sed -i 's/FROM alpine:.*/FROM alpine:latest/g' "./Dockerfile"
       sed -i "s/QEMU_REV=\"[^\"]*\"/QEMU_REV=\"${QEMU_LATEST}\"/g" "./command/base"
       #sed -i "s/QEMU_REV=\"[^\"]*\"/QEMU_REV=\"9.0.0\"/g" "./command/base"
       #Build
       docker build --tag qemu "./" && rm -rf "./artifact" 2>/dev/null ; mkdir -p "./artifact"
       docker run -it --cidfile="qemu.cid" qemu true
       docker cp "$(cat qemu.cid):work/artifact/." "./artifact/."
       docker container rm "$(cat qemu.cid)" ; rm "./qemu.cid" ; docker image rm "qemu"
       #Extract
       find "./artifact" -type f -name '*.xz' -exec tar -xvf {} --strip-components="1" \;
       #Meta
       strip "./bin/"* ; file "./bin/"* && du -sh "./bin/"*
       cp "./bin/qemu-aarch64" "$BINDIR/qemu-aarch64-static"
       cp "./bin/qemu-aarch64_be" "$BINDIR/qemu-aarch64_be-static"
       cp "./bin/qemu-alpha" "$BINDIR/qemu-alpha-static"
       cp "./bin/qemu-arm" "$BINDIR/qemu-arm-static"
       cp "./bin/qemu-armeb" "$BINDIR/qemu-armeb-static"
       cp "./bin/qemu-cris" "$BINDIR/qemu-cris-static"
       cp "./bin/qemu-hexagon" "$BINDIR/qemu-hexagon-static"
       cp "./bin/qemu-hppa" "$BINDIR/qemu-hppa-static"
       cp "./bin/qemu-i386" "$BINDIR/qemu-i386-static"
       cp "./bin/qemu-loongarch64" "$BINDIR/qemu-loongarch64-static"
       cp "./bin/qemu-m68k" "$BINDIR/qemu-m68k-static"
       cp "./bin/qemu-microblaze" "$BINDIR/qemu-microblaze-static"
       cp "./bin/qemu-microblazeel" "$BINDIR/qemu-microblazeel-static"
       cp "./bin/qemu-mips" "$BINDIR/qemu-mips-static"
       cp "./bin/qemu-mips64" "$BINDIR/qemu-mips64-static"
       cp "./bin/qemu-mips64el" "$BINDIR/qemu-mips64el-static"
       cp "./bin/qemu-mipsel" "$BINDIR/qemu-mipsel-static"
       cp "./bin/qemu-mipsn32" "$BINDIR/qemu-mipsn32-static"
       cp "./bin/qemu-mipsn32el" "$BINDIR/qemu-mipsn32el-static"
       cp "./bin/qemu-nios2" "$BINDIR/qemu-nios2-static"
       cp "./bin/qemu-or1k" "$BINDIR/qemu-or1k-static"
       cp "./bin/qemu-ppc" "$BINDIR/qemu-ppc-static"
       cp "./bin/qemu-ppc64" "$BINDIR/qemu-ppc64-static"
       cp "./bin/qemu-ppc64le" "$BINDIR/qemu-ppc64le-static"
       cp "./bin/qemu-riscv32" "$BINDIR/qemu-riscv32-static"
       cp "./bin/qemu-riscv64" "$BINDIR/qemu-riscv64-static"
       cp "./bin/qemu-s390x" "$BINDIR/qemu-s390x-static"
       cp "./bin/qemu-sh4" "$BINDIR/qemu-sh4-static"
       cp "./bin/qemu-sh4eb" "$BINDIR/qemu-sh4eb-static"
       cp "./bin/qemu-sparc" "$BINDIR/qemu-sparc-static"
       cp "./bin/qemu-sparc32plus" "$BINDIR/qemu-sparc32plus-static"
       cp "./bin/qemu-sparc64" "$BINDIR/qemu-sparc64-static"
       cp "./bin/qemu-x86_64" "$BINDIR/qemu-x86_64-static"
       cp "./bin/qemu-xtensa" "$BINDIR/qemu-xtensa-static"
       cp "./bin/qemu-xtensaeb" "$BINDIR/qemu-xtensaeb-static"
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