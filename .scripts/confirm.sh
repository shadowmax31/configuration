#!/usr/local/bin/bash

. "${HOME}/.cache/wal/colors.sh"

answer=$(echo -e "Yes\nNo" | dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i -p "$1")

if [ "$answer" == "Yes" ]; then
	$2
fi
