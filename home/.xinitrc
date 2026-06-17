#!/bin/sh

lxappearance & disown

# set cursor theme
xsetroot -cursor_name left_ptr
export XCURSOR_THEME="Bibata-Modern-Ice"
export XCURSOR_SIZE=24

# load Xresources
xrdb -merge ~/.Xresources

# disable screen blanking and DPMS
xset s off
xset -dpms
xset s noblank

# monitor refresh rate
xrandr --output DP-2 --mode 1920x1080 --rate 144 &

# sxhkd and bspwm
sxhkd &
exec bspwm