param(
  [ValidateSet("user", "project")]
  [string]$Scope = "user"
)
$ErrorActionPreference = "Stop"
$Source = $PSScriptRoot
if ($Scope -eq "user") {
  $CodexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
  $Destination = Join-Path $CodexHome "skills/lemo-opuscar"
} else {
  $Destination = Join-Path (Get-Location) ".agents/skills/lemo-opuscar"
}
New-Item -ItemType Directory -Force -Path (Split-Path $Destination) | Out-Null
New-Item -ItemType Directory -Force -Path $Destination | Out-Null
Copy-Item -Path (Join-Path $Source "SKILL.md") -Destination $Destination -Force
Copy-Item -Path (Join-Path $Source "references") -Destination $Destination -Recurse -Force
Copy-Item -Path (Join-Path $Source "scripts") -Destination $Destination -Recurse -Force
Write-Host "Installed lemo-opuscar to $Destination"
