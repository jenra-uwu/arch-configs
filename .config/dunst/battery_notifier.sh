#!/bin/fish

while [ 1 ]
	if [ (cat /sys/class/power_supply/BAT0/capacity) -lt 10 ] && [ (cat /sys/class/power_supply/ADP1/online) -eq 1 ]
		command notify-send 'Low battery' 'Please plug in your power adapter' --urgency=critical --app-name=Battery\ Status
	end
	command sleep 60
end
