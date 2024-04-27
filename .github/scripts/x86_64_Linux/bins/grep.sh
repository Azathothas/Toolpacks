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
    #grep : Search one or more input files for lines containing a match to a specified pattern.
     export BIN="grep" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://www.gnu.org/software/grep/" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       #Env
       export ZIG_LIBC_TARGET="x86_64-linux-musl"
       unset CC && export CC="zig cc -target $ZIG_LIBC_TARGET"
       unset CXX && export CXX="zig c++ -target $ZIG_LIBC_TARGET"
       unset DLLTOOL && export DLLTOOL="zig dlltool"
       unset HOST_CC && export HOST_CC="zig cc -target $ZIG_LIBC_TARGET"
       unset HOST_CXX && export HOST_CXX="zig c++ -target $ZIG_LIBC_TARGET"
       unset OBJCOPY && export OBJCOPY="zig objcopy"
       unset RANLIB && export RANLIB="zig ranlib"
       unset CFLAGS && export CFLAGS="-O2 -flto=auto -static -w -pipe ${CFLAGS}"
       unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
       unset LDFLAGS && export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"
       ##PCRE2
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/PCRE2Project/pcre2" && cd "./pcre2"
       #Configure
       bash "./autogen.sh" ; "./configure" --enable-pcre2-16 --enable-pcre2-32 --enable-newline-is-anycrlf --enable-jit --enable-shared="no" --enable-static --disable-shared
       #Make
       make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
       sudo PATH="$PATH" make install
       file "$(which pcre2grep)" ; pcre2grep --version ; popd > /dev/null 2>&1
       ##Grep
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://git.savannah.gnu.org/git/grep.git" && cd "./grep"
       #Configure
       bash "./bootstrap" ; "./configure" --disable-dependency-tracking --enable-threads="isoc+posix"
       make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
       #Meta
       strip "./src/grep" ; file "./src/grep" && du -sh "./src/grep"
       cp "./src/grep" "$BINDIR/grep"
       sudo cp "./src/grep" "$BASEUTILSDIR/grep"
       popd > /dev/null 2>&1
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