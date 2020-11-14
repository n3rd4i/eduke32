import-module au

$domain   = 'https://dukeworld.com'
$releases = "$domain/eduke32/synthesis"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
    ".\eduke32.nuspec" = @{
      "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    }
  }
}

function global:au_GetLatest {
  $folders_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '\d{4}\d{2}\d{2}-\d{4}-\w{9}' # hash included version
  $folder = $folders_page.links | ? href -match $regex | select -First 1 -expand href
  $download_page = Invoke-WebRequest -Uri "$releases/$folder" -UseBasicParsing
  $regex = 'eduke32_win64_.*.7z$'
  $url_file = $download_page.links | ? href -match $regex | select -First 1 -expand href
  $url = ("$releases/$folder", $url_file)  -join ''

  $token = $url_file -split 'eduke32_win64_' | select -First 1 -Skip 1
  $raw_version = $token -split '.7z' | select -Last 1 -Skip 1
  $tokens = $raw_version -split '-' | select -First 2
  $semantic_ver = [regex]::split($tokens[0], '(\d{4})(\d{2})(\d{2})') | Where-Object { $_ }
  $version_pre = $semantic_ver -join '.'
  $version = ($version_pre, $tokens[1]) -join '.'
  $release_notes = ('https://dukeworld.com/eduke32/synthesis', $raw_version, 'ChangeLog.txt') -join '/'
  return @{ Version = $version; URL32 = $url; ReleaseNotes = $release_notes }
}

update -ChecksumFor 32
