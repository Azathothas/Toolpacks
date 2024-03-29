#-------------------------------------------------------#
##TMPDIRS
 $env:SYSTMP = "$env:TEMP"
 #For build-cache
 $env:TMPDIRSTEMPLATE = "toolpacks_XXXXXXX"
 Remove-Item -Path "$SYSTMP\toolpacks" -Recurse -ErrorAction SilentlyContinue
 New-Item -Path "$SYSTMP\toolpacks" -ItemType Directory -Force | Out-Null
$TMPDIRS_FUNC = @'
    function TMPDIRS
      {
         $parent = "$env:SYSTMP\toolpacks"
         $name = [System.IO.Path]::GetRandomFileName().Replace(".", "")
         $name = "{0}_{1}" -f $env:TMPDIRSTEMPLATE.Replace("XXXXXXX", $name), "$env:PROCESSOR_ARCHITECTURE-$env:OS"
         $path = Join-Path $parent $name
         New-Item -Path $path -ItemType Directory | Select-Object -ExpandProperty FullName
      }
'@
 $env:TMPDIRS = "$TMPDIRS_FUNC"
 #For Bins :: toolpack_AMD64-Windows_NT
 $env:BINDIR = Join-Path $env:SYSTMP "toolpack_$env:PROCESSOR_ARCHITECTURE-$env:OS"
 Remove-Item -Path "$env:BINDIR" -Recurse -ErrorAction SilentlyContinue
 Remove-Item -Path ($env:BINDIR + ".7z") -ErrorAction SilentlyContinue
 New-Item -Path $env:BINDIR -ItemType Directory -Force | Out-Null
##Sane Configs
 #In case of removed/privated GH repos
 $env:GIT_TERMINAL_PROMPT = "0"
 #https://git-scm.com/docs/git#Documentation/git.txt-codeGITASKPASScode
 $env:GIT_ASKPASS = "Write-Host"
 #In case of eget prompts
 $env:EGET_TIMEOUT = "timeout -k 1m 2m"
 $env:EGET_EXCLUDE = "--asset `"^386`" --asset `"^aarch64`" --asset `"^apple`" --asset `"^arm`" --asset `"^AppImage`" --asset `"^asc`" --asset `"^crt`" --asset `"^darwin`" --asset `"^deb`" --asset `"^exe`" --asset `"^freebsd`" --asset `"^i686`" --asset `"^linux`" --asset `"^mac`" --asset `"^mips`" --asset `"^rpm`" --asset `"^sbom`" --asset `"^sha`" --asset `"^solaris`" --asset `"^sig`" --asset `"^symbol`""
#-------------------------------------------------------#


