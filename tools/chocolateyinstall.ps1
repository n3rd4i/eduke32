$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = 'https://dukeworld.com/eduke32/synthesis/20200810-9218-02d5b61ed/eduke32_win64_20200810-9218-02d5b61ed.7z'
  checksum      = '53cdeb0d0a81260373dbc1c1eed5ab547abad4c16645434cc551a68e739273b0'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$binPath" `
  -WorkingDirectory "$installLocation"
