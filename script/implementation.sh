#!/bin/bash

# Set up basic IPTables firewall rules

iptables -F

iptables -A INPUT -i lo -j ACCEPT

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j ACCEPT    # Allow HTTP

iptables -A INPUT -p tcp --dport 443 -j ACCEPT   # Allow HTTPS

iptables -A INPUT -p tcp --dport 22 -j ACCEPT    # Allow SSH

iptables -P INPUT DROP

iptables -P FORWARD DROP

iptables -P OUTPUT ACCEPT



# Save IPTables rules

iptables-save > /etc/iptables/rules.v4



# Start Snort in IDS mode

sudo snort -A console -i enp0s3 -c /etc/snort/snort.conf &



echo "Implementation complete."