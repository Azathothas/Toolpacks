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
   #gitoxide: file archiver with a high compression ratio.
    $env:BIN = "gitoxide" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://github.com/Byron/gitoxide" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     $LATEST_VTAG = (Invoke-RestMethod -Uri "https://api.github.com/repos/Byron/gitoxide/releases?per_page=100").tag_name | Where-Object { $_ -like 'v*' } | Sort-Object {$_ -as [version]} | Select-Object -First 1 ; $env:LATEST_VTAG = "$LATEST_VTAG"
     #ein : High level commands, porcelain, for every-day use, optimized for a pleasant user experience
     eget "$env:SOURCE_URL" --tag "$env:LATEST_VTAG" --asset "windows" --asset "x86_64" --asset "msvc" --asset "zip" --asset "max" --asset "^pure" --file "ein.exe" --to "$env:BINDIR\ein.exe"
     #gix : low level commands & plumbing, for use in more specialized cases and to validate newly written code in real-world scenarios
     eget "$env:SOURCE_URL" --tag "$env:LATEST_VTAG" --asset "windows" --asset "x86_64" --asset "msvc" --asset "zip" --asset "max" --asset "^pure" --file "gix.exe" --to "$env:BINDIR\gix.exe"
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