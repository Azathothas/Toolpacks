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
   #ngrok: External Tunnel to Internal Assets
    $env:BIN = "ngrok" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://ngrok.com/" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     $EGET_LINK = (Invoke-WebRequest -Uri "https://ngrok.com/download" -UserAgent ((Invoke-WebRequest -Uri "https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt").Content.Trim())).Content -split "`r`n" | Select-String -Pattern '(https://bin.equinox.io/.*?windows.*?amd64.*?zip)' -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value } | Sort-Object {$_ -as [version]} | Select-Object -First 1 ; $env:EGET_LINK = "$EGET_LINK"
     eget "$env:EGET_LINK" --to "$env:BINDIR/ngrok.exe"
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