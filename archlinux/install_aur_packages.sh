#!/usr/bin/env sh

# Get the path of the parent directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "\nInstalling AUR packages\n"

# Filter out comments from the file containing which packages to install
for package in $(cat $DIR/aur_pkglist.txt | egrep -v "^\s*(#|$)")
do
    # Check if the package can be found in the registry
    if [[ $(yaourt -Ss -q $package | egrep ^${package}$) ]]
    then
        printf "\n------------------------- Installing $package -------------------------"
        yaourt -S --needed $package
    else
        echo -e "\033[0;31mCould not find the package '$package'!"
        exit 1
    fi
done
