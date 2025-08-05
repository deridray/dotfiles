#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

killall waybar 2>/dev/null

waybar -c "$DIR/config.jsonc" -s "$DIR/style.css" &

