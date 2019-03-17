#!/bin/bash

answer=$(echo -e "Yes\nNo" | dmenu -i -p "$1")

if [ "$answer" == "Yes" ]; then
	$2
fi
