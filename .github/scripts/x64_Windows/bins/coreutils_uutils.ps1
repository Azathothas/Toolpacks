#-------------------------------------------------------#
#Sanity Checks
if (
    ($env:BUILD -ne "YES") -or
    ([string]::IsNullOrEmpty($env:BINDIR)) -or
    ([string]::IsNullOrEmpty($env:EGET_EXCLUDE)) -or
    ([string]::IsNullOrEmpty($env:EGET_TIMEOUT)) -or
    ([string]::IsNullOrEmpty($env:GIT_TERMINAL_PROMPT)) -or
    ([string]::IsNullOrEmpty($env:GIT_ASKPASS)) -or
    ([string]::IsNullOrEmpty($env:GITHUB_TOKEN)) -or
    ([string]::IsNullOrEmpty($env:SYSTMP)) -or
    ([string]::IsNullOrEmpty($env:TMPDIRS))
) {
    #exit
    Write-Output "`n[+]Skipping Builds...`n"
    exit 1
}
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
$env:SKIP_BUILD = "NO" # YES, in case of deleted repos, broken builds etc
if ($env:SKIP_BUILD -eq "NO") {
   #coreutils: Cross-platform Rust rewrite of the GNU coreutils   
    $env:BIN = "coreutils" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://github.com/uutils/coreutils" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Build
      Push-Location (& $TMPDIRS) ; git clone --quiet --filter "blob:none" "https://github.com/uutils/coreutils" ; Set-Location "./coreutils" ; (Resolve-Path ".\").Path
      $env:RUST_TARGET = "x86_64-pc-windows-msvc" ; rustup target add "$env:RUST_TARGET"
      $env:RUSTFLAGS = "-C target-feature=+crt-static -C default-linker-libraries=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
      (Get-Content -Path "./Cargo.toml" -Raw) -replace "(?s)\[profile\.release\].*?(?=\n\[|$)", "" | Set-Content -Path "./Cargo.toml" ; Add-Content "./Cargo.toml" "[profile.release]`nstrip = true`nopt-level = 3`nlto = true"
      #multicall
      cargo build --target "$env:RUST_TARGET" --features "windows" --release --jobs "$(Invoke-Expression "[int]$env:NUMBER_OF_PROCESSORS + 1")" --keep-going
      Copy-Item "./target/$env:RUST_TARGET/release/coreutils.exe" "$env:BINDIR/coreutils.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/coreutils.exe" "$env:BINDIR/coreutils-rs.exe"
      file.exe "./target/$env:RUST_TARGET/release/coreutils.exe" ; (Get-Item -Path "./target/$env:RUST_TARGET/release/coreutils.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
      #objdump.exe -x "./target/$env:RUST_TARGET/release/coreutils.exe" | Select-String "DLL Name:"
      wldd.exe "./target/$env:RUST_TARGET/release/coreutils.exe" | Sort-Object -Unique
      #single utils
      cargo build --target "$env:RUST_TARGET" -p "uu_arch" -p "uu_base32" -p "uu_base64" -p "uu_basename" -p "uu_basenc" -p "uu_cat" -p "uu_cksum" -p "uu_comm" -p "uu_cp" -p "uu_csplit" -p "uu_cut" -p "uu_date" -p "uu_dd" -p "uu_df" -p "uu_dir" -p "uu_dircolors" -p "uu_dirname" -p "uu_du" -p "uu_echo" -p "uu_env" -p "uu_expand" -p "uu_expr" -p "uu_factor" -p "uu_false" -p "uu_fmt" -p "uu_fold" -p "uu_hashsum" -p "uu_head" -p "uu_hostname" -p "uu_join" -p "uu_link" -p "uu_ln" -p "uu_ls" -p "uu_mkdir" -p "uu_mktemp" -p "uu_more" -p "uu_mv" -p "uu_nl" -p "uu_nproc" -p "uu_numfmt" -p "uu_od" -p "uu_paste" -p "uu_pr" -p "uu_printenv" -p "uu_printf" -p "uu_ptx" -p "uu_pwd" -p "uu_readlink" -p "uu_realpath" -p "uu_rm" -p "uu_rmdir" -p "uu_seq" -p "uu_shred" -p "uu_shuf" -p "uu_sleep" -p "uu_sort" -p "uu_split" -p "uu_sum" -p "uu_sync" -p "uu_tac" -p "uu_tail" -p "uu_tee" -p "uu_test" -p "uu_touch" -p "uu_tr" -p "uu_true" -p "uu_truncate" -p "uu_tsort" -p "uu_uname" -p "uu_unexpand" -p "uu_uniq" -p "uu_unlink" -p "uu_vdir" -p "uu_wc" -p "uu_whoami" -p "uu_yes" --release --jobs "$(Invoke-Expression "[int]$env:NUMBER_OF_PROCESSORS + 1")" --keep-going
      Copy-Item "./target/$env:RUST_TARGET/release/arch.exe" "$env:BINDIR/arch.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/base32.exe" "$env:BINDIR/base32.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/base64.exe" "$env:BINDIR/base64.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/basename.exe" "$env:BINDIR/basename.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/basenc.exe" "$env:BINDIR/basenc.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/cat.exe" "$env:BINDIR/cat.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/cksum.exe" "$env:BINDIR/cksum.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/comm.exe" "$env:BINDIR/comm.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/cp.exe" "$env:BINDIR/cp.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/csplit.exe" "$env:BINDIR/csplit.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/cut.exe" "$env:BINDIR/cut.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/date.exe" "$env:BINDIR/date.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/dd.exe" "$env:BINDIR/dd.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/df.exe" "$env:BINDIR/df.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/dir.exe" "$env:BINDIR/dir.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/dircolors.exe" "$env:BINDIR/dircolors.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/dirname.exe" "$env:BINDIR/dirname.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/du.exe" "$env:BINDIR/du.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/echo.exe" "$env:BINDIR/echo.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/env.exe" "$env:BINDIR/env.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/expand.exe" "$env:BINDIR/expand.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/expr.exe" "$env:BINDIR/expr.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/factor.exe" "$env:BINDIR/factor.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/false.exe" "$env:BINDIR/false.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/fmt.exe" "$env:BINDIR/fmt.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/fold.exe" "$env:BINDIR/fold.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/hashsum.exe" "$env:BINDIR/hashsum.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/head.exe" "$env:BINDIR/head.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/hostname.exe" "$env:BINDIR/hostname.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/join.exe" "$env:BINDIR/join.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/link.exe" "$env:BINDIR/link.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/ln.exe" "$env:BINDIR/ln.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/ls.exe" "$env:BINDIR/ls.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/mkdir.exe" "$env:BINDIR/mkdir.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/mktemp.exe" "$env:BINDIR/mktemp.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/more.exe" "$env:BINDIR/more.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/mv.exe" "$env:BINDIR/mv.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/nl.exe" "$env:BINDIR/nl.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/nproc.exe" "$env:BINDIR/nproc.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/numfmt.exe" "$env:BINDIR/numfmt.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/od.exe" "$env:BINDIR/od.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/paste.exe" "$env:BINDIR/paste.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/pr.exe" "$env:BINDIR/pr.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/printenv.exe" "$env:BINDIR/printenv.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/printf.exe" "$env:BINDIR/printf.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/ptx.exe" "$env:BINDIR/ptx.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/pwd.exe" "$env:BINDIR/pwd.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/readlink.exe" "$env:BINDIR/readlink.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/realpath.exe" "$env:BINDIR/realpath.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/rm.exe" "$env:BINDIR/rm.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/rmdir.exe" "$env:BINDIR/rmdir.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/seq.exe" "$env:BINDIR/seq.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/shred.exe" "$env:BINDIR/shred.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/shuf.exe" "$env:BINDIR/shuf.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/sleep.exe" "$env:BINDIR/sleep.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/sort.exe" "$env:BINDIR/sort.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/split.exe" "$env:BINDIR/split.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/sum.exe" "$env:BINDIR/sum.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/sync.exe" "$env:BINDIR/sync.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/tac.exe" "$env:BINDIR/tac.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/tail.exe" "$env:BINDIR/tail.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/tee.exe" "$env:BINDIR/tee.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/test.exe" "$env:BINDIR/test.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/touch.exe" "$env:BINDIR/touch.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/tr.exe" "$env:BINDIR/tr.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/true.exe" "$env:BINDIR/true.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/truncate.exe" "$env:BINDIR/truncate.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/tsort.exe" "$env:BINDIR/tsort.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/uname.exe" "$env:BINDIR/uname.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/unexpand.exe" "$env:BINDIR/unexpand.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/uniq.exe" "$env:BINDIR/uniq.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/unlink.exe" "$env:BINDIR/unlink.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/vdir.exe" "$env:BINDIR/vdir.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/wc.exe" "$env:BINDIR/wc.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/whoami.exe" "$env:BINDIR/whoami.exe"
      Copy-Item "./target/$env:RUST_TARGET/release/yes.exe" "$env:BINDIR/yes.exe"
      cargo clean ; Pop-Location
}
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
Remove-Item "Env:\SKIP_BUILD" -ErrorAction SilentlyContinue ; $env:BUILT = "YES"
#In case of zig polluted env
Remove-Item "Env:\AR","Env:\CC","Env:\CFLAGS","Env:\CXX","Env:\CXXFLAGS","Env:\DLLTOOL","Env:\HOST_CC","Env:\HOST_CXX","Env:\LDFLAGS","Env:\LIBS","Env:\OBJCOPY","Env:\RANLIB" -ErrorAction SilentlyContinue
#In case of go polluted env
Remove-Item "Env:\GOARCH","Env:\GOOS","Env:\CGO_ENABLED","Env:\CGO_CFLAGS" -ErrorAction SilentlyContinue
#-------------------------------------------------------#