#!/bin/sh

export DISPLAY=:0.0 
export XAUTHORITY=/usr/home/etienne/.Xauthority 

LOW=50
NORMAL=35
CRITICAL=10

battery_life=`sysctl hw.acpi.battery.life | awk -F " " '{print $2}'`
battery_time=`sysctl hw.acpi.battery.time | awk -F " " '{print $2}'`

if [ $battery_time != -1 ]; then
    if [ -e "battery_life" ]; then
        read last_value < battery_life
    else
        # We set the last value as the maximum
        last_value=100
    fi

    message="Battery life - $battery_life% / ${battery_time} min."
    if [ $battery_life -lt $LOW ] && [ $LOW -lt $last_value ]; then
        notify-send -u low "$message"
    elif [ $battery_life -lt $NORMAL ] && [ $NORMAL -lt $last_value ]; then
        notify-send -u normal "$message"
    elif [ $battery_life -lt $CRITICAL ]; then
        notify-send -u critical "$message"
    fi

    last_value=$battery_life
    echo $last_value > battery_life
else
    if [ -e "battery_life" ]; then
        rm battery_life
    fi
fi


