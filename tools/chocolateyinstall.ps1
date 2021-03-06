$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = 'https://dukeworld.com/eduke32/synthesis/20210304-9317-fe2bcb7b5/eduke32_win64_20210304-9317-fe2bcb7b5.7z'
  checksum      = 'a5717a7491e0489ee9439d3af98f6593ac7a0deb56449e2f964c70821dd343c4'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$binPath" `
  -WorkingDirectory "$installLocation"
