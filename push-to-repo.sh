#!/bin/bash

# Bash script to push signup site to GitHub repository
# Usage: ./push-to-repo.sh

echo "🚀 Pushing VibesBNB Signup Site to GitHub..."
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Run 'git init' first."
    exit 1
fi

# Check if remote exists
if ! git remote get-url origin &>/dev/null; then
    echo "📡 Adding remote repository..."
    git remote add origin https://github.com/impactxg-gnez/vibesbnb-signup.git
fi

# Stage all files
echo "📦 Staging files..."
git add .

# Check if there are changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ No changes to commit."
    exit 0
fi

# Commit changes
echo "💾 Committing changes..."
read -p "Enter commit message (or press Enter for default): " commit_message
if [ -z "$commit_message" ]; then
    commit_message="Update signup site"
fi
git commit -m "$commit_message"

# Push to repository
echo "📤 Pushing to GitHub..."
branch=$(git branch --show-current)
if [ -z "$branch" ]; then
    branch="main"
    git checkout -b main
fi

echo ""
echo "Pushing to origin/$branch..."
git push -u origin "$branch"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo "📊 Repository: https://github.com/impactxg-gnez/vibesbnb-signup"
else
    echo ""
    echo "❌ Push failed. Check the error messages above."
    echo "💡 If the remote repository has content, you may need to:"
    echo "   git pull origin main --allow-unrelated-histories"
    echo "   or"
    echo "   git push -u origin $branch --force"
fi

