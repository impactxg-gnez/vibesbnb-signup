# PowerShell script to push signup site to GitHub repository
# Usage: .\push-to-repo.ps1

Write-Host "🚀 Pushing VibesBNB Signup Site to GitHub..." -ForegroundColor Green
Write-Host ""

# Check if git is initialized
if (-not (Test-Path .git)) {
    Write-Host "❌ Git not initialized. Run 'git init' first." -ForegroundColor Red
    exit 1
}

# Check if remote exists
$remoteExists = git remote get-url origin 2>$null
if (-not $remoteExists) {
    Write-Host "📡 Adding remote repository..." -ForegroundColor Yellow
    git remote add origin https://github.com/impactxg-gnez/vibesbnb-signup.git
}

# Stage all files
Write-Host "📦 Staging files..." -ForegroundColor Yellow
git add .

# Check if there are changes to commit
$status = git status --porcelain
if (-not $status) {
    Write-Host "✅ No changes to commit." -ForegroundColor Green
    exit 0
}

# Commit changes
Write-Host "💾 Committing changes..." -ForegroundColor Yellow
$commitMessage = Read-Host "Enter commit message (or press Enter for default)"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Update signup site"
}
git commit -m $commitMessage

# Push to repository
Write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
$branch = git branch --show-current
if (-not $branch) {
    $branch = "main"
    git checkout -b main
}

Write-Host ""
Write-Host "Pushing to origin/$branch..." -ForegroundColor Yellow
git push -u origin $branch

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "📊 Repository: https://github.com/impactxg-gnez/vibesbnb-signup" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Push failed. Check the error messages above." -ForegroundColor Red
    Write-Host "💡 If the remote repository has content, you may need to:" -ForegroundColor Yellow
    Write-Host "   git pull origin main --allow-unrelated-histories" -ForegroundColor Yellow
    Write-Host "   or" -ForegroundColor Yellow
    Write-Host "   git push -u origin $branch --force" -ForegroundColor Yellow
}


