#!/bin/bash

# install needed in order to run the following lines
sudo pacman -S reflector rsync

~/.scripts/packages/update_mirrorlist.sh
~/.scripts/packages/install.sh
