#!/bin/sh

if [ "$1" == "" ]; then
    echo "You must specify the name of the pool"
else
    nom_snapshot=`date +"%Y%m%d-%H%M%S"`
    zfs snapshot -r $1@$nom_snapshot
fi
