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
    #php : Standalone PHP binary
     export BIN="php"
     export SOURCE_URL="https://github.com/crazywhalecc/static-php-cli"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch (cli)
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && curl -A "$USER_AGENT" -qfsSLJO "https://dl.static-php.dev/static-php-cli/bulk/$(curl -qfsSL "https://dl.static-php.dev/static-php-cli/bulk/" | grep -oP 'href="\K[^"]*\.tar\.gz' | grep -i 'linux' | grep -i 'x86_64' | grep -i cli | sort --version-sort | tail -n 1)"
       find . -type f -name '*.tar.gz' -exec tar -xzvf {} \; && find . -type f -name '*.tar.gz' -exec rm -rf {} \;
       find . -type f -name '*php*' -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; >/dev/null 2>&1
       find . -type f -name '*php*' ! -name '*.*' -exec mv {} "$BINDIR/php" \;
       find . -type f -name '*php*' ! -name '*.*' -exec mv {} "$BINDIR/php-cli" \;
       file "$BINDIR/php" && du -sh "$BINDIR/php"
       timeout -k 10 20 docker run --privileged -it --rm --network="bridge" -v "$BINDIR:/mnt" "alpine" "/mnt/php" --version
       popd >/dev/null 2>&1
      #Fetch (fpm)
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && curl -A "$USER_AGENT" -qfsSLJO "https://dl.static-php.dev/static-php-cli/bulk/$(curl -qfsSL "https://dl.static-php.dev/static-php-cli/bulk/" | grep -oP 'href="\K[^"]*\.tar\.gz' | grep -i 'linux' | grep -i 'x86_64' | grep -i fpm | sort --version-sort | tail -n 1)"
       find . -type f -name '*.tar.gz' -exec tar -xzvf {} \; && find . -type f -name '*.tar.gz' -exec rm -rf {} \;
       find . -type f -name '*fpm*' -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; >/dev/null 2>&1
       find . -type f -executable -name '*fpm*' -exec mv {} "$BINDIR/php-fpm" \;
       file "$BINDIR/php-fpm" && du -sh "$BINDIR/php-fpm"
       timeout -k 10 20 docker run --privileged -it --rm --network="bridge" -v "$BINDIR:/mnt" "alpine" "/mnt/php-fpm" --version
       popd >/dev/null 2>&1
      #Fetch (micro)
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && curl -A "$USER_AGENT" -qfsSLJO "https://dl.static-php.dev/static-php-cli/bulk/$(curl -qfsSL "https://dl.static-php.dev/static-php-cli/bulk/" | grep -oP 'href="\K[^"]*\.tar\.gz' | grep -i 'linux' | grep -i 'x86_64' | grep -i micro | sort --version-sort | tail -n 1)"
       find . -type f -name '*.tar.gz' -exec tar -xzvf {} \; && find . -type f -name '*.tar.gz' -exec rm -rf {} \;
       find . -type f -name '*micro*' -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; >/dev/null 2>&1
       find . -type f -executable -name '*micro*' -exec mv {} "$BINDIR/php-micro" \;
       file "$BINDIR/php-micro" && du -sh "$BINDIR/php-micro"
       timeout -k 10 20 docker run --privileged -it --rm --network="bridge" -v "$BINDIR:/mnt" "alpine" "/mnt/php-micro" --version
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