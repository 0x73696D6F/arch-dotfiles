#!/bin/bash

# Config path
WALL_DIR="$HOME/Wallpapers"
WAYBAR_CONFIG="$HOME/.config/waybar/style.css"

# Image selector with rofi
CHOICE=$(ls "$WALL_DIR" | rofi -dmenu -theme $HOME/.config/rofi/launchers/type-1/style-3 -i -p "Select a Wallpaper:")

# If nothing selected quit
if [ -z "$CHOICE" ]; then
    exit 1
fi

FULL_PATH="$WALL_DIR/$CHOICE"

cp $FULL_PATH ~/.cache/current_wallpaper

# Changing background
awww img "$FULL_PATH" --transition-type center --transition-step 200 --transition-fps 60

# Generating color with matugen
matugen -m dark --contrast -0.2 -t scheme-fidelity --source-color-index 0 image "$FULL_PATH"

# reload waybar
~/.config/waybar/launch.sh

# reaload swayosd server
~/.local/bin/reload_swayosd.sh
