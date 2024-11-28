$env:CWD = (Resolve-Path ".\").Path
$SYSTMP = "$env:TEMP" ; $env:SYSTMP = "$env:TEMP"
$env:TMPDIRSTEMPLATE = "toolpacks_XXXXXXX"
Remove-Item -Path "$SYSTMP\toolpacks" -Recurse -ErrorAction SilentlyContinue
New-Item -Path "$SYSTMP\toolpacks" -ItemType Directory -Force | Out-Null
$TMPDIRS = {
    $parent = "$env:SYSTMP\toolpacks"
    $name = [System.IO.Path]::GetRandomFileName().Replace(".", "")
    $name = "{0}_{1}" -f $env:TMPDIRSTEMPLATE.Replace("XXXXXXX", $name), "$env:PROCESSOR_ARCHITECTURE-$env:OS"
    $path = Join-Path $parent $name
    New-Item -Path $path -ItemType Directory | Select-Object -ExpandProperty FullName
}
$env:TMPDIRS = "$TMPDIRS"
$env:BINDIR = Join-Path $env:SYSTMP "toolpack_$env:PROCESSOR_ARCHITECTURE-$env:OS"
Remove-Item -Path "$env:BINDIR" -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path ($env:BINDIR + ".7z") -ErrorAction SilentlyContinue
New-Item -Path $env:BINDIR -ItemType Directory -Force | Out-Null
$env:GIT_TERMINAL_PROMPT = "0"
$env:GIT_ASKPASS = "Write-Output"
$env:EGET_TIMEOUT = "timeout -k 1m 2m"
$EGET_EXCLUDE = "--asset `"^386`" --asset `"^aarch64`" --asset `"^apple`" --asset `"^arm`" --asset `"^AppImage`" --asset `"^asc`" --asset `"^crt`" --asset `"^darwin`" --asset `"^deb`" --asset `"^exe`" --asset `"^freebsd`" --asset `"^i686`" --asset `"^linux`" --asset `"^mac`" --asset `"^mips`" --asset `"^rpm`" --asset `"^sbom`" --asset `"^sha`" --asset `"^solaris`" --asset `"^sig`" --asset `"^symbol`""
$env:EGET_EXCLUDE = "$EGET_EXCLUDE"
$USER_AGENT = ((Invoke-WebRequest -Uri "https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt").Content.Trim()) ; $env:USER_AGENT = "$USER_AGENT"
$env:OPENSSL_STATIC = "Yes"
$env:OPENSSL_DIR = "$env:VCPKG_INSTALLATION_ROOT\installed\x64-windows-static"
$env:OPENSSL_LIB_DIR = "$env:VCPKG_INSTALLATION_ROOT\installed\x64-windows-static\lib"
$env:OPENSSL_INCLUDE_DIR = "$env:VCPKG_INSTALLATION_ROOT\installed\x64-windows-static\include"
$env:OCI_DIR = "$env:VCPKG_INSTALLATION_ROOT\installed\x64-windows-static"
$env:OCI_LIB_DIR = "$env:VCPKG_INSTALLATION_ROOT\installed\x64-windows-static\lib"
$env:OCI_INCLUDE_DIR = "$env:VCPKG_INSTALLATION_ROOT\installed\x64-windows-static\include"
$env:PKG_CONFIG_ALLOW_SYSTEM_LIBS = "1" ; $env:PKG_CONFIG_ALLOW_SYSTEM_CFLAGS = "1"
$env:PKG_CONFIG_PATH = "C:\vcpkg\installed\x64-windows-static\lib\pkgconfig;C:\vcpkg\installed\x64-windows\lib\pkgconfig;C:\Strawberry\c\lib\pkgconfig"
$env:CONTINUE = "YES"
$env:BUILD = "YES"
#Change
$env:GITHUB_TOKEN = "okenennsnnsnsnsnsns"