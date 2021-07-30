$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = 'https://dukeworld.com/eduke32/synthesis/20210729-9488-3a767ede4/eduke32_win64_20210729-9488-3a767ede4.7z'
  checksum      = 'b48ecdbedb712953f1287ff6434c92e5e3a732fc29f77fe5323c71902fbab856'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$binPath" `
  -WorkingDirectory "$installLocation"
