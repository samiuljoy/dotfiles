#!/bin/sh
if [ -z "$DISPLAY" ]; then
	echo "no graphical environment"
	echo "exiting"
	exit 1
else
	notify-send "$(whoami)"
fi
