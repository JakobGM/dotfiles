#!/usr/bin/env sh

# Get the path of the parent directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "\nInstalling AUR packages\n"
yaourt -S --needed $(cat $DIR/aur_pkglist.txt | egrep -v "^\s*(#|$)")
