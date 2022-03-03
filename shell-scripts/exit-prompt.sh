#!/bin/sh
prompt="$(zenity --title="Exit prompt" --list --column="0" "exit" "reboot" "poweroff" "lock" "suspend" --hide-header)"

case "$prompt" in
	"exit") sleep 1 && pkill X
		;;
	"reboot") sleep 1 && systemctl reboot
		;;
	"poweroff") sleep 1 && systemctl poweroff
		;;
	"lock") sleep 1 && pkill dwm
		;;
	"suspend") sleep 1 && systemctl suspend
		;;
	*) exit 1
		;;
esac
