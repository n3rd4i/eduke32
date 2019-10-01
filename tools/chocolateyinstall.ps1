$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url = 'https://dukeworld.com/eduke32/synthesis/20190919-8133/eduke32_win64_20190919-8133.7z'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  softwareName  = 'eduke32*'
  checksum      = '97062BE841210377B31F0C016CD20604F9C7F6329855D19E6EAC71C728CB8F3C'
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
