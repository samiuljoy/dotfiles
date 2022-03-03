#!/usr/bin/env sh
if [ -z "$DISPLAY" ]; then
	echo "no display server running"
	echo "exiting"
	exit 1
else
	pidof xcompmgr >/dev/null
	if [ $? = 0 ]; then
		pkill xcompmgr
	else
		xcompmgr -c -o.50 &
	fi
fi
