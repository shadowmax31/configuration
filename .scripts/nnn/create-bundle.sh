#!/usr/local/bin/bash

current_dir="${PWD##*/}"
date_heure=`date +"%Y%m%d-%H%M%S"`

backup_name=$current_dir"_"$date_heure".bundle"

`git bundle create ../$backup_name --all`
