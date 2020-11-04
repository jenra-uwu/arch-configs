#!/bin/fish

if [ (echo -e "logout\ncancel" | rofi -dmenu		\
		-font "System San Francisco 20"				\
		-lines 2 -hide-scrollbar					\
		-mesg "Are you sure you wanna log out?"		\
		-p ""										\
	) = "logout" ]
	i3-msg exit
end
