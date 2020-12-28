#!/bin/fish

set sent_notification 0
while [ 1 ]
	if [ (cat /sys/class/power_supply/ADP1/online) -eq 1 ]
		set sent_notification 0
	else if [ (cat /sys/class/power_supply/BAT0/capacity) -lt 10 ] && [ $sent_notification -eq 0 ]
		command notify-send 'Low battery' 'Please plug in your power adapter' --urgency=critical --app-name=Battery\ Status
		set sent_notification 1
	end
	command sleep 60
end
