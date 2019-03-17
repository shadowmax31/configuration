#!/bin/bash
ls $1 |sort -R |tail -1 |while read file; do
    # Something involving $file, or you can leave
    # off the while to just get the filenames
	echo $file
done
