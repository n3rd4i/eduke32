$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dukeworld.com/eduke32/synthesis/latest/eduke32_win64_20190518-7657.7z' # download url, HTTPS preferred
$installLocation = "$ENV:LocalAppData\Programs\Eduke32"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  softwareName  = 'eduke32*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '9293ADA759798C4BBEECDADE054C862C'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512
}
Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package

Install-ChocolateyShortcut `
  -ShortcutFilePath "$ENV:UserProfile\Desktop\Eduke32.lnk" `
  -TargetPath "$installLocation\eduke32.exe" `
  -IconLocation "$installLocation\eduke32.exe" `
  -WorkingDirectory "$installLocation"
