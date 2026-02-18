$ErrorActionPreference = 'Stop'

Write-Host "[1/4] Check winget"
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  throw "winget not found. Please install App Installer from Microsoft Store."
}

Write-Host "[2/4] Install Node.js LTS"
winget install OpenJS.NodeJS.LTS --silent --accept-package-agreements --accept-source-agreements | Out-Null

Write-Host "[3/4] Install OpenClaw"
npm install -g openclaw

Write-Host "[4/4] Prepare folders"
$workspace = Join-Path $HOME ".openclaw\workspace"
$configDir = Join-Path $HOME ".openclaw"
New-Item -ItemType Directory -Force -Path $workspace | Out-Null
New-Item -ItemType Directory -Force -Path $configDir | Out-Null

Write-Host "Done: bootstrap ok"
