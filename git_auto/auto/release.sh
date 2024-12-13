#!/bin/bash

# Define variables
REPO_DIR="/path/to/your/repo"
VERSION="$1"  # Get version number as the first argument

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

cd "$REPO_DIR" || { echo "Repository directory not found"; exit 1; }

# Create a new tag for the release
echo "Creating a new release tag: v$VERSION"
git tag -a "v$VERSION" -m "Release version $VERSION" || { echo "Tag creation failed"; exit 1; }

# Push the new tag to the remote repository
echo "Pushing the tag to the remote repository..."
git push origin "v$VERSION" || { echo "Failed to push the tag"; exit 1; }

# Optionally create a release archive
echo "Creating release archive..."
git archive -o "release-v$VERSION.tar.gz" HEAD || { echo "Archive creation failed"; exit 1; }

echo "Release $VERSION created successfully."
