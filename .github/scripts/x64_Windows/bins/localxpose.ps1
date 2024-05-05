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
   #localxpose : reverse proxy that enables you to expose your localhost to the internet.
    $env:BIN = "localxpose" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://localxpose.io/" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch
     Push-Location (& $TMPDIRS) ; curl -qfsSLJO "https://loclx-client.s3.amazonaws.com/loclx-windows-amd64.zip" -A "$env:USER_AGENT"
     Get-ChildItem -Path "." -File -Filter '*.zip' | ForEach-Object { Expand-Archive -Path $_.FullName -DestinationPath "." -Force }
     Get-ChildItem -Path "." -File -Filter '*.zip' | ForEach-Object { Remove-Item $_.FullName -Force }
     Get-ChildItem -Path "." -File -Filter 'loclx*' | ForEach-Object { $_ | Move-Item -Destination "$env:BINDIR\loclx.exe" -Force }
     Copy-Item "$env:BINDIR\loclx.exe" "$env:BINDIR\localxpose.exe" -Force
     file.exe "$env:BINDIR\loclx.exe" ; (Get-Item -Path "$env:BINDIR\loclx.exe").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
     wldd.exe "$env:BINDIR\loclx.exe" | Sort-Object -Unique
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