#!/bin/bash

scp $1 root@serveur.bck:/root/backup/.
cp $1 /run/media/etienne/data/Backup/.
