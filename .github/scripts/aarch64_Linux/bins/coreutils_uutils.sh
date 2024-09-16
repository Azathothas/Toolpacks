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
   #coreutils_uutils : Cross-platform Rust rewrite of the GNU coreutils
     export BIN="coreutils_uutils" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/uutils/coreutils" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build : No musl: https://github.com/uutils/coreutils/issues/1361
       mkdir -p "$BASEUTILSDIR/coreutils_uutils"
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/uutils/coreutils" && cd "./coreutils"
       export RUST_TARGET="aarch64-unknown-linux-gnu" && rustup target add "$RUST_TARGET"
       export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C prefer-dynamic=no -C embed-bitcode=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
       echo -e "\n[+] Target: $RUST_TARGET\n"
       echo -e "\n[+] Flags: $RUSTFLAGS\n"
       sed "/^\[profile\.release\]/,/^$/d" -i "./Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./Cargo.toml"
       rm rust-toolchain* 2>/dev/null
       #Main Applet
       cargo build --target "$RUST_TARGET" --features unix --release --jobs="$(($(nproc)+1))" --keep-going
       #Single Applet
       cargo build --target "$RUST_TARGET" -p "uu_arch" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_base32" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_base64" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_basename" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_basenc" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_cat" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_chgrp" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_chmod" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_chown" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_chroot" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_cksum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_comm" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_cp" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_csplit" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_cut" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_date" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_dd" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_df" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_dir" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_dircolors" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_dirname" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_du" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_echo" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_env" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_expand" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_expr" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_factor" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_false" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_fmt" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_fold" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_groups" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_hashsum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_head" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_hostid" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_hostname" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_id" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_install" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_join" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_kill" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_link" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_ln" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_logname" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_ls" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_mkdir" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_mkfifo" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_mknod" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_mktemp" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_more" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_mv" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_nice" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_nl" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_nohup" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_nproc" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_numfmt" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_od" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_paste" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_pathchk" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_pinky" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_pr" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_printenv" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_printf" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_ptx" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_pwd" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_readlink" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_realpath" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_rm" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_rmdir" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_seq" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha224sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha256sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha3-224sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha3-256sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha3-" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha3-512sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha3sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sha512sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_shake128sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_shake256sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_shred" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_shuf" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sleep" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sort" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_split" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_stat" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_stdbuf" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_stty" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sum" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_sync" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_tac" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_tail" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_tee" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_test" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_timeout" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_touch" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_tr" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_true" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_truncate" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_tsort" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_tty" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_uname" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_unexpand" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_uniq" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_unlink" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_uptime" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_users" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_vdir" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_wc" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_who" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_whoami" --release --jobs="$(($(nproc)+1))" --keep-going
       cargo build --target "$RUST_TARGET" -p "uu_yes" --release --jobs="$(($(nproc)+1))" --keep-going
      #Copy 
       find "./target/$RUST_TARGET/release" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} rsync -av --copy-links --exclude="*/" "{}" "$BASEUTILSDIR/coreutils_uutils/"
       cp "$BASEUTILSDIR/coreutils_uutils/coreutils" "$BINDIR/coreutils"
      #Strip 
       find "$BASEUTILSDIR/coreutils_uutils/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.ABI-tag" --remove-section=".note.gnu.build-id" --remove-section=".note.stapsdt" "{}" \;
       find "$BASEUTILSDIR/coreutils_uutils" -type f ! -name "*.AppImage" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
      ###Build (Alpine:musl)
      # pushd "$($TMPDIRS)" >/dev/null 2>&1
      # docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
      # docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
      #  bash -c '
      #  #Setup ENV
      #   mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
      #   source "$HOME/.cargo/env"
      #   export RUST_TARGET="x86_64-unknown-linux-musl"
      #   rustup target add "$RUST_TARGET"
      #   export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
      #  #Build
      #   git clone --filter "blob:none" --quiet "https://github.com/uutils/coreutils" && cd "./coreutils"
      #   echo -e "\n[+] Target: $RUST_TARGET\n"
      #   echo -e "\n[+] Flags: $RUSTFLAGS\n"
      #   sed "/^\[profile\.release\]/,/^$/d" -i "./Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./Cargo.toml"
      #   rm rust-toolchain* 2>/dev/null
      #   #Main Applet
      #   cargo build --target "$RUST_TARGET" --features unix --release --jobs="$(($(nproc)+1))" --keep-going
      #   #Single Applet
      #   cargo build --target "$RUST_TARGET" -p "uu_[" -p "uu_arch" -p "uu_b2sum" -p "uu_b3sum" -p "uu_base32" -p "uu_base64" -p "uu_basename" -p "uu_basenc" -p "uu_cat" -p "uu_chgrp" -p "uu_chmod" -p "uu_chown" -p "uu_chroot" -p "uu_cksum" -p "uu_comm" -p "uu_cp" -p "uu_csplit" -p "uu_cut" -p "uu_date" -p "uu_dd" -p "uu_df" -p "uu_dir" -p "uu_dircolors" -p "uu_dirname" -p "uu_du" -p "uu_echo" -p "uu_env" -p "uu_expand" -p "uu_expr" -p "uu_factor" -p "uu_false" -p "uu_fmt" -p "uu_fold" -p "uu_groups" -p "uu_hashsum" -p "uu_head" -p "uu_hostid" -p "uu_hostname" -p "uu_id" -p "uu_install" -p "uu_join" -p "uu_kill" -p "uu_link" -p "uu_ln" -p "uu_logname" -p "uu_ls" -p "uu_md5sum" -p "uu_mkdir" -p "uu_mkfifo" -p "uu_mknod" -p "uu_mktemp" -p "uu_more" -p "uu_mv" -p "uu_nice" -p "uu_nl" -p "uu_nohup" -p "uu_nproc" -p "uu_numfmt" -p "uu_od" -p "uu_paste" -p "uu_pathchk" -p "uu_pinky" -p "uu_pr" -p "uu_printenv" -p "uu_printf" -p "uu_ptx" -p "uu_pwd" -p "uu_readlink" -p "uu_realpath" -p "uu_rm" -p "uu_rmdir" -p "uu_seq" -p "uu_sha1sum" -p "uu_sha224sum" -p "uu_sha256sum" -p "uu_sha3-224sum" -p "uu_sha3-256sum" -p "uu_sha3-" -p "uu_384sum" -p "uu_sha3-512sum" -p "uu_sha384sum" -p "uu_sha3sum" -p "uu_sha512sum" -p "uu_shake128sum" -p "uu_shake256sum" -p "uu_shred" -p "uu_shuf" -p "uu_sleep" -p "uu_sort" -p "uu_split" -p "uu_stat" -p "uu_stdbuf" -p "uu_stty" -p "uu_sum" -p "uu_sync" -p "uu_tac" -p "uu_tail" -p "uu_tee" -p "uu_test" -p "uu_timeout" -p "uu_touch" -p "uu_tr" -p "uu_true" -p "uu_truncate" -p "uu_tsort" -p "uu_tty" -p "uu_uname" -p "uu_unexpand" -p "uu_uniq" -p "uu_unlink" -p "uu_uptime" -p "uu_users" -p "uu_vdir" -p "uu_wc" -p "uu_who" -p "uu_whoami" -p "uu_yes" --release --jobs="$(($(nproc)+1))" --keep-going
      #   find "./target/$RUST_TARGET/release" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} cp --force {} /build-bins/
      #   popd >/dev/null 2>&1
      #  '
      ##Copy 
      # docker cp "alpine-builder:/build-bins/." "$(pwd)/" ; find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath
      #-------------------------------------------------------#
      ##Meta
       file "$BASEUTILSDIR/coreutils_uutils/"*
       #Archive [$BASEUTILSDIR/coreutils_uutils]
       7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR/coreutils_uutils/_coreutils_uutils.7z" "$BASEUTILSDIR/coreutils_uutils" 2>/dev/null
       7z a -ttar -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR/coreutils_uutils/_coreutils_uutils.tar" "$BASEUTILSDIR/coreutils_uutils" 2>/dev/null
       #Generate METADATA
       cd "$BASEUTILSDIR/coreutils_uutils" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs file > "$BASEUTILSDIR/coreutils_uutils/FILE.txt"
       cd "$BASEUTILSDIR/coreutils_uutils" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs b3sum > "$BASEUTILSDIR/coreutils_uutils/BLAKE3SUM.txt"
       cd "$BASEUTILSDIR/coreutils_uutils" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs sha256sum > "$BASEUTILSDIR/coreutils_uutils/SHA256SUM.txt"
       dust --depth 1 --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 --invert-filter "\.7z$|\.gz$|\.jq$|\.json$|\.md$|\.rar$|\.tar$|\.tgz$|\.tmp$|\.txt$|\.upx$|\.yaml$|\.zip$" "$BASEUTILSDIR/coreutils_uutils" | tee "$BASEUTILSDIR/coreutils_uutils/SIZE.txt"
       #rClone
       TMP_METADIR="$(mktemp -d)" && export TMP_METADIR="$TMP_METADIR"
       cd "$BASEUTILSDIR/coreutils_uutils" && rclone sync "." "r2:/bin/aarch64_arm64_Linux/Baseutils/coreutils_uutils/" --exclude="*.jq" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
       curl -qfsSL "https://pub.ajam.dev/utils/devscripts/jq/to_human_bytes.jq" -o "./to_human_bytes.jq"
       #List
       curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/coreutils_uutils.yaml" -o "$TMP_METADIR/temp.yaml"
       yq -r '.bins[]' "$TMP_METADIR/temp.yaml" | sort -u -o "$TMP_METADIR/BINS.txt"
       DESCRIPTION="$(yq -r '.description' $TMP_METADIR/temp.yaml)" && export DESCRIPTION="$DESCRIPTION"
       EXTRA_BINS="$(awk -v bin="$BIN" '$0 != bin' "$TMP_METADIR/BINS.txt" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"
       REPO_URL="$(yq -r '.repo_url' $TMP_METADIR/temp.yaml)" && export REPO_URL="$REPO_URL"
       WEB_URL="$(yq -r '.web_url' $TMP_METADIR/temp.yaml)" && export WEB_URL="$WEB_URL"
       rclone lsjson --fast-list "r2:/bin/aarch64_arm64_Linux/Baseutils/coreutils_uutils/" --exclude="*.7z" --exclude="*.AppImage" --exclude="*.gz" --exclude="*.jq" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="*.tar" --exclude="*.tgz" --exclude="*.tmp" --exclude="*.txt" --exclude="*.upx" --exclude="*.zip" | \
       jq --arg DESCRIPTION "$DESCRIPTION" --arg EXTRA_BINS "$EXTRA_BINS" --arg WEB_URL "$WEB_URL" --arg REPO_URL "$REPO_URL" -r 'include "./to_human_bytes" ; .[] | select(.Size != 0 and .Size != -1 and (.Name | test("\\.(7z|bz2|gz|json|md|rar|tar|tgz|tmp|txt|zip)$") | not)) | {name: (.Name), description: $DESCRIPTION, download_url: "https://bin.ajam.dev/aarch64_arm64_Linux/Baseutils/coreutils_uutils/\(.Path)", size: (.Size | tonumber | bytes), build_date: (.ModTime | split(".")[0]), repo_url: $REPO_URL, web_url: $WEB_URL, extra_bins: $EXTRA_BINS}' | jq -s 'sort_by(.name)' > "$TMP_METADIR/INFO.json"
       for BIN in $(cat "$TMP_METADIR/BINS.txt" | sed 's/"//g'); do
         #Description
          jq --arg BIN "$BIN" --arg DESCRIPTION "$DESCRIPTION" '.[] |= if .name == $BIN then . + {description: $DESCRIPTION} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #Extras (All Bins)
          EXTRA_BINS="$(awk -v bin="$BIN" '$0 != bin' "$TMP_METADIR/BINS.txt" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"  
          jq --arg BIN "$BIN" --arg EXTRA_BINS "$EXTRA_BINS" '.[] |= if .name == $BIN then . + {extra_bins: $EXTRA_BINS} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #BSUM
          B3SUM="$(cat "$BASEUTILSDIR/coreutils_uutils/BLAKE3SUM.txt" | grep --fixed-strings --ignore-case --word-regexp "${BIN}" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | sed 's/|//g' | tr -d '[:space:]')" && export B3SUM="$B3SUM"
          jq --arg BIN "$BIN" --arg B3SUM "$B3SUM" '.[] |= if .name == $BIN then . + {b3sum: $B3SUM} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #SHA256SUM
          SHA256="$(cat "$BASEUTILSDIR/coreutils_uutils/SHA256SUM.txt" | grep --fixed-strings --ignore-case --word-regexp "${BIN}" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | sed 's/|//g' | tr -d '[:space:]')" && export SHA256="$SHA256"
          jq --arg BIN "$BIN" --arg SHA256 "$SHA256" '.[] |= if .name == $BIN then . + {sha256: $SHA256} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #Web URLs
          jq --arg BIN "$BIN" --arg WEB_URL "$WEB_URL" '.[] |= if .name == $BIN then . + {web_url: $WEB_URL} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
       done
       #Upload 
       if jq --exit-status . "$TMP_METADIR/INFO.json" >/dev/null 2>&1; then
          rclone copyto --checksum "$TMP_METADIR/INFO.json" "r2:/bin/aarch64_arm64_Linux/Baseutils/coreutils_uutils/INFO.json" --check-first --checkers 2000 --transfers 1000 --user-agent="$USER_AGENT"
       fi
       unset TMP_METADIR B3SUM DESCRIPTION EXTRA_BINS REPO_URL SHA256 WEB_URL
       find "$BASEUTILSDIR" -type f -size 0 -delete ; popd >/dev/null 2>&1
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