#!/usr/bin/env sh

if [ -z "$DISPLAY" ]; then
	echo "no display server running"
	echo "exiting"
	exit 1
else
	pidof compton >/dev/null
	if [ $? = 0 ]; then
		pkill compton
	else
		compton &
	fi
fi
