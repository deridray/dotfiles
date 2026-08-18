swayidle -w \
    timeout 150 'brightnessctl -s set 10 && brightnessctl -sd rgb:kbd_backlight set 0' \
        resume 'brightnessctl -r && brightnessctl -rd rgb:kbd_backlight' \
    timeout 300 'pidof hyprlock || hyprlock' \
    timeout 330 'wlopm --off \*' \
        resume 'wlopm --on \* && brightnessctl -r' \
    lock 'pidof hyprlock || hyprlock' \
    before-sleep 'loginctl lock-session' \
    after-resume 'wlopm --on \*'
# swayidle -w \
#   timeout 180 'playerctl status 2>/dev/null | grep -q Playing || brightnessctl -s set 5%' \
#   timeout 240 'playerctl status 2>/dev/null | grep -q Playing || hyprlock' \
#   timeout 300 'playerctl status 2>/dev/null | grep -q Playing || wlr-randr --output eDP-1 --off' \
#   resume 'wlr-randr --output eDP-1 --on; sleep 0.5; brightnessctl -r' \
#   before-sleep 'hyprlock'