#!/bin/sh
if [ -z "$DISPLAY" ]; then
	echo "no display server running"
else
	pactl set-sink-mute @DEFAULT_SINK@ toggle && notify-send -t 2000 "toggled mute"
fi

