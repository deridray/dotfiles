#!/bin/bash
max=$(cat /sys/class/backlight/*/max_brightness | head -n 1)
cur=$(cat /sys/class/backlight/*/brightness | head -n 1)
br=$(( cur * 100 / max ))
notify-send -h int:value:"$br" -h string:x-canonical-private-synchronous:sys-brightness -i ~/.config/swaync/assets/brightness.svg -t 500 "brightness: $br%"