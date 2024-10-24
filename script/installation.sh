#!/bin/bash

# Update and install Apache, MySQL, PHP

sudo apt update

sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql -y



# Install OpenSSH Server

sudo apt install openssh-server -y



# Install IPTables and Snort

sudo apt install iptables snort -y

sudo apt install iptables-persistent -y

# Install Git
sudo apt install git -y

# Verify Git installation
git --version
if [ $? -eq 0 ]; then
    echo "Git successfully installed!"
else
    echo "Git installation failed."
    exit 1
fi

# Enable Apache and MySQL services

sudo systemctl start apache2

sudo systemctl enable apache2

sudo systemctl start mysql

sudo systemctl enable mysql



echo "Installation complete."