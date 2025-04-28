#!/bin/bash

# Update the package index
echo "Updating package index..."
sudo apt update -y

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker.io

# Enable and start Docker service
echo "Enabling and starting Docker service..."
sudo systemctl enable docker --now

# Install Docker Compose
echo "Installing Docker Compose..."
sudo apt install -y docker-compose

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version
docker-compose --version

echo "Docker and Docker Compose have been installed successfully."
