$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

Remove-Item $installLocation -exclude *.ini -recurse -force
Remove-Item $startMenuDir -recurse -force
