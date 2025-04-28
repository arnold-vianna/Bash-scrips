#!/bin/bash

# Install PostgreSQL
echo "Installing PostgreSQL..."
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

# Enable and start PostgreSQL service
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Create the database and user
echo "Setting up PostgreSQL database and user..."
sudo -u postgres psql -c "CREATE DATABASE drupal;"
sudo -u postgres psql -c "CREATE USER postcat WITH PASSWORD '6qKy]P9XGDh6qKy]P9XGDh';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE drupal TO postcat;"

# Pull the latest Drupal Docker image
echo "Pulling the latest Drupal Docker image..."
docker pull drupal

# Create a Docker network for PostgreSQL and Drupal
echo "Creating Docker network..."
docker network create drupal-network

# Run PostgreSQL Docker container
echo "Running PostgreSQL Docker container..."
docker run --name drupal-postgres --network drupal-network -e POSTGRES_DB=drupal -e POSTGRES_USER=postcat -e POSTGRES_PASSWORD=6qKy]P9XGDh6qKy]P9XGDh -d postgres

# Run Drupal Docker container
echo "Running Drupal Docker container..."
docker run --name drupal --network drupal-network -p 8080:80 -d drupal

# Script completion message
echo "PostgreSQL and Drupal setup completed!"
echo "You can access Drupal at http://localhost:8080"
