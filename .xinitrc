#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && "$f"
	done
	unset f
fi

xinput --set-prop bcm5974 "libinput Tapping Enabled" 1
xinput --set-prop bcm5974 "libinput Natural Scrolling Enabled" 1
xinput --set-prop bcm5974 "libinput Disable While Typing Enabled" 0
xinput --set-prop bcm5974 "libinput Tapping Drag Enabled" 0

exec i3
