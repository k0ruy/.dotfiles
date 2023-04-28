# .dotfiles

THIS FORK IS A MODIFIED VERSION TO WORK FOR MY NEEDS, I ENCOUNETERD PROBLEMS WHILE INSTALLING WITH THE ORIGINAL SCRIPTS, SO I MODIFIED THEM.

I suggest to install `yay` (https://www.makeuseof.com/install-and-use-yay-arch-linux/) to install packages that are not available with pacman 
the most important packages are:
`fish pfetch betterlockscreen btop cronie dunst exa feh git github-cli neovim nvim-packer picom polybar powertop pulseaudio rofi reflector rsync tlp ttf-jetbrains-mono-nerd rustup cargo`

Since the original uses a loadshedding file, and where I live there isn't loadshedding, I opted to include weather using OpenWeatherMap API. If you want to use it you will have to create an account and ask for an API key, then substitute the key inside the `~/.config/polybar/scripts/weather.py` file, making sure to change your city of interest too (change it also in the `update_weather.py` file in the same directory).

In the bottom bar I changed the internet settings, since I dont have Wi-Fi on my desktop I changed to work with wired.

To make the gpu info work (BTW I have a radeon one, so maybe this is not for you) you have to add this line `<yourUsername> ALL=NOPASSWD: /usr/bin/cat` to your `/etc/sudoers.d/myOverrides` (it's probably named in another way), using the command `sudo visudo -f /etc/sudoers.d/myOverrides`. I know this isnt really secure, but is allowing just to run the cat command without password.

basically your file inside `/etc/sudoers.d/myOverrides` should contain this:
```txt
username ALL=(ALL:ALL) ALL
username ALL=(ALL:ALL) NOPASSWD: /usr/bin/cat
```
*Source: https://askubuntu.com/questions/504652/adding-nopasswd-in-etc-sudoers-doesnt-work*

Below I put an image of the updated desktop.


*Empty desktop with my modified coinfiguration:*
![empty](https://user-images.githubusercontent.com/71659265/235173355-8df2e8b3-27da-4d5c-ac6e-f6b0ab8a1044.png)

The configuration files for my Linux desktop.  Supports Arch based distros using Gnome and/or i3. 

# Installation

> ⚠️ &nbsp; Sadly you will have to do this manually:

```bash
# Clone.
sudo pacman -S git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir ~/.dotfiles
config clone --bare https://github.com/k0ruy/.dotfiles ~/.dotfiles/
config checkout -f

find ~/.scripts/install/ -type f -iname "*.sh" -exec chmod +x {} \;

# Run main install script.
~/.scripts/install/install.sh
```

# Theme

The theme is based on my Neovim plugin, [nordic.nvim](https://github.com/AlexvZyl/nordic.nvim).  It is a warmer and darker version of the [Nord](https://www.nordtheme.com/) color palette.

# Showcase

Some screenshots showing off the desktop and rice, as well as some custom features I wrote.  Everything has to be *just right*.  I am spending 8+ hours a day on this working, so it might as well be a nice experience.

> ⚠️ &nbsp; Some of these are outdated, I will update them at a later stage.

<details>

<summary>Overview</summary>

</br>

Wallpapers can be found at [this ImageGoNord repo](https://github.com/linuxdotexe/nordic-wallpapers) (they "norded" some nice wallpapers) and [locally](https://github.com/AlexvZyl/.dotfiles/tree/main/.wallpapers).


*Notifications via [dunst](https://github.com/dunst-project/dunst):*
![image](https://user-images.githubusercontent.com/71659265/235106355-a28a93b4-d816-47e2-af53-dc28664d6d8e.png)

*Launcher via [rofi](https://github.com/adi1090x/rofi) (cant screenshot on my setup, this is the original image from AlexvZyl):*
![image](https://user-images.githubusercontent.com/81622310/211895894-663f3480-d2d9-4546-8f1b-04217cb2dd75.png)

*Powermenu via [rofi](https://github.com/adi1090x/rofi) (cant screenshot on my setup, this is the original image from AlexvZyl):*
![image](https://user-images.githubusercontent.com/81622310/211911407-050741e9-d7d7-412c-ac12-044f002e8b6f.png)

</details>

# Key Bindings

A few notes on the bindings:

- Keys combined with the `Super` key are reserved for OS and WM related actions.  
- Arrows and `hjkl` keys are interchangeable.

<details>

<summary>Bindings table</summary>

</br>

|  Binding  |  Action   |
| :-------: | :-------: |
| Super + d | App launcher |
| Super + p | Powermenu |
| Super + t | Terminal |
| Super + n | Neovim |
| Super + b | BTop++ |
| Super + g | NVtop |
| Super + R | Toggle read mode |
| Super + tab | Windows |
| Super + Arrow | Cycle windows |
| Super + Shift + Arrow | Move window |
| Super + Number | Go to workspace |
| Super + r | Newsboat |
| Super + w | iwctl |

</details>

# Neovim Config

This [config](https://github.com/AlexvZyl/.dotfiles/tree/main/.config/nvim) has a decent amount of work and is basically a fully fledged IDE.  Why didn't I use [LunarVim](https://github.com/LunarVim/LunarVim), [NvChad](https://github.com/NvChad/NvChad) or [SpaceVim](https://github.com/liuchengxu/space-vim)?  I like doing things myself.

To configure neovim ***in theory*** should be enough to open `nvim` in a terminal and running `:PackerSync`.

> ℹ️ &nbsp; I try to keep all of the key bindings in [this file](https://github.com/AlexvZyl/.dotfiles/blob/main/.config/nvim/lua/alex/key-bindings.lua).

![image](https://user-images.githubusercontent.com/81622310/233982609-f9c15e39-da60-43d8-8c5c-4761db95ad9d.png)

