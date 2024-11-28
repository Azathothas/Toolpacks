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
   #xpdf-tools : PDF tools
    $env:BIN = "xpdf-tools" # Name of final binary/pkg/cli, sometimes differs from $REPO
    $env:SOURCE_URL = "https://www.xpdfreader.com/index.html" # github/gitlab/homepage/etc for $BIN
    Write-Output "`n`n [+] (Building | Fetching) $env:BIN :: $env:SOURCE_URL`n"
    #Fetch 
     $EGET_LINK = (Invoke-WebRequest -Uri "https://www.xpdfreader.com/download.html" -UserAgent ((Invoke-WebRequest -Uri "https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt").Content.Trim())).Content -split "`r`n" | Select-String -Pattern '(https://dl.xpdfreader.com/.*?xpdf.*?tools.*?win.*?zip)' -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value } | Sort-Object {$_ -as [version]} | Select-Object -First 1 ; $env:EGET_LINK = "$EGET_LINK"
     Remove-Item -Path "$env:TEMP\bin64" -Recurse -ErrorAction SilentlyContinue
     eget "$env:EGET_LINK" --file "bin64" --to "$env:TEMP"
     #pdfdetach: extracts attached files from PDF files
     Copy-Item "$env:TEMP\bin64\pdfdetach.exe" "$env:BINDIR\pdfdetach.exe"
     #pdffonts: lists fonts used in PDF files
     Copy-Item "$env:TEMP\bin64\pdffonts.exe" "$env:BINDIR\pdffonts.exe"
     #pdfimages: extracts raw images from PDF files
     Copy-Item "$env:TEMP\bin64\pdfimages.exe" "$env:BINDIR\pdfimages.exe"
     #pdfinfo: extracts PDF metadat
     Copy-Item "$env:TEMP\bin64\pdfinfo.exe" "$env:BINDIR\pdfinfo.exe"
     #pdftopng: converts PDF pages to PNG image files
     Copy-Item "$env:TEMP\bin64\pdftopng.exe" "$env:BINDIR\pdftopng.exe"
     #pdftoppm: converts PDF pages to netpbm (PPM/PGM/PBM) image files
     Copy-Item "$env:TEMP\bin64\pdftoppm.exe" "$env:BINDIR\pdftoppm.exe"
     #pdftops: converts PDF to PostScript
     Copy-Item "$env:TEMP\bin64\pdftops.exe" "$env:BINDIR\pdftops.exe"
     #pdftotext: converts PDF to text
     Copy-Item "$env:TEMP\bin64\pdftotext.exe" "$env:BINDIR\pdftotext.exe"
     Remove-Item -Path "$env:TEMP\bin64" -Recurse -ErrorAction SilentlyContinue
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