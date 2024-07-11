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
   #legba: A multiprotocol credentials bruteforcer / password sprayer and enumerator. 🥷
    $env:BIN = "legba" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://github.com/evilsocket/legba" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Build
      Push-Location (& $TMPDIRS) ; git clone --quiet --filter "blob:none" "https://github.com/evilsocket/legba" ; Set-Location "./legba" ; (Resolve-Path ".\").Path
      $env:RUST_TARGET = "x86_64-pc-windows-msvc" ; rustup target add "$env:RUST_TARGET"
      $env:RUSTFLAGS = "-C target-feature=+crt-static -C default-linker-libraries=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
      Remove-Item "./rust-toolchain.toml" -ErrorAction SilentlyContinue
      (Get-Content -Path "./Cargo.toml" -Raw) -replace "(?s)\[profile\.release\].*?(?=\n\[|$)", "" | Set-Content -Path "./Cargo.toml" ; Add-Content "./Cargo.toml" "[profile.release]`nstrip = true`nopt-level = 3`nlto = true"
      #Features : cargo metadata --no-deps --format-version 1 | jq -r ".packages[0].features | keys[]"
      #         : cargo metadata --no-deps --format-version 1 | jq ".packages[0].features | to_entries[]" | less
      #Excluded : mqtt ( https://github.com/eclipse/paho.mqtt.rust/issues?q=is%3Aissue+is%3Aopen+windows ) ; oracle samba (breaks, unable to find libs)
      #cargo build --target "$env:RUST_TARGET" --all-features --release --jobs="$(Invoke-Expression "[int]$env:NUMBER_OF_PROCESSORS + 1")" --keep-going
      cargo build --target "$env:RUST_TARGET" --no-default-features --features "amqp dns ftp http http_relative_paths imap kerberos ldap mongodb mssql pop3 rdp redis scylla smtp socks5 sql ssh stomp tcp_ports telnet vnc" --release --jobs="$(Invoke-Expression "[int]$env:NUMBER_OF_PROCESSORS + 1")" --keep-going
      Copy-Item "./target/$env:RUST_TARGET/release/legba.exe" "$env:BINDIR/legba.exe"
      file.exe "./target/$env:RUST_TARGET/release/legba.exe" ; (Get-Item -Path "./target/$env:RUST_TARGET/release/legba.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
      #objdump.exe -x "./target/$env:RUST_TARGET/release/legba.exe" | Select-String "DLL Name:" 
      wldd.exe "./target/$env:RUST_TARGET/release/legba.exe" | Sort-Object -Unique
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