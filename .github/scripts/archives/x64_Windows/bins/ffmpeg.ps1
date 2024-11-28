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
   #ffmpeg : A complete, cross-platform solution to record, convert and stream audio and video. 
    $env:BIN = "ffmpeg" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://ffmpeg.org" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     #eget "https://github.com/eugeneware/ffmpeg-static" --asset "ffmpeg" --asset "win" --asset "x64" --asset "gz" --to "$env:BINDIR/ffmpeg.exe"
     #eget "https://github.com/eugeneware/ffmpeg-static" --asset "ffprobe" --asset "win" --asset "x64" --asset "gz" --to "$env:BINDIR/ffprobe.exe" 
     Push-Location (& $TMPDIRS)
     eget "https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z" --download-only --to "./ffmpeg.7z" ; 7z x "./ffmpeg.7z"
     Set-Location (Get-ChildItem -Directory | Select-Object -First 1).FullName
     Copy-Item ".\bin\ffmpeg.exe" "$env:BINDIR\ffmpeg.exe"
     Copy-Item ".\bin\ffplay.exe" "$env:BINDIR\ffplay.exe"
     Copy-Item ".\bin\ffprobe.exe" "$env:BINDIR\ffprobe.exe"
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