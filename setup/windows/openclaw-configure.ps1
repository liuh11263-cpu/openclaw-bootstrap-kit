$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$repoRoot = Split-Path -Parent $root
$envFile = Join-Path $repoRoot ".env"
$templatePath = Join-Path $repoRoot "templates\openclaw.template.json"
$configPath = Join-Path $HOME ".openclaw\openclaw.json"

if (-not (Test-Path $envFile)) { throw ".env not found. Copy .env.example to .env first." }
if (-not (Test-Path $templatePath)) { throw "Template not found: $templatePath" }

# load .env key=value
Get-Content $envFile | ForEach-Object {
  if ($_ -match '^\s*#' -or $_ -match '^\s*$') { return }
  $parts = $_ -split '=', 2
  if ($parts.Length -eq 2) {
    [System.Environment]::SetEnvironmentVariable($parts[0].Trim(), $parts[1].Trim(), 'Process')
  }
}

$content = Get-Content $templatePath -Raw
$content = [Regex]::Replace($content, '\$\{(\w+)\}', {
  param($m)
  $name = $m.Groups[1].Value
  $val = [System.Environment]::GetEnvironmentVariable($name, 'Process')
  if ($null -eq $val) { '' } else { $val }
})

New-Item -ItemType Directory -Force -Path (Split-Path -Parent $configPath) | Out-Null
Set-Content -Path $configPath -Value $content -Encoding UTF8
Write-Host "Wrote config: $configPath"

try {
  openclaw gateway restart
} catch {
  Write-Warning "openclaw not available in PATH yet. Open a new terminal and run: openclaw gateway restart"
}
