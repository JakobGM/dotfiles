#!/usr/bin/env sh

# Get the path of the parent directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "\nInstalling pacman packages\n"
sudo pacman -Syu --needed --noconfirm $(cat $DIR/pacman_pkglist.txt | egrep -v "^\s*(#|$)")
