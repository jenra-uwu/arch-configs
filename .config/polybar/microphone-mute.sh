#!/usr/bin/fish

set muted (pactl list sources | sed -n '/Name: alsa_input.usb-Solid_State_System_Co._Ltd._TKGOU_PnP_USB_Microphone_000000000000-00.mono-fallback/, /^$/p' | grep Mute)

if [ "$muted" = '	Mute: no' ]
	echo ''
else
	echo ''
end

