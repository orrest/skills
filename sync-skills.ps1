# sync-skills.ps1
# Synchronizes the skills in this project to the local Gemini skills directory (@~\.gemini\skills).

$targetBaseDir = Join-Path $HOME ".gemini\skills"
$sourceBaseDir = $PSScriptRoot

if (-not (Test-Path $targetBaseDir)) {
    Write-Host "Creating target directory: $targetBaseDir"
    New-Item -ItemType Directory -Path $targetBaseDir -Force | Out-Null
}

$pluginJsonPath = Join-Path $sourceBaseDir "plugin.json"
if (-not (Test-Path $pluginJsonPath)) {
    Write-Error "plugin.json not found in $sourceBaseDir"
    exit 1
}

$pluginJson = Get-Content $pluginJsonPath | ConvertFrom-Json
$skills = $pluginJson.skills

foreach ($skill in $skills) {
    $skillSource = Join-Path $sourceBaseDir $skill
    $skillTarget = Join-Path $targetBaseDir $skill

    if (Test-Path $skillSource -PathType Container) {
        Write-Host "Replacing skill: $skill"
        if (Test-Path $skillTarget) {
            Remove-Item -Path $skillTarget -Recurse -Force
        }
        Copy-Item -Path $skillSource -Destination $targetBaseDir -Recurse -Force
    } else {
        Write-Warning "Skill directory not found in project: $skill"
    }
}

Write-Host "Synchronization complete."
