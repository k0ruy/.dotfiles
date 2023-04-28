#!/bin/bash

# Clone.
sudo pacman -S git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir ~/.dotfiles
config clone --bare https://github.com/k0ruy/.dotfiles ~/.dotfiles/
config checkout -f

find ~/.scripts/install/ -type f -iname "*.sh" -exec chmod +x {} \;

# Run main install script.
~/.scripts/install/install.sh
