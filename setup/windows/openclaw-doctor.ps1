$ErrorActionPreference = 'Continue'

$ok = 0
$warn = 0

Write-Host "== OpenClaw Doctor (Windows) =="

if (Get-Command openclaw -ErrorAction SilentlyContinue) {
  Write-Host "[OK] openclaw in PATH"
  $ok++
} else {
  Write-Host "[WARN] openclaw not found in PATH"
  $warn++
}

$configPath = Join-Path $HOME ".openclaw\openclaw.json"
if (Test-Path $configPath) {
  Write-Host "[OK] config exists: $configPath"
  $ok++
} else {
  Write-Host "[WARN] config missing: $configPath"
  $warn++
}

if (Get-Command openclaw -ErrorAction SilentlyContinue) {
  openclaw status | Out-Null
  if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] openclaw status reachable"
    $ok++
  } else {
    Write-Host "[WARN] openclaw status failed"
    $warn++
  }
}

Write-Host "Summary: OK=$ok WARN=$warn"
if ($warn -eq 0) { Write-Host "GREEN" } else { Write-Host "YELLOW" }
