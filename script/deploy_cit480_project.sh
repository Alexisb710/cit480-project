#!/bin/bash

# Variables
REPO_URL="https://github.com/Alexisb710/cit480-project.git"
DEST_DIR="/var/www/html"

# Remove existing content from the Apache web directory (optional, be cautious)
echo "Removing old website files from $DEST_DIR ..."
sudo rm -rf $DEST_DIR/*

# Clone the GitHub repository into a temporary directory
TMP_DIR=$(mktemp -d)
echo "Cloning repository from $REPO_URL into $TMP_DIR ..."
git clone $REPO_URL $TMP_DIR

# Move the content from the cloned repository to the Apache web directory
echo "Moving files to $DEST_DIR ..."
sudo mv $TMP_DIR/* $DEST_DIR

# Set appropriate permissions for Apache
echo "Setting correct permissions for Apache..."
sudo chown -R www-data:www-data $DEST_DIR
sudo chmod -R 755 $DEST_DIR

# Remove the temporary directory
rm -rf $TMP_DIR

echo "Website files have been deployed to $DEST_DIR."
