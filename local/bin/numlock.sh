#!/bin/bash
state=$(cat /sys/class/leds/*::numlock/brightness | head -n 1)
if [ "$state" -eq 1 ]; then
    msg="on"
else
    msg="off"
fi
notify-send -h string:x-canonical-private-synchronous:sys-numlock -t 1500 "num lock" "$msg"