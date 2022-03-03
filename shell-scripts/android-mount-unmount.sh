#!/bin/bash
jmtpfs -l | grep -i -e mtp -e mtk -e mediatek -e samsung -e htc -e motorolla -e nokie -e plus -e pine 2>&1 >/dev/null
if [[ $? == 0 ]]; then
	if [[ $(id -u) == 0 ]]; then
		echo "WHY THE HELL ARE YOU RUNNING THIS AS ROOT?"
		exit 1
	else
		if [[ $(ls /home/$USER/phone) = "" ]]; then
			jmtpfs /home/$USER/phone 2>&1 >/dev/null
			if [[ $? = 0 ]]; then
				echo "Phone mounted successfully"
			else
				echo "Something went wrong while mounting Android fs..."
			fi
		else
			echo "Unmounting Android phone.."
			fusermount -u /home/$USER/phone 2>&1 >/dev/null
			if [[ $(ls /home/$USER/phone) = "" ]]; then
				echo "Android unmounted properly"
			else
				echo "Android isn't unmounted properly, better to check that out manually"
			fi
		fi
	fi
else
	echo "No Android phone seems to be mounted or plugged in atm"
	exit 255
fi
