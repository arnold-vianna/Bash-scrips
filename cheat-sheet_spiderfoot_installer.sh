#!/bin/bash

# Step 1: Pull the Docker image for cheat_sheet
echo "Pulling Docker image for cheat_sheet..."
docker pull arnoldvianna/cheat_sheet

# Step 2: Run the Docker container with restart always option
echo "Running the cheat_sheet container..."
docker run -d --restart always -p 5051:5000 arnoldvianna/cheat_sheet

# Step 3: Clone the SpiderFoot GitHub repository
echo "Cloning SpiderFoot repository..."
git clone https://github.com/smicallef/spiderfoot.git

# Step 4: Navigate to the SpiderFoot directory
cd spiderfoot

# Step 5: Build the Docker container for SpiderFoot
echo "Building the SpiderFoot Docker container..."
docker build -t spiderfoot .

# Step 6: Run the SpiderFoot Docker container with restart always option
echo "Running the SpiderFoot container..."
docker run -d --restart always -p 5001:5001 spiderfoot
