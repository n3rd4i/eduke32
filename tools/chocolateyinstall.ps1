$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url = 'https://dukeworld.com/eduke32/synthesis/20190901-8072/eduke32_win64_20190901-8072.7z'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  softwareName  = 'eduke32*'
  checksum      = 'C171BF265A58498B5787438CF6EDAF051E972FA4CB898D43E1CAEC83F41DABC3'
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
