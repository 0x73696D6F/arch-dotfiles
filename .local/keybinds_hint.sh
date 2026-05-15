#!/bin/bash
CONFIG_FILE="$HOME/.config/hypr/hyprland/keybinds.conf"
VARIABLES_FILE="$HOME/.config/hypr/variables.conf"

# 1. Carichiamo TUTTE le variabili da variables.conf
declare -A VARS
while IFS=' = ' read -r key value; do
    [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
    clean_key="${key//$}"
    VARS["$clean_key"]="$value"
done < <(grep -E '^\$\w+\s*=' "$VARIABLES_FILE")

# 2. Leggiamo keybinds.conf (commenti + bind)
processed=$(grep -E '^bind|^# ' "$CONFIG_FILE")

# Sostituiamo ogni variabile $NOME con il suo valore
for varname in "${!VARS[@]}"; do
    processed=$(echo "$processed" | sed "s/\$$varname/${VARS[$varname]}/g")
done

# 3. Formattiamo e passiamo a rofi
echo "$processed" | \
sed 's/^# //' | \
sed 's/^bind[a-z]*\s*=\s*//' | \
grep -v 'XF86' | \
awk -F',' '
    /^──/ { next }
    /^$/ { next }

    # Commento → salva come label
    /^[A-Z]/ && NF==1 {
        last_comment = $0
        next
    }

    # Bind: almeno 3 campi separati da virgola
    NF >= 3 {
        mod=$1; gsub(/^ +| +$/, "", mod)
        key=$2; gsub(/^ +| +$/, "", key)
        action=$3; gsub(/^ +| +$/, "", action)

        if (key == "") { next }

        if (last_comment != "") {
            label = last_comment
            last_comment = ""
        } else if (action ~ /^exec/) {
            app=$4; gsub(/^ +| +$/, "", app)
            split(app, parts, " ")
            label=parts[1]
            n=split(label, pathparts, "/")
            label=pathparts[n]
        } else {
            label=action
        }

        if (label == "") { next }

        if (mod == "") {
            print key "  →  " label
        } else {
            print mod "  " key "  →  " label
        }
        next
    }

    # Intestazioni di sezione
    { print "\n◆ " toupper($0) }
' | \
rofi -dmenu -i -p "Hyprland Keybinds:  " \
     -theme-str 'window {width: 1000px;} listview {lines: 10;}' \
     -theme ~/.config/rofi/launchers/type-1/style-3
