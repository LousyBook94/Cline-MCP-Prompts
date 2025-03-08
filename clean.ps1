# Repository Cleanup Script
# This script cleans up repository files and then deletes itself

Write-Host "🧹 Starting repository cleanup..." -ForegroundColor Cyan

# Check if .git directory exists and remove it
if (Test-Path -Path ".git" -PathType Container) {
    Write-Host "Removing .git directory..." -ForegroundColor Yellow
    Remove-Item -Path ".git" -Force -Recurse
    Write-Host "✅ .git directory removed successfully" -ForegroundColor Green
} else {
    Write-Host "ℹ️ .git directory not found, skipping..." -ForegroundColor Blue
}

# Check if README.md exists and remove it
if (Test-Path -Path "README.md" -PathType Leaf) {
    Write-Host "Removing README.md file..." -ForegroundColor Yellow
    Remove-Item -Path "README.md" -Force
    Write-Host "✅ README.md removed successfully" -ForegroundColor Green
} else {
    Write-Host "ℹ️ README.md not found, skipping..." -ForegroundColor Blue
}

Write-Host "🎉 Repository cleanup completed!" -ForegroundColor Green
Write-Host "🚮 Cleaning up all cleanup scripts..." -ForegroundColor Magenta

# Get the path of all cleanup scripts
$CleanupScripts = @("clean.ps1", "clean.sh", "clean.zsh")

# Create a small script that will delete all cleanup scripts after it completes
$DeleteScript = @"
Start-Sleep -Seconds 1
foreach (`$script in @('$($CleanupScripts -join "','")')) {
    if (Test-Path -Path `$script) {
        Remove-Item -Path `$script -Force
    }
}
"@

# Execute the delete script in a new PowerShell process
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $DeleteScript" -WindowStyle Hidden

Write-Host "✨ All done! Ready to start building your MCP server!" -ForegroundColor Cyan
