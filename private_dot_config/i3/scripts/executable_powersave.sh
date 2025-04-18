#!/bin/bash

PICOM_CONFIG="$HOME/.config/picom.conf"
PICOM_CONFIG_PS="/etc/xdg/picom.conf"

if pgrep -x "picom" >/dev/null; then
	killall picom
	killall xborders
	picom --config "$PICOM_CONFIG_PS"
else
	picom --config "$PICOM_CONFIG" &
	xborders &
fi
