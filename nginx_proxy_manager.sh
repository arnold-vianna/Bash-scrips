#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Installing Nginx Proxy Manager via Docker...${NC}"

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker if not installed
if ! command -v docker &> /dev/null
then
    echo -e "${GREEN}Installing Docker...${NC}"
    curl -fsSL https://get.docker.com | sudo sh
    sudo systemctl enable docker
    sudo systemctl start docker
else
    echo -e "${GREEN}Docker is already installed.${NC}"
fi

# Install Docker Compose if not installed
if ! command -v docker-compose &> /dev/null
then
    echo -e "${GREEN}Installing Docker Compose...${NC}"
    sudo curl -L "https://github.com/docker/compose/releases/download/2.24.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo -e "${GREEN}Docker Compose is already installed.${NC}"
fi

# Create directory for Nginx Proxy Manager
INSTALL_DIR="$HOME/nginx-proxy-manager"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Create docker-compose.yml
cat << EOF > docker-compose.yml
version: '3'
services:
  npm:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'  # UI interface
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOF

echo -e "${GREEN}docker-compose.yml created successfully.${NC}"

# Start the container
echo -e "${GREEN}Starting Nginx Proxy Manager container...${NC}"
sudo docker-compose up -d

echo -e "${GREEN}Nginx Proxy Manager is now running!${NC}"
echo -e "${GREEN}Access it via http://<your-server-ip>:81${NC}"
echo -e "${GREEN}Default login -> Email: admin@example.com | Password: changeme${NC}"
