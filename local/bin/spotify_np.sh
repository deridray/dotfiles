#!/bin/bash

playerctl --player=spotify metadata --format '{{title}}' --follow | while read -r title; do
    is_dnd=$(swaync-client --get-dnd)
    is_fullscreen=$(hyprctl activewindow -j | grep -q '"fullscreen": 1' && echo "true" || echo "false")
    window_class=$(echo "$active_window" | jq -r '.initialClass')

if [ "$is_dnd" == "true" ] || [ "$is_fullscreen" == "1" ] || [ "$window_class" == "osu!.exe" ]; then
        continue
    fi

    artist=$(playerctl --player=spotify metadata --format '{{artist}}')
    art_url=$(playerctl --player=spotify metadata mpris:artUrl)

    if [ -n "$art_url" ]; then
        curl -s "$art_url" -o /tmp/spotify_cover.png
        icon="/tmp/spotify_cover.png"
    else
        icon="spotify"
    fi

    notify-send -i "$icon" \
        --hint=string:x-canonical-private-synchronous:spotify-track \
        "now playing:" "$title\n$artist" \
        -a "spotify" -t 5000
done