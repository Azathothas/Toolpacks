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
  #inscope : filtering URLs and domains supplied on stdin to make sure they meet one of a set of regular expressions
    $env:BIN = "inscope" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "hhttps://github.com/Azathothas/Arsenal" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Build
      Push-Location (& $TMPDIRS)
      curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/inscope/main.go"
      go mod init "github.com/Azathothas/Arsenal/inscope" ; go mod tidy
      $env:GOOS = "windows" ; $env:GOARCH = "amd64" ; $env:CGO_ENABLED = "0"
      go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -o "./inscope.exe" ; Copy-Item "./inscope.exe" "$env:BINDIR/inscope.exe"
      file.exe "./inscope.exe" ; (Get-Item -Path "./inscope.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
      objdump.exe -x "./inscope.exe" | Select-String "DLL Name:"
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