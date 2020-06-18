$GameName = 'EDuke32'
$GameNameLow = $GameName.ToLower()
$installLocation = "$(Join-Path $ENV:LocalAppData\Programs $GameNameLow)"
$startMenuDir = [IO.Path]::Combine("$ENV:AppData", 'Microsoft\Windows\Start Menu\Programs', "$GameName")
$binPath = "$(Join-Path $installLocation $GameNameLow).exe"
