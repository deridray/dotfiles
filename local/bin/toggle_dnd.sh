#!/bin/bash

handle() {
  active_window=$(hyprctl activewindow -j)
  
  is_fullscreen=$(echo "$active_window" | jq -r '.fullscreen')
  class=$(echo "$active_window" | jq -r '.initialClass')

  if [ "$is_fullscreen" == "1" ] || [ "$is_fullscreen" == "true" ] || [ "$class" == "osu!.exe" ]; then
    swaync-client -d -sw
  else
    swaync-client -df -sw
  fi
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
  case $line in
    fullscreen*|activewindow*)
      handle
      ;;
  esac
done