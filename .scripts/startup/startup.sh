#!/bin/bash 

# Start compositor.
picom -b

# Setup the arandr monitor layout AFTER compositor and BEFORE wallpaper.
#~/.screenlayout/default_double_monitor.sh

# Set wallpaper AFTER compositor.
# nice pics: Cyber_City_Blender.png Cloud_2_Nord.png Rocket.png
feh --bg-fill ~/.wallpapers/Cyber_City_Blender.jpg

# Launch polybar.
~/.config/polybar/launch.sh

# Update weather schedule.
python ~/.config/polybar/scripts/update_weather.py

# Environment variables.
export $EDITOR="nvim"
