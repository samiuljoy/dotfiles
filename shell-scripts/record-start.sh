#!/usr/bin/env sh
if [ $(id -u) = 0 ]; then
	notify-send -t 3000 "Don't run ffmpeg as root"
	exit 1
else 
	if [ -z "$DISPLAY" ]; then
		echo "Xserver is not running"
		echo "exiting"
		exit 1
	else
		pidof ffmpeg
		case "$?" in
			1 ) ffmpeg -f x11grab -s 1280x1024 -i :0.0 /home/$USER/Videos/screen-record/"$(date +%d-%m-%Y-%T | tr ':' '-')".mkv &
				[ "$?" = 0 ] && notify-send -t 300 "x11grab" || notify-send "error x11rgab"
				;;
			0 ) notify-send "ffmpeg is already running"
				exit 1
				;;
		esac
	fi
fi
