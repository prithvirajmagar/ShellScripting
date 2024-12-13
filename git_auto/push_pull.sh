#!/bin/bash

# Folder where the repository is located
REPO_DIR="/path/to/your/repo"
cd "$REPO_DIR" || { echo "Directory not found"; exit 1; }

# Check for uncommitted changes and pull the latest changes
if ! git diff-index --quiet HEAD --; then
    echo "You have uncommitted changes. Please commit them first."
    exit 1
fi

# Pull latest changes
echo "Pulling the latest changes from the remote..."
git pull origin main || { echo "Failed to pull changes"; exit 1; }

# Adding changes (you can customize the files or paths here)
echo "Adding changes..."
git add .

# Prompt for commit message
read -p "Enter commit message: " commit_message

# Commit changes
git commit -m "$commit_message" || { echo "Failed to commit changes"; exit 1; }

# Push changes
echo "Pushing changes to the remote repository..."
git push origin main || { echo "Failed to push changes"; exit 1; }

echo "Git automation process completed successfully."
