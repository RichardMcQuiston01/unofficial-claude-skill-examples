<#
Copyright (c)2026 Richard McQuiston. All Rights Reserved.

This copyright applies to the original code and content of this project only.
It does not extend to, and no license is granted for, use of the "Claude"
name or any Anthropic trademarks, which remain the property of Anthropic, PBC.

.SYNOPSIS
Copy one or more skills/<name>/ folders into ~/.claude/skills/.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0, ValueFromRemainingArguments = $true)]
    [string[]]$SkillNames,

    [switch]$All,

    [switch]$Help
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent (Split-Path -Parent $ScriptDir)
$SkillsDir = Join-Path $RepoRoot 'skills'
$UserProfile = [Environment]::GetFolderPath('UserProfile')
$DestSkillsDirRaw = Join-Path (Join-Path $UserProfile '.claude') 'skills'

function Show-Usage {
    @"
Usage: install-skill-to-user.ps1 (<skill-name>... | -All)

Copy one or more skill folders from skills/ into $DestSkillsDirRaw,
your personal skills directory (available in every project on this machine).

  -All          Install every skill under skills/
  -Help         Show this help message
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

New-Item -ItemType Directory -Force -Path $DestSkillsDirRaw | Out-Null
$destSkillsDir = (Resolve-Path $DestSkillsDirRaw).Path

$failed = $false
foreach ($name in $names) {
    $src = Join-Path $SkillsDir $name
    $skillMd = Join-Path $src 'SKILL.md'
    if (-not (Test-Path $skillMd)) {
        Write-Warning "Skipped: $name (no SKILL.md found at $src)"
        $failed = $true
        continue
    }

    $target = Join-Path $destSkillsDir $name
    if (Test-Path $target) {
        $reply = Read-Host "Overwrite $name at $target? [y/N]"
        if ($reply -notmatch '^[Yy]$') {
            Write-Host "Skipped: $name (already exists, not overwritten)"
            continue
        }
        Remove-Item -Recurse -Force $target
    }

    Copy-Item -Recurse -Force $src $target
    Write-Host "Installed: $name -> $target"
}

if ($failed) { exit 1 }
