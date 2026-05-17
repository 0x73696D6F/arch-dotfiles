# My Arch Linux Configuration

## Overview

The first thing I want to say is that I spent a lot of time building a **dynamic color system**. I really enjoy changing wallpapers, so I wanted a setup where switching the background automatically updates the colors across my entire environment (Hyprland, Waybar, Fish, Rofi, etc.).

I didn’t find many clear guides online, so I hope this repository can help someone who is starting from scratch, just like I was.
![demo video](https://youtu.be/1RmAv2pqaDE)
## Packages I Use

* Hyprland
* Waybar
* Rofi
* Matugen (for extracting colors from images)
* Fish (shell)
* Kitty
* Zen Browser
* spotify_player (might change in the future)
* swayosd
* swaync

## Hyprland

This is the part I customized the least. I previously used *caelestia-shell* and started from the dotfiles in the caelestia-dotfiles repository.

I kept the original structure but modified everything and removed all caelestia-specific parts. If you want to see how it looks, check out the video preview.

## Waybar

I found this Waybar configuration somewhere on GitHub and only made small changes, mainly related to colors. The overall layout is mostly unchanged.

## Rofi

For Rofi, I mostly copied an existing configuration I found online. [@adi1090x](https://github.com/adi1090x)

## Matugen

This is the part I built myself. I’m not sure if it’s the best approach, but it works well for me.

If you’re interested in dynamic colors that adapt to your wallpaper:

* Check `.config/matugen` for the configuration
* Look at `.local/bin/WallpaperPicker.sh`, which uses Rofi as a menu to select an image from `~/Wallpapers`

By reading the Matugen config, you’ll understand how colors are generated and where the output files are placed.

## Fish

This configuration is based on the caelestia setup, but I modified and extended it to fit my needs.

## Recap

Overall, my setup is fairly simple. The most “complex” part is Matugen, since it generates multiple color files for different components (Fish, spotify_player, Rofi, Waybar, Hyprland, etc.).

If the file paths are not set correctly, things won’t work as expected—so make sure to double-check them.
