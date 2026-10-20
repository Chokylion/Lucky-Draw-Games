param([Parameter(Mandatory=$true)][string]$Page)
$ErrorActionPreference = 'SilentlyContinue'
$html = Join-Path $PSScriptRoot $Page
$uri  = ([System.Uri]$html).AbsoluteUri
$profileDir = Join-Path $env:TEMP 'kaizen-games-edge'

$edgeArgs = @(
  "--app=$uri"
  "--window-size=1040,720"
  "--window-position=120,0"
  "--user-data-dir=$profileDir"
  "--no-first-run"
  "--allow-file-access-from-files"
)

$edge = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
if (-not (Test-Path $edge)) { $edge = "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe" }
if (-not (Test-Path $edge)) { $edge = 'msedge.exe' }

Start-Process -FilePath $edge -ArgumentList $edgeArgs
