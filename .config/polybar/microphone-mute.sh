#!/usr/bin/fish

set muted (pactl list sources | sed -n '/\s*State: RUNNING/, /^$/p' | grep Mute)

if [ "$muted" = '	Mute: no' ]
	echo ''
else
	echo ''
end

