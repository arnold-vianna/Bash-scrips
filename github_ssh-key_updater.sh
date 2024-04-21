#!/bin/bash

# Ask for GitHub username
read -p "Enter your GitHub username: " USERNAME

# Set the repository name
read -p "Enter the repository name: " REPO

# Set the remote URL with SSH
REMOTE_URL="git@github.com:${USERNAME}/${REPO}.git"

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

# Push changes to the remote repository using SSH
git push "${REMOTE_URL}" main
