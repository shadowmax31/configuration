#!/bin/sh

if [ "$1" == "" ]; then
    echo "You must specify the name of the pool"
else
    zfs list -H -t snapshot -o name -S creation -d1 $1 | sed -n '11,$p' | xargs -n 1 zfs destroy -r
fi
