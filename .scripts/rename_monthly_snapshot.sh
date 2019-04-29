#!/bin/sh

if [ "$1" == "" ]; then
    echo "You must specify the name of the pool"
else
    new_name="monthly`date +"%Y%m%d"`"
    old_name=`zfs list -H -t snapshot -o name -S creation -d1 $1 | head -n 1`
    zfs rename -r $old_name $new_name
fi
