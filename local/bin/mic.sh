#!/bin/bash
mic_info=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

if [[ "$mic_info" == *"[MUTED]"* ]]; then
    notify-send -h string:x-canonical-private-synchronous:sys-mic -t 2000 "microphone" "off"
else
    notify-send -h string:x-canonical-private-synchronous:sys-mic -t 2000 "microphone" "on"
fi