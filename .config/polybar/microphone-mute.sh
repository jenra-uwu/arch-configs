#!/usr/bin/fish

set muted (pactl list sources | sed -n '/Name: alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source/, /^$/p' | grep 'Mute: no')

if [ $muted ]
	echo ''
else
	echo ''
end

