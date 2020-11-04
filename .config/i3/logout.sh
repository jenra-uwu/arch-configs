#!/bin/fish

if [ (echo -e " Logout\n Cancel" | rofi -dmenu	\
		-font "System San Francisco 20"				\
		-lines 2 -hide-scrollbar					\
		-mesg "Are you sure you wanna log out?"		\
		-p "Logout" -window-title "Logout"			\
		-selected-row 1	-i							\
		-only-match -no-custom						\
	) = " Logout" ]
	i3-msg exit
end
