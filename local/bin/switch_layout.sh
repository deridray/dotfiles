#!/bin/bash
FILE="/tmp/current_layout"

if [ ! -f "$FILE" ] || [ "$(cat $FILE)" = "en" ]; then
    echo "ua" > "$FILE"
else
    echo "en" > "$FILE"
fi
pkill -RTMIN+1 waybar
