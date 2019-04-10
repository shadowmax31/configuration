#!/bin/sh

#Set random wallpaper
script_path="/home/etienne/.scripts"
wallpaper_path="/home/etienne/Pictures/Backgrounds"
picture=`$script_path/random_file.sh $wallpaper_path`

$script_path/nnn/background-change.sh $wallpaper_path/$picture
