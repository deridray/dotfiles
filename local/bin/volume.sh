#!/bin/bash
vol=$(pamixer --get-volume)
notify-send -h int:value:"$vol" -h string:x-canonical-private-synchronous:sys-volume -i ~/.config/swaync/assets/volume.svg -t 2000 "volume: $vol%"