#!/bin/fish

while [ 1 ]
	if [ (cat /sys/class/power_supply/ADP1/online) -eq 0 ]; and [ (cat /sys/class/power_supply/BAT0/capacity) -lt 10 ]
		command notify-send 'Low battery'
	end
end

