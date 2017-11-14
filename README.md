# JakobGM's dotfiles
## Screenshots
Neovim:
![screenshot 2017-11-14 23 25 37](https://user-images.githubusercontent.com/10655778/32808394-2fed56be-c993-11e7-87b3-ac4aed0ecf7d.png)

## Features

Dotfiles for a workflow which focuses on:

* The text editor `Neovim`, customized for IDE-like behaviour.
* Python3, R, and shell development.
* Zsh-shell in the Tmux-multiplexer.
* Both MacOS and Linux support.
* Brew for packages management.


## Installation
Run the following commands in the terminal:

```{bash}
# Clone the repository to your homefolder
git clone https://github.com/JakobGM/dotfiles.git ~/.dotfiles

# Run the initialize script
~/.dotfiles/scripts/init.sh
```

This symlinks the most common configuration files into your home folder.

It also places the program `jgm` into your path, which allows you to install additional components.
