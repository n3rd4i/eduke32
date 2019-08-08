$GameName = 'EDuke32'
$GameNameLow = $GameName.ToLower()
$installLocation = "$(Join-Path $ENV:LocalAppData\Programs $GameNameLow)"
$startMenuDir = [IO.Path]::Combine("$ENV:AppData", 'Microsoft\Windows\Start Menu\Programs', "$GameName")
$shortcutPath = "$(Join-Path $ENV:UserProfile\Desktop $GameName).lnk"
$binPath = "$(Join-Path $installLocation $GameNameLow).exe"
