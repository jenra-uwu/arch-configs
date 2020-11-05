#!/bin/fish

i3-msg fullscreen

if killall -q polybar
else
	exec polybar -c ~/.config/polybar/config top &
end

