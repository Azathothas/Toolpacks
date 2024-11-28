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
   #openssh : SSH for Windows
    $env:BIN = "openssh" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://github.com/PowerShell/Win32-OpenSSH" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "scp.exe" --to "$env:BINDIR\scp.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "sftp.exe" --to "$env:BINDIR\scp.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "sftp-server.exe" --to "$env:BINDIR\sftp-server.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "sshd.exe" --to "$env:BINDIR\sshd.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-pkcs11-helper.exe" --to "$env:BINDIR\ssh-pkcs11-helper.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-sk-helper.exe" --to "$env:BINDIR\ssh-sk-helper.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-keygen.exe" --to "$env:BINDIR\ssh-keygen.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-shellhost.exe" --to "$env:BINDIR\ssh-shellhost.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh.exe" --to "$env:BINDIR\ssh.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-add.exe" --to "$env:BINDIR\ssh-add.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-agent.exe" --to "$env:BINDIR\ssh-agent.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --file "ssh-keyscan.exe" --to "$env:BINDIR\ssh-keyscan.exe"
     eget "$env:SOURCE_URL" --asset "Win64.zip" --asset "^Symbols" --download-only --to "$env:BINDIR\openssh.zip"
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