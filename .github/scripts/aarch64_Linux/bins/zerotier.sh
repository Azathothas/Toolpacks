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
    #ZeroTierOne : A Smart Ethernet Switch for Earth
     export BIN="ZeroTierOne" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/zerotier/ZeroTierOne" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins" ; source "$HOME/.cargo/env"
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/zerotier/ZeroTierOne" && cd "./ZeroTierOne"
         export CFLAGS="-O2 -flto=auto -static -w -pipe"
         export CXXFLAGS="${CFLAGS}" ; export CPPFLAGS="${CFLAGS}"
         export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none"
         #rustup target add "aarch64-unknown-linux-musl"
         export RUSTFLAGS="-C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
         sed "/^\[profile\.release\]/,/^$/d" -i "./rustybits/Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./rustybits/Cargo.toml"
         make ZT_STATIC=1 CFLAGS="${CFLAGS}" CXXFLAGS="${CFLAGS}" CPPFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" --jobs="$(($(nproc)+1))" --keep-going
        #Copy
         rsync -av --copy-links --checksum "./zerotier-cli" "/build-bins/zerotier-cli"
         rsync -av --copy-links --checksum "./zerotier-idtool" "/build-bins/zerotier-idtool"
         rsync -av --copy-links --checksum "./zerotier-one" "/build-bins/zerotier-one"
        #strip & info
         find "/build-bins" -type f -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         find "/build-bins" -type f -exec file {} \; 2>/dev/null
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/." "./"
       #Meta
       file "./zerotier-cli" && du -sh "./zerotier-cli" ; cp "./zerotier-cli" "$BINDIR/zerotier-cli"
       file "./zerotier-idtool" && du -sh "./zerotier-idtool" ; cp "./zerotier-idtool" "$BINDIR/zerotier-idtool"
       file "./zerotier-one" && du -sh "./zerotier-one" ; cp "./zerotier-one" "$BINDIR/zerotier-one"
      #Service Files
       ## Location: /lib/systemd/system/zerotier-one.service
       ## Requires: zerotier-one bins to be installed in /usr/sbin/zerotier-one
       ## Requires: /dev/net/tun ( cap_add: [net_admin, sys_module] || devices: [/dev/net/tun:/dev/net/tun])
       curl -qfsSL "https://raw.githubusercontent.com/zerotier/ZeroTierOne/dev/debian/zerotier-one.service" -o "$BINDIR/zerotier-one_systemd_service"
       ##Firewall: https://github.com/zerotier/ZeroTierOne/blob/dev/debian/ufw-zerotier-one (9993/udp)
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