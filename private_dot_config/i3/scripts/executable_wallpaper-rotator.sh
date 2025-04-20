#!/bin/bash

LOCK_IMG="/tmp/i3lock_blur_cache.png"
WALLPAPER_DIR="$HOME/wallpapers/wallpapers"

# Function to blur and cache the current wallpaper
cache_blurred_wallpaper() {
	WALLPAPER=$(grep '^file=' ~/.config/nitrogen/bg-saved.cfg | cut -d'=' -f2-)

	if [ -f "$WALLPAPER" ]; then
		# Blur and cache the wallpaper
		convert "$WALLPAPER" -resize 1920x1080^ -gravity center -extent 1920x1080 -blur 5x4 "$LOCK_IMG"
	fi
}

# Initial blur of the current wallpaper
cache_blurred_wallpaper

while true; do
	nitrogen --restore
	sleep 1800 # Wait for 30 minutes

	# Select new wallpaper from directory
	mapfile -t FILES < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \))
	RANDOM_FILE="${FILES[RANDOM % ${#FILES[@]}]}"

	# Change wallpaper and cache the blurred version
	nitrogen --set-zoom-fill "$RANDOM_FILE" --save

	# Cache the blurred version of the new wallpaper
	cache_blurred_wallpaper
done
