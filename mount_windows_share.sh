#!/bin/bash

# Prompt user for username, password, and paths
read -p "Enter your Windows username: " USERNAME
read -s -p "Enter your Windows password: " PASSWORD
echo
read -p "Enter the Windows shared folder path (e.g., //DESKTOP-296KQG7/New folder): " WINDOWS_SHARE_PATH
read -p "Enter the local mount point path: " MOUNT_POINT

# Create the mount point directory if it doesn't exist
if [ ! -d "$MOUNT_POINT" ]; then
    mkdir -p "$MOUNT_POINT"
fi

# Mount the Windows shared folder
sudo mount -t cifs -o username="$USERNAME",password="$PASSWORD" "$WINDOWS_SHARE_PATH" "$MOUNT_POINT"

echo "Windows shared folder mounted at $MOUNT_POINT"
