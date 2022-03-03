#!/bin/sh
pactl set-sink-volume @DEFAULT_SINK@ -5% && notify-send -t 800 "Volume = $(amixer get Master | sed -n '6 p' | awk '{ print $5 }' | sed 's/\[//g' | sed 's/\]//g')"
