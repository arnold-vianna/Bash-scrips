#!/bin/bash

# Ask for GitHub username
read -p "Enter your GitHub username: " USERNAME

# Ask for personal access token
read -s -p "Enter your personal access token: " TOKEN
echo ""

# Ask for repository name
read -p "Enter the repository name: " REPO

# Set the remote URL with the token
REMOTE_URL="https://${USERNAME}:${TOKEN}@github.com/${USERNAME}/${REPO}.git"

# Check if file path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide the file path as an argument."
    exit 1
fi

# Navigate to the provided directory
DIRECTORY="$1"

# Check if the directory is a Git repository
if [ ! -d "$DIRECTORY/.git" ]; then
    echo "Error: Not a Git repository."
    exit 1
fi

# Change directory to the provided directory
cd "$DIRECTORY" || exit

# Add changes to the staging area
git add .

# Commit changes with a default message
git commit -m "Update repository"

# Push changes to the remote repository using the token and push to main branch
git push "${REMOTE_URL}" main
