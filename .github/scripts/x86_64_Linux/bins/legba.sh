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
export SKIP_BUILD="YES" #/usr/bin/ld: cannot find -lsmbclient
if [ "$SKIP_BUILD" == "NO" ]; then
      #legba: A multiprotocol credentials bruteforcer / password sprayer and enumerator. 🥷    
     export BIN="legba" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/evilsocket/legba" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Install deps
         apk upgrade --available --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main"
         apk add samba-client --latest --upgrade --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main" --no-interactive
         apk add samba-client-libs --latest --upgrade --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main" --no-interactive
         apk add samba-dev --latest --upgrade --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main" --no-interactive
         apk add samba-libs --latest --upgrade --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main" --no-interactive
         apk add libsmbclient --latest --upgrade --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main" --no-interactive
         apk add libssl3 --latest --upgrade --no-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/main" --no-interactive
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
         source "$HOME/.cargo/env"
         export RUST_TARGET="x86_64-unknown-linux-musl"
         rustup target add "$RUST_TARGET"
         export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
        #Build
         git clone --quiet --filter "blob:none" --quiet "https://github.com/evilsocket/legba" && cd "./legba"
         echo -e "\n[+] Target: $RUST_TARGET\n"
         echo -e "\n[+] Flags: $RUSTFLAGS\n"
         sed "/^\[profile\.release\]/,/^$/d" -i "./Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./Cargo.toml"
         rm rust-toolchain* 2>/dev/null
         #Features : cargo metadata --no-deps --format-version 1 | jq -r ".packages[0].features | keys[]"
         #         : cargo metadata --no-deps --format-version 1 | jq ".packages[0].features | to_entries[]" | less
         #Excluded : oracle samba (breaks, unable to find libs)
         #cargo build --target "$RUST_TARGET" --all-features --release --jobs="$(($(nproc)+1))" --keep-going
         cargo build --target "$RUST_TARGET" --no-default-features --features "amqp dns ftp http http_relative_paths imap kerberos ldap mongodb mqtt mssql pop3 rdp redis scylla smtp socks5 sql ssh stomp tcp_ports telnet vnc" --release --jobs="$(($(nproc)+1))" --keep-going
         cp "./target/$RUST_TARGET/release/legba" "/build-bins/legba"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/legba" "./legba"
       #Meta 
       file "./legba" && du -sh "./legba"
       cp "./legba" "$BINDIR/legba"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
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