#!/usr/bin/fish

set ws (i3-msg -t get_workspaces | jq ".[] | select(.focused==true).num")

if [ $ws -lt 10 ]
	i3-msg workspace number (echo print $ws '+1' | perl)
end
