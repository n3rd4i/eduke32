$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url = 'https://dukeworld.com/eduke32/synthesis/20200313-8751/eduke32_win64_20200313-8751.7z'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  softwareName  = 'eduke32*'
  checksum      = 'AB762D5A9C8AED54A107E4B79F9E33D527418E9F621A0BEB1266F57F3F60AE28'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$binPath" `
  -WorkingDirectory "$installLocation"

## Desktop
# Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
#   -TargetPath "$binPath" `
#   -WorkingDirectory "$installLocation"
