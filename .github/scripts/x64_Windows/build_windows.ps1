#-------------------------------------------------------#
##TMPDIRS
 $env:CWD = (Resolve-Path ".\").Path
 $env:SYSTMP = "$env:TEMP"
 #For build-cache
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
 #For Bins :: toolpack_AMD64-Windows_NT
 $env:BINDIR = Join-Path $env:SYSTMP "toolpack_$env:PROCESSOR_ARCHITECTURE-$env:OS"
 Remove-Item -Path "$env:BINDIR" -Recurse -ErrorAction SilentlyContinue
 Remove-Item -Path ($env:BINDIR + ".7z") -ErrorAction SilentlyContinue
 New-Item -Path $env:BINDIR -ItemType Directory -Force | Out-Null
##Sane Configs
 #In case of removed/privated GH repos
 $env:GIT_TERMINAL_PROMPT = "0"
 #https://git-scm.com/docs/git#Documentation/git.txt-codeGITASKPASScode
 $env:GIT_ASKPASS = "Write-Output"
 #In case of eget prompts
 $env:EGET_TIMEOUT = "timeout -k 1m 2m"
 $EGET_EXCLUDE = "--asset `"^386`" --asset `"^aarch64`" --asset `"^apple`" --asset `"^arm`" --asset `"^AppImage`" --asset `"^asc`" --asset `"^crt`" --asset `"^darwin`" --asset `"^deb`" --asset `"^exe`" --asset `"^freebsd`" --asset `"^i686`" --asset `"^linux`" --asset `"^mac`" --asset `"^mips`" --asset `"^rpm`" --asset `"^sbom`" --asset `"^sha`" --asset `"^solaris`" --asset `"^sig`" --asset `"^symbol`""
 $env:EGET_EXCLUDE = "$EGET_EXCLUDE"
#-------------------------------------------------------#


#-------------------------------------------------------#
##Deps "$env:SYSTEMROOT" --> C:\WIndows
 Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
 #eget
 Invoke-WebRequest -Uri "https://bin.ajam.dev/x64_Windows/eget.exe" -OutFile "$env:SYSTEMROOT\eget.exe"
  if (-not (Get-Command -Name eget -ErrorAction SilentlyContinue)) {
        Write-Output "`n[-] FATAL : eget not Installed`n"
        $env:CONTINUE = "NO" ; exit 1
     } else {
        if ($env:GITHUB_TOKEN) {
            # 5000 req/minute (80 req/minute)
            Write-Output "GITHUB_TOKEN is Exported"
            $env:CONTINUE = "YES" ; eget --rate
          } else {
            # 60 req/hr
            Write-Output "`n[+] GITHUB_TOKEN is NOT Exported"
            Write-Output "Export it to avoid ratelimits`n"
            eget --rate
           $env:CONTINUE = "NO" ; exit 1
          }
     }
 ##Addons
  #7z
   #Remove-Item "$(Get-Command 7z | Select-Object -ExpandProperty Source)" -Force -ErrorAction SilentlyContinue
   #Remove-Item "$env:ProgramData\Chocolatey\bin\7z.exe" -Force -ErrorAction SilentlyContinue
   choco install "7zip.install" --prerelease --force --yes
  #b3sum 
   eget "https://bin.ajam.dev/x64_Windows/b3sum.exe" --to "$env:SYSTEMROOT/b3sum.exe"
  #croc
   eget "https://bin.ajam.dev/x64_Windows/croc.exe" --to "$env:SYSTEMROOT/croc.exe"
  #curl
   choco install "curl" --prerelease --force --yes
   vcpk install "curl" --clean-after-build
  #delta
   choco install "delta" --prerelease --force --yes
  #dust
   eget "https://bin.ajam.dev/x64_Windows/dust.exe" --to "$env:SYSTEMROOT/dust.exe"
  #openssl
   choco install "openssl" --prerelease --force --yes
   vcpk install "openssl" --clean-after-build
  #protobuf
   vcpk install "protobuf" --clean-after-build
  ##rclone
  # choco install "rclone" --prerelease --force --yes
  #upx
   eget "https://bin.ajam.dev/x64_Windows/upx.exe" --to "$env:SYSTEMROOT/upx.exe"
  #yq
   eget "https://bin.ajam.dev/x64_Windows/yq.exe" --to "$env:SYSTEMROOT/yq.exe"
 ##golang
  #$env:GOROOT = "$(((env | Select-String -Pattern "GOROOT" | Select-Object -Last 1).Line -split "=")[1])"
  #$env:GOPATH = "$(((env | Select-String -Pattern "GOROOT" | Select-Object -Last 1).Line -split "=")[1])"
  #$env:GOTOOLDIR = "$env:GOPATH\pkg\tool\windows_amd64"
  #((env | Select-String -Pattern "GOROOT_" | ForEach-Object { ($_ -split "=")[1] }).Trim() | Where-Object {$_ -ne $env:GOROOT}) | ForEach-Object { Remove-Item -Path $_ -Recurse -Force -ErrorAction SilentlyContinue }
  #((env | Select-String -Pattern "GOROOT_" | ForEach-Object { ($_ -split "=")[1] }).Trim())
  (env | Select-String -Pattern "GOROOT_" | ForEach-Object { ($_ -split "=")[1] }).Trim() | ForEach-Object { Remove-Item -Path $_ -Recurse -Force -ErrorAction SilentlyContinue }
  Remove-Item "Env:\GOPATH","Env:\GOROOT","Env:\GOTOOLDIR" -ErrorAction SilentlyContinue
  choco install "golang" --prerelease --force --yes ; refreshenv
  if (-not (Get-Command -Name go -ErrorAction SilentlyContinue)) {
        Write-Output "`n[-] FATAL : Golang NOT Installed`n"
        $env:CONTINUE = "NO" ; exit 1
     } else {
        $env:CONTINUE = "YES" ; go version
     }
 ##rust
 if (-not (Get-Command -Name rustup -ErrorAction SilentlyContinue)) {
        Write-Output "`n[-] FATAL : Rust (Cargo) NOT Installed`n"
        $env:CONTINUE = "NO" ; exit 1
     } else {
        $env:CONTINUE = "YES" ; rustup update --force
     }
#-------------------------------------------------------#


#-------------------------------------------------------#     
##Build
  refreshenv
  $env:BUILD = "YES"
  $env:BUILDSCRIPT = New-TemporaryFile
 #Get URLs
  Invoke-WebRequest -Uri "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x64_Windows/bins/metadata.json" | 
     ConvertFrom-Json | 
     Select-Object -ExpandProperty Source | 
     Where-Object { $_ -match "\.ps1$" } | 
     Sort-Object -Unique | 
     Out-File -FilePath "$env:SYSTMP/BUILDURLS"
 #Run
  $TimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById('Nepal Standard Time')
  $LocalTime = [System.TimeZoneInfo]::ConvertTimeFromUtc([System.DateTime]::UtcNow, $TimeZone)
  Write-Output "`n`n [+] Started Building at :: $($LocalTime.ToString('dddd, yyyy-MM-dd (hh:mm:ss tt)'))`n`n"
  Get-Content $env:SYSTMP/BUILDURLS | ForEach-Object {
      $BUILD_URL = $_
      Write-Output "`n[+] Fetching : $BUILD_URL"
      Invoke-WebRequest -Uri "$BUILD_URL" -OutFile "$env:SYSTMP/BUILDSCRIPT.ps1" -UseBasicParsing
      Set-ItemProperty -Path "$env:SYSTMP/BUILDSCRIPT.ps1" -Name IsReadOnly -Value $false
      . "$env:SYSTMP/BUILDSCRIPT.ps1"
      # Clean & Purge
      Remove-Item -Path "$env:SYSTMP/toolpacks" -Recurse -Force -ErrorAction SilentlyContinue
      New-Item -ItemType Directory -Path "$env:SYSTMP/toolpacks" -Force -ErrorAction SilentlyContinue | Out-Null
  }
  $TimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById('Nepal Standard Time')
  $LocalTime = [System.TimeZoneInfo]::ConvertTimeFromUtc([System.DateTime]::UtcNow, $TimeZone)
  Write-Output "`n`n [+] Finished Building at :: $($LocalTime.ToString('dddd, yyyy-MM-dd (hh:mm:ss tt)'))`n`n"
 #Check
  $env:BINDIR_SIZE = "{0:N2} {1}" -f ((Get-ChildItem -Path $env:BINDIR -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB), "MB"
  if (-not (Test-Path $env:BINDIR) -or @(Get-ChildItem -Path $env:BINDIR).Count -eq 0 -or [string]::IsNullOrEmpty($env:BINDIR_SIZE) -or $env:BINDIR_SIZE -like "*K*") {
      Write-Output "`n[+] Broken/Empty Built $env:BINDIR Found`n"
      exit 1
  } else {
      Write-Output "`n[+] Built $env:BINDIR :: $env:BINDIR_SIZE`n"
  }
#-------------------------------------------------------#


#-------------------------------------------------------#
#Strip || Cleanup
 #Chmod +xwr
 Get-ChildItem -Path "$env:BINDIR" -File | ForEach-Object { $acl = Get-Acl $_.FullName; $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Users", "FullControl", "Allow"); $acl.SetAccessRule($accessRule); Set-Acl $_.FullName $acl }
 $files = Get-ChildItem -Path "$env:BINDIR" -File; foreach ($file in $files) { $filePath = $file.FullName; icacls $filePath /grant Everyone:F }
 #Strip
 Get-ChildItem -Path "$env:BINDIR" -File | ForEach-Object { Start-Process -FilePath "strip" -ArgumentList "--strip-all $($_.FullName)" -Verb RunAs -Wait }
#-------------------------------------------------------#
#rClone Upload to R2 (bin.ajam.dev/x64_Windows) (x64_Windows) [Binaries]
if ((Get-Command 7z -ErrorAction SilentlyContinue) -and (Get-Command rclone -ErrorAction SilentlyContinue) -and (Test-Path "$env:APPDATA\rclone\rclone.conf") -and (Test-Path $env:BINDIR) -and (Get-ChildItem -Path $env:BINDIR -Depth 1 | Select-Object -First 1)) {
    #Upload
      Write-Output "`n[+] Uploading Results to R2 [r2:/bin/x64_Windows] (rclone)`n"
      Push-Location "$env:BINDIR"
      rclone copy "." "r2:/bin/x64_Windows/" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress ; Pop-Location
    #Fetch&Sync
      Remove-Item -Path "$env:SYSTMP\toolpacks" -Force -Recurse -ErrorAction SilentlyContinue
      Push-Location "$env:BINDIR"     
      rclone copy "r2:/bin/x64_Windows/" "." --exclude="Baseutils/**" --exclude="BLAKE3SUM" --exclude="*.7z" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="SHA256SUM" --exclude="*.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
    #Strip || Cleanup
      #Chmod +xwr
       Get-ChildItem -Path "$env:BINDIR" -File | ForEach-Object { $acl = Get-Acl $_.FullName; $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Users", "FullControl", "Allow"); $acl.SetAccessRule($accessRule); Set-Acl $_.FullName $acl }
       $files = Get-ChildItem -Path "$env:BINDIR" -File; foreach ($file in $files) { $filePath = $file.FullName; icacls $filePath /grant Everyone:F }
      #Strip
       Get-ChildItem -Path "$env:BINDIR" -File | ForEach-Object { Start-Process -FilePath "strip" -ArgumentList "--strip-all $($_.FullName)" -Verb RunAs -Wait }
       #File 
         Push-Location "$env:BINDIR" ; file * | Out-File -FilePath "$env:SYSTMP\x64_Windows_FILE" ; Pop-Location
         rclone copyto "$env:SYSTMP\x64_Windows_FILE" "r2:/bin/x64_Windows/FILE.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
       #Size (Dust)
         Push-Location "$env:BINDIR" ; Start-Process -FilePath "dust" -ArgumentList "-b", "-c", "-i", "-r", "-n", "99999999", ".\" -RedirectStandardOutput "$env:SYSTMP\x64_Windows_SIZE.txt" -NoNewWindow -Wait ; Pop-Location
         rclone copyto "$env:SYSTMP\x64_Windows_SIZE.txt" "r2:/bin/x64_Windows/SIZE.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
       #BLAKE3SUM
         Push-Location "$env:BINDIR" ; b3sum * | Out-File -FilePath "$env:SYSTMP\x64_Windows_BLAKE3SUM" ; Pop-Location
         rclone copyto "$env:SYSTMP\x64_Windows_BLAKE3SUM" "r2:/bin/x64_Windows/BLAKE3SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
       #SHA256SUM
         Push-Location "$env:BINDIR" ; sha256sum * | Out-File -FilePath "$env:SYSTMP\x64_Windows_SHA256SUM" ; Pop-Location
         rclone copyto "$env:SYSTMP\x64_Windows_SHA256SUM" "r2:/bin/x64_Windows/SHA256SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
    #Archive
      Push-Location "$env:SYSTMP" ; 7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt ".\toolpack_x64_Windows.7z" "$env:BINDIR" ; Pop-Location
     #Meta
      (Get-Item -Path "$env:SYSTMP\toolpack_x64_Windows.7z").Length | ForEach-Object { "{0:N2} MB" -f ($_ / 1MB) }
      #Upload
      Write-Output "`n[+] Uploading Results to R2 [r2:/bin/x64_Windows] (rclone)`n"
      rclone copyto "$env:SYSTMP\toolpack_x64_Windows.7z" "r2:/bin/x64_Windows/_toolpack_x64_Windows.7z" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      Push-Location "$env:SYSTMP" ; b3sum ".\toolpack_x64_Windows.7z" | Out-File -FilePath "$env:SYSTMP\_toolpack_x64_Windows_BLAKE3SUM" ; Pop-Location
      rclone copyto "$env:SYSTMP\_toolpack_x64_Windows_BLAKE3SUM" "r2:/bin/x64_Windows/_toolpack_x64_Windows_BLAKE3SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      Push-Location "$env:SYSTMP" ; sha256sum ".\toolpack_x64_Windows.7z" | Out-File -FilePath "$env:SYSTMP\_toolpack_x64_Windows_SHA256SUM" ; Pop-Location
      rclone copyto "$env:SYSTMP\_toolpack_x64_Windows_SHA256SUM" "r2:/bin/x64_Windows/_toolpack_x64_Windows_SHA256SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
}
Set-Location "$env:CWD"
#EOF