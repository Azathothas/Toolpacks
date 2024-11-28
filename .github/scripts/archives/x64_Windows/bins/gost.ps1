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
  #gost : 🤖 Output text together with randomly generated ASCII robots in colors inspired by synthwave/rainbows
    $env:BIN = "gost" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://github.com/ginuerzh/gost" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Build
      Push-Location (& $TMPDIRS) ; git clone --quiet --filter "blob:none" "https://github.com/ginuerzh/gost" ; Set-Location ".\gost" ; (Resolve-Path ".\").Path
      $env:GOOS = "windows" ; $env:GOARCH = "amd64" ; $env:CGO_ENABLED = "0"
      Remove-Item ".\go.mod" -ErrorAction SilentlyContinue
      go mod init "github.com/ginuerzh/gost" ; go mod tidy
      go build -v -ldflags="-buildid= -s -w -extldflags '-static'" ".\cmd\gost" ; Copy-Item "./gost.exe" "$env:BINDIR/gost.exe" 
      file.exe "./gost.exe" ; (Get-Item -Path "./gost.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
      #objdump.exe -x "./gost.exe" | Select-String "DLL Name:"
      wldd.exe "./gost.exe" | Sort-Object -Unique
      go clean -cache -fuzzcache -modcache -testcache ; Pop-Location
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