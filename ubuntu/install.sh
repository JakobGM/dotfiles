#!/bin/bash
# TODO: Everything
# Install all packages in $repo/ubuntu/packages.txt
# See https://askubuntu.com/questions/541781/install-list-of-packages-using-apt-get

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:keithw/mosh
sudo apt-get update
sudo apt-get install mosh

xargs sudo apt-get -y install < packages.txt
