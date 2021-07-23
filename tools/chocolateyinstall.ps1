$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = 'https://dukeworld.com/eduke32/synthesis/20210722-9484-f3fea8c15/eduke32_win64_20210722-9484-f3fea8c15.7z'
  checksum      = '1c741e17751de68638256dbf90cabc0e16f4d88b20d0acaa66c430d3aa4f7edf'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$binPath" `
  -WorkingDirectory "$installLocation"
