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
  #picocrypt : A very small, very simple, yet very secure encryption tool.
    $env:BIN = "picocrypt"
    $env:SOURCE_URL = "https://github.com/Picocrypt/Picocrypt"
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Build GUI
      Push-Location (& $TMPDIRS) ; git clone --quiet --filter "blob:none" "https://github.com/Picocrypt/Picocrypt" ; Set-Location "./Picocrypt/src/" ; (Resolve-Path ".\").Path
      $env:GOOS = "windows" ; $env:GOARCH = "amd64" ; $env:CGO_ENABLED = "1"
      go build -v -ldflags="-buildid= -s -w -H=windowsgui -extldflags '-static'" -o "./picocrypt-gui.exe" "./Picocrypt.go" ; Copy-Item "./picocrypt-gui.exe" "$env:BINDIR/picocrypt-gui.exe"
      file.exe "./picocrypt-gui.exe" ; (Get-Item -Path "./picocrypt-gui.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
      wldd.exe "./picocrypt-gui.exe" | Sort-Object -Unique
      go clean -cache -fuzzcache -modcache -testcache ; Pop-Location
    ##Build CLI
    #  Push-Location (& $TMPDIRS) ; git clone --quiet --filter "blob:none" "https://github.com/Picocrypt/CLI" ; Set-Location "./CLI/picocrypt/" ; (Resolve-Path ".\").Path
    #  $env:GOOS = "windows" ; $env:GOARCH = "amd64" ; $env:CGO_ENABLED = "0"
    #  go build -v -ldflags="-buildid= -s -w -H=windowsgui -extldflags '-static'" -o "./picocrypt-cli.exe" ; Copy-Item "./picocrypt-cli.exe" "$env:BINDIR/picocrypt-cli.exe"
    #  file.exe "./picocrypt-cli.exe" ; (Get-Item -Path "./picocrypt-cli.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
    #  wldd.exe "./picocrypt-cli.exe" | Sort-Object -Unique
    #  go clean -cache -fuzzcache -modcache -testcache ; Pop-Location
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