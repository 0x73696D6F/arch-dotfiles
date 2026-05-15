#!/bin/bash

CURRENT=$(hyprctl getoption general:layout | grep -oP '(?<=str: )\w+')

if [ "$CURRENT" = "dwindle" ]; then
    hyprctl keyword general:layout scrolling
    notify-send -i "input-mouse" "Layout" "Scrolling" \
        -h string:synchronous:layout
else
    hyprctl keyword general:layout dwindle
    notify-send -i "view-grid" "Layout" "Dwindle" \
        -h string:synchronous:layout
fi
