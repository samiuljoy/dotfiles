#!/bin/sh

# Variables

browser_dir="$HOME/browsers/firefox"
executable="$browser_dir/firefox"

if [ -z "$DISPLAY" ]; then
	echo "xserver is not running"
	echo "exiting"
	exit 1
else
	if [ $(id -u) = 0 ]; then
		notify-send "Don't launch browser as root"
		exit 1
	else
		if [ -d "$browser_dir" ] && [ -x "$executable" ]; then
			$executable
		else
			notify-send "$browser_dir not found"
			exit 1
		fi
	fi
fi
