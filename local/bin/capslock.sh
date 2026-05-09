#!/bin/bash
state=$(cat /sys/class/leds/*::capslock/brightness | head -n 1)
if [ "$state" -eq 1 ]; then
    msg="on"
else
    msg="off"
fi
notify-send -h string:x-canonical-private-synchronous:sys-capslock -t 1500 "caps lock" "$msg"