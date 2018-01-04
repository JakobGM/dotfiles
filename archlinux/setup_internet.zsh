#!/usr/bin/zsh

# Start the NetworkManager service which handles connections
systemctl start NetworkManager.service

# Add your user to the wheel group in order to be able to edit
# internet connections without giving your password
sudo usermod -a -G wheel $USER
