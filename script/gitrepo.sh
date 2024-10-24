#!/bin/bash

# Variables
REPO_URL="https://github.com/Alexisb710/cit480-project.git" 
TARGET_DIR="/var/www/html/"  # default for apache
NEW_DIR_NAME="cit480-project"  # Name for the new folder

# Create a new target directory for the repository
NEW_TARGET_DIR="${TARGET_DIR}${NEW_DIR_NAME}/"

# Check if the new target directory exists, if not, create it
if [ ! -d "$NEW_TARGET_DIR" ]; then
    echo "Creating new directory for the repository..."
    sudo mkdir -p "$NEW_TARGET_DIR"
fi

# Navigate to the new target directory
cd "$NEW_TARGET_DIR"

# Clone the repository
echo "Cloning the repository..."
sudo git clone "$REPO_URL" .

echo "Deployment completed successfully!"
