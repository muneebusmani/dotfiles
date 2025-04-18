#!/bin/bash

while true; do
	nitrogen --restore
	sleep 1800
	WALLPAPER_DIR="$HOME/wallpapers/wallpapers"
	mapfile -t FILES < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \))
	RANDOM_FILE="${FILES[RANDOM % ${#FILES[@]}]}"
	nitrogen --set-zoom-fill "$RANDOM_FILE" --save
done