#-------------------------------------------------------#
##Deps "$env:SYSTEMROOT" --> C:\WIndows
 Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
 #eget
 Invoke-WebRequest -Uri "https://bin.ajam.dev/x64_Windows/eget.exe" -OutFile "$env:SYSTEMROOT\eget.exe"
  if (-not (Get-Command -Name eget -ErrorAction SilentlyContinue))
     {
        Write-Host "`n[-] FATAL : eget not Installed`n"
        $env:CONTINUE = "NO" ; exit 1
     } else
     {
        if ($env:GITHUB_TOKEN) 
          {
            # 5000 req/minute (80 req/minute)
            Write-Host "GITHUB_TOKEN is Exported"
            $env:CONTINUE = "YES" ; eget --rate
          } else
          {
            # 60 req/hr
            Write-Host "`n[+] GITHUB_TOKEN is NOT Exported"
            Write-Host "Export it to avoid ratelimits`n"
            eget --rate
           $env:CONTINUE = "NO" ; exit 1
          }
     }
 ##Addons
  #7z
   #Remove-Item "$(Get-Command 7z | Select-Object -ExpandProperty Source)" -Force -ErrorAction SilentlyContinue
   #Remove-Item "$env:ProgramData\Chocolatey\bin\7z.exe" -Force -ErrorAction SilentlyContinue
   choco install "7zip.install" --prerelease --force --yes
   eget "https://bin.ajam.dev/x64_Windows/eget.exe" --to "$env:SYSTEMROOT/7z" && sudo chmod +xwr "$env:SYSTEMROOT/7z"
   eget ""
 ##golang
  #$env:GOROOT = "$(((env | Select-String -Pattern "GOROOT" | Select-Object -Last 1).Line -split "=")[1])"
  #$env:GOPATH = "$(((env | Select-String -Pattern "GOROOT" | Select-Object -Last 1).Line -split "=")[1])"
  #$env:GOTOOLDIR = "$env:GOPATH\pkg\tool\windows_amd64"
  #((env | Select-String -Pattern "GOROOT_" | ForEach-Object { ($_ -split "=")[1] }).Trim() | Where-Object {$_ -ne $env:GOROOT}) | ForEach-Object { Remove-Item -Path $_ -Recurse -Force -ErrorAction SilentlyContinue }
  #((env | Select-String -Pattern "GOROOT_" | ForEach-Object { ($_ -split "=")[1] }).Trim())
  (env | Select-String -Pattern "GOROOT_" | ForEach-Object { ($_ -split "=")[1] }).Trim() | ForEach-Object { Remove-Item -Path $_ -Recurse -Force -ErrorAction SilentlyContinue }
  Remove-Item "Env:\GOPATH","Env:\GOROOT","Env:\GOTOOLDIR" -ErrorAction SilentlyContinue
  choco install "golang" --prerelease --force --yes ; refreshenv
  if (-not (Get-Command -Name go -ErrorAction SilentlyContinue))
     {
        Write-Host "`n[-] FATAL : Golang NOT Installed`n"
        $env:CONTINUE = "NO" ; exit 1
     } else
     {
        $env:CONTINUE = "YES" ; go version
     }
 ##rust
 if (-not (Get-Command -Name rustup -ErrorAction SilentlyContinue))
     {
        Write-Host "`n[-] FATAL : Rust (Cargo) NOT Installed`n"
        $env:CONTINUE = "NO" ; exit 1
     } else
     {
        $env:CONTINUE = "YES" ; rustup update --force
     }
#-------------------------------------------------------#


#-------------------------------------------------------#     
##Build
  $env:BUILD = "YES"
  $env:BUILDSCRIPT = New-TemporaryFile
# Get URLs
Invoke-WebRequest -Uri "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x64_Windows/bins/metadata.json" | 
    ConvertFrom-Json | 
    Select-Object -ExpandProperty Source | 
    Where-Object { $_ -match "\.ps1$" } | 
    Sort-Object -Unique | 
    Out-File -FilePath "$env:SYSTMP/BUILDURLS"

 #ENV
 BUILDSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_build.sh)" && export BUILDSCRIPT="$BUILDSCRIPT"
 #Get URlS
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/bins/metadata.json" | jq -r '.[].Source' | grep -i "\.sh$" | sort -u -o "$SYSTMP/BUILDURLS"
 #Run
  echo -e "\n\n [+] Started Building at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
  for BUILD_URL in $(cat "$SYSTMP/BUILDURLS"); do
      echo -e "\n[+] Fetching : $BUILD_URL"
      curl -qfsSL "$BUILD_URL" -o "$BUILDSCRIPT"
      chmod +xwr "$BUILDSCRIPT"
      # (source "$BUILDSCRIPT") || true
      bash "$BUILDSCRIPT"
      # Clean & Purge
      sudo rm -rf "$SYSTMP/toolpacks" 2>/dev/null
      mkdir -p "$SYSTMP/toolpacks"
  done
  echo -e "\n\n [+] Finished Building at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
 #Check
 BINDIR_SIZE="$(du -sh "$BINDIR" 2>/dev/null | awk '{print $1}' 2>/dev/null)" && export "BINDIR_SIZE=$BINDIR_SIZE"
 if [ ! -d "$BINDIR" ] || [ -z "$(ls -A "$BINDIR")" ] || [ -z "$BINDIR_SIZE" ] || [[ "${BINDIR_SIZE}" == *K* ]]; then
      echo -e "\n[+] Broken/Empty Built "$BINDIR" Found\n"
      exit 1
 else
      echo -e "\n[+] Built "$BINDIR" :: $BINDIR_SIZE\n"
 fi
#-------------------------------------------------------#