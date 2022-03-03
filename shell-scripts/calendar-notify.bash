#!/usr/bin/env sh

grep -q "$(date +%m/%d)" /opt/calendars/calendar.birthday
if [ $? = 0 ]; then
	notify-send "Famous people born today" "$(grep $(date +%m/%d) /opt/calendars/calendar.birthday | cut --complement -c 1-6)"
else
	notify-send "famous people born today" "none"
fi

grep -q "$(date +%m/%d)" /opt/calendars/calendar.history
if [ $? = 0 ]; then
	notify-send "Historical events" "$(grep $(date +%m/%d) /opt/calendars/calendar.history | cut --complement -c 1-6)"
else
	notify-send "Historical events happened today" "none"
fi

grep -q "$(date +%m/%d)" /opt/calendars/calendar.computer
if [ $? = 0 ]; then
	notify-send "Historical computer events" "$(grep $(date +%m/%d) /opt/calendars/calendar.computer | cut --complement -c 1-6)"
else
	notify-send "Historical computer events today" "none"
fi
