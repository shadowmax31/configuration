#!/usr/local/bin/bash

#. "${HOME}/.cache/wal/colors.sh"

#answer=$(echo -e "Yes\nNo" | dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i -p "$1")
answer=$(echo -e "Yes\nNo" | dmenu -i -p "$1")

if [ "$answer" == "Yes" ]; then
	$2
fi
