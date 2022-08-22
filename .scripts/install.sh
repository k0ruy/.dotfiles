#!/bin/bash

# Update package.
sudo pacman -Syu

# Make the function keys on the keyboard default.
# (This is currently specific to my keychron keyboard)
FILE=/etc/modprobe.d/hid_apple.conf
sudo touch $FILE
sudo sh -c "echo 'options hid_apple fnmode=2' >> $FILE"

# Essentials.
sudo pacman -S git base-devel --no-confirm

# Install yay.
git clone https://aur.archlinux.org/yay.git ~/GitHub/yay/
cd ~/GitHub/yay/ && makepkg -si --no-confirm && cd ~

# Use yay to get pamac.
# yay -S libpamac-aur pamac-all # The full version is not currently building.
yay -S libpamac-aur pamac-aur
sudo pacman -Syu polkit-gnome
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# Browser.
# Keep firefox since some programs use it by default.
# (for example cargo)
sudo pamac install firefox brave-bin --no-confirm

# Office.
sudo pamac install onlyoffice-bin xournalpp --no-confirm

# Some aesthetic stuff.
sudo pamac install cmatrix bonsai.sh-git pipes.sh lolcat shell-color-scripts --no-confirm

# Fonts.  This is very large, maybe use smaller package.
sudo pamac install nerd-fonts-complete --no-confirm

# Utilities.
sudo pamac install btop nvtop lazygit flameshot brightnessctl pfetch bottom --no-confirm

# Icons.
sudo pamac install papirus-icon-theme --no-confirm

# Bootloader.
sudo pamac install refind --no-confirm
refind-install

# LY Login manager.
sudo pamac install ly --no-confirm

# SDDM Login Manager
sudo pamac install sddm-sugar-dark sddm-sugar-candy-git archlinux-tweak-tool-git -no-confirm
sudo touch /etc/sddm.conf
sudo sh -c "echo '[Theme]' >> /etc/sddm.conf"
sudo sh -c "echo 'Current=Sugar-Candy' >> /etc/sddm.conf"
sudo cp ~/.wallpapers/wall_secondary.png /usr/share/sddm/themes/Sugar-Candy/

# Required for Gnome extensions.
sudo pamac install gnome-browser-connector --no-confirm

# Enable BT on startup.
sudo sed -i 's/#AutoEnable=false/AutoEnable=true/g' /etc/bluetooth/main.conf

# Terminal.
sudo pamac install alacritty --no-confirm

# Coding stuff.
sudo pamac install neovim neovide xclip --no-confirm
# Install plugin for nvim.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo pamac install github-desktop github-cli code --no-confirm

# Communication.
sudo pamac install whatsapp-nativefier discord signal-desktop --no-confirm

# i3 stuff.
sudo pamac install feh cronie rofi-greenclip picom-pijulius-git polybar --no-confirm

# Programming.
sudo pamac install julia-bin cmake --no-confirm

# Setup optimus manager.
# NB: For Nvidia cards only!
sudo pamac install optimus-manager gdm-prime nvidia-settings nvidia-force-composition-pipeline --no-confirm 
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf
sudo sed -i 's/DisplayCommand/#DisplayCommand/g' /etc/sddm.conf
sudo sed -i 's/DisplayStopCommand/#DisplayStopCommand/g' /etc/sddm.conf
sudo touch /etc/optimus-manager/optimus-manager.conf 
sudo sh -c "echo '[optimus]' > /etc/optimus-manager/optimus-manager.conf" 
sudo sh -c "echo 'startup_mode=hybrid' > /etc/optimus-manager/optimus-manager.conf" 
nvidia-force-composition-pipeline

# Setup fish (shell).
sudo pamac install fish --no-confirm
fish <<'END_FISH'
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
	fisher install IlanCosman/tide@v5t
END_FISH
