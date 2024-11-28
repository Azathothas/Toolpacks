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
   #7z: file archiver with a high compression ratio.
    $env:BIN = "7z" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://www.7-zip.org" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     Push-Location (& $TMPDIRS)
     $7Z_DL = (Invoke-WebRequest -Uri "https://www.7-zip.org/download.html" -UserAgent ((Invoke-WebRequest -Uri "https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt").Content.Trim())).Content -split "`r`n" | ForEach-Object { if ($_ -match 'href="([^"]+)"') { $matches[1] } } | Select-String -Pattern '(.*?extra.*?7z)' -AllMatches | Sort-Object {$_ -as [version]} | Select-Object -First 1 ; $env:7Z_DL = "$7Z_DL"
     $EGET_LINK = "https://www.7-zip.org/$env:7Z_DL" ; $env:EGET_LINK = "$EGET_LINK"
     eget "$env:EGET_LINK" --download-only --to "./7z-bins.7z" ; 7z x "./7z-bins.7z"
     Copy-Item ".\x64\7za.exe" "$env:BINDIR\7z.exe" ; Pop-Location
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