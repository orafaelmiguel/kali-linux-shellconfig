#!/bin/bash

if [ "$EUID" -ne 0  ]; then
	echo "Root"
	exit 1
fi

echo "Starting SSH service..."
systemctl enable ssh
systemctl start ssh

echo "Allow routes via SSH? (y/n)"
read -r choice
if [ "$choice" == "y"  ]; then
	echo "Allowing remote conection..."
	ufw allow 22/tcp
fi

echo "SSH Status:"
systemctl status ssh --no-pager 
