#!/usr/bin/env sh

# Update package registry
sudo packman -y

# Get the path of the parent directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "\nInstalling pacman packages\n"

# Filter out comments from the file containing which packages to install
for package in $(cat $DIR/pacman_pkglist.txt | egrep -v "^\s*(#|$)")
do
    # Check if the package can be found in the registry
    if [[ $(pacman -Ss "^$package\$") ]]
    then
        printf "\n------------------------- Installing $package -------------------------"
        sudo pacman -Su --needed $package
    else
        echo -e "\033[0;31mCould not find the package '$package'"
        exit 1
    fi
done
