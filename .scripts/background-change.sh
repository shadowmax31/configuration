#!/bin/bash

cp $1 ~/.background-image.jpg | feh --bg-fill ~/.background-image.jpg | wal -i $1
