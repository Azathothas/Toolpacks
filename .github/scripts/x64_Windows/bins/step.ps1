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
   #step : 🧰 A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc. 
    $env:BIN = "step" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://github.com/smallstep/cli" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     Push-Location (& $TMPDIRS)
     $EGET_OUT = & { eget "$env:SOURCE_URL" --asset "windows" --asset "amd64" --asset "zip" --asset "^sha" --asset "^pem" --asset "^sig" --asset "^0" --file "step.exe" --to "$env:TEMP" } 2>&1 ; $env:EGET_OUT = "$EGET_OUT"
     $EGET_LINK = "$env:EGET_OUT" | Select-String -Pattern 'https://github\.com/[^ ]+' -AllMatches | ForEach-Object { $_.Matches.Value } ; $env:EGET_LINK = "$EGET_LINK"
     eget "$env:EGET_LINK" --file "step.exe" --to "$env:BINDIR/step.exe"
     Pop-Location
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