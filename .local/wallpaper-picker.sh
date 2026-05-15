#!/bin/bash

# Configurazione percorsi
WALL_DIR="$HOME/Wallpapers"
WAYBAR_CONFIG="$HOME/.config/waybar/style.css"

# 1. Seleziona l'immagine tramite Rofi
# Elenca i file, rimuove il percorso per la visualizzazione e lo riaggiunge dopo la scelta
CHOICE=$(ls "$WALL_DIR" | rofi -dmenu -theme $HOME/.config/rofi/launchers/type-1/style-3 -i -p "Seleziona Sfondo:")

# Esci se non viene selezionato nulla
if [ -z "$CHOICE" ]; then
    exit 1
fi

FULL_PATH="$WALL_DIR/$CHOICE"

cp $FULL_PATH ~/.cache/current_wallpaper

# 2. Cambia lo sfondo con swww (con transizione fluida)
awww img "$FULL_PATH" --transition-type center --transition-step 200 --transition-fps 60

# 3. Genera i colori con Matugen
# 'mode light' o 'mode dark' a seconda delle preferenze
matugen -m dark --contrast -0.2 -t scheme-fidelity --source-color-index 0 image "$FULL_PATH"

# 4. Aggiorna Waybar
# Matugen di solito genera un file in ~/.cache/matugen/colors.css
# Assicurati che il tuo style.css della Waybar importi quel file:
# @import "../../.cache/matugen/colors.css";

~/.config/waybar/launch.sh
