#!/usr/bin/env sh
filename="diary.log"
file_path="$HOME/note-to-self/$filename"
if [ -f "$file_path" ]; then
	echo >> $file_path
	echo "=================================" >> $file_path
	echo "$(date)" >> $file_path
	echo "=================================" >> $file_path
	echo >> $file_path
	vi $file_path
else
	echo "File doesn't exist, would you like to create one? "
	read ans
	case "$ans" in
		Y|y|yes ) touch $file_path
			case "$?" in
				0 ) echo "Created diary.log under $file_path"
					echo "re-run diary.sh to start writing your logs"
					;;
				* ) echo "Something went wrong while creating diary.log in $file_path"
					;;
			esac
			;;
		n|no|No|N ) exit
			;;
		* ) echo "Invalid input"
			exit 1
			;;
	esac
fi
