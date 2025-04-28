#!/bin/bash

# Exit on error
set -e

# Define variables
GITEA_DIR="/srv/gitea"
GITEA_CONTAINER_NAME="gitea"
DOCKER_COMPOSE_FILE="$GITEA_DIR/docker-compose.yml"

# Create directories for Gitea
echo "Creating directories for Gitea..."
sudo mkdir -p $GITEA_DIR/data
sudo chown -R 1000:1000 $GITEA_DIR

# Create a Docker Compose file
echo "Creating Docker Compose file..."
cat <<EOL | sudo tee $DOCKER_COMPOSE_FILE > /dev/null
version: "3"

services:
  gitea:
    image: gitea/gitea:latest
    container_name: $GITEA_CONTAINER_NAME
    environment:
      - USER_UID=1000
      - USER_GID=1000
      - GITEA__database__DB_TYPE=sqlite3
      - GITEA__database__PATH=/data/gitea.db
    ports:
      - "3000:3000"
      - "2222:22"
    volumes:
      - $GITEA_DIR/data:/data
    restart: always
EOL

# Start the Docker Compose stack
echo "Starting Gitea via Docker Compose..."
sudo docker-compose -f $DOCKER_COMPOSE_FILE up -d

# Output success message
echo "Gitea has been successfully installed and is running with SQLite as the database!"
echo "Access it at: http://localhost:3000"
echo "SSH access: ssh://localhost:2222"
