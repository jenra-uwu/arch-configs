#!/usr/bin/fish

set muted (pactl list sources | sed -n '/Source #1/, /^$/p' | grep Mute)

if [ "$muted" = '	Mute: no' ]
	echo ''
else
	echo ''
end

