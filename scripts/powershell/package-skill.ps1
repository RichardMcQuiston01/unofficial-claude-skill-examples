<#
Copyright (c)2026 Richard McQuiston. All Rights Reserved.

This copyright applies to the original code and content of this project only.
It does not extend to, and no license is granted for, use of the "Claude"
name or any Anthropic trademarks, which remain the property of Anthropic, PBC.

.SYNOPSIS
Package one or more skills/<name>/ folders into <name>.skill zip archives.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0, ValueFromRemainingArguments = $true)]
    [string[]]$SkillNames,

    [string]$Output,

    [switch]$All,

    [switch]$Help
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent (Split-Path -Parent $ScriptDir)
$SkillsDir = Join-Path $RepoRoot 'skills'
if (-not $Output) { $Output = Join-Path $RepoRoot 'out' }

function Show-Usage {
    @"
Usage: package-skill.ps1 [-Output <dir>] (<skill-name>... | -All)

Package one or more skill folders under skills/ into .skill zip archives,
for uploading to Claude Desktop or Claude.ai.

  -Output <dir>   Output directory for the .skill files (default: $RepoRoot\out)
  -All            Package every skill under skills/
  -Help           Show this help message
"@
}

if ($Help -or (-not $All -and (-not $SkillNames -or $SkillNames.Count -eq 0))) {
    Show-Usage
    exit 1
}

$names = $SkillNames
if ($All) {
    $names = Get-ChildItem -Path $SkillsDir -Directory |
        Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') } |
        Select-Object -ExpandProperty Name
}

if (-not $names -or $names.Count -eq 0) {
    Write-Error "No skills specified. Use -All or pass one or more skill names."
    Show-Usage
    exit 1
}

New-Item -ItemType Directory -Force -Path $Output | Out-Null
$Output = (Resolve-Path $Output).Path

$failed = $false
foreach ($name in $names) {
    $skillDir = Join-Path $SkillsDir $name
    $skillMd = Join-Path $skillDir 'SKILL.md'
    if (-not (Test-Path $skillMd)) {
        Write-Warning "Skipped: $name (no SKILL.md found at $skillDir)"
        $failed = $true
        continue
    }

    $zipPath = Join-Path $Output "$name.zip"
    $skillPath = Join-Path $Output "$name.skill"
    if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
    if (Test-Path $skillPath) { Remove-Item $skillPath -Force }

    Compress-Archive -Path $skillDir -DestinationPath $zipPath
    Move-Item -Force $zipPath $skillPath
    Write-Host "Packaged: $name -> $skillPath"
}

if ($failed) { exit 1 }
