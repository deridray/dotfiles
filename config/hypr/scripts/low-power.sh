#!/bin/bash

PROFILE_FILE="/sys/firmware/acpi/platform_profile"
MODE_CONFIG="$HOME/.config/hypr/extra/current_mode.conf"
OPACITY_RULES="$HOME/.config/hypr/extra/opacity.conf"

last_mode=""

while true; do
    if [ -f "$PROFILE_FILE" ]; then
        current_mode=$(cat "$PROFILE_FILE")

        # === POWER SAVER MODE ===
        if [[ "$current_mode" == "low-power" ]]; then
            if [[ "$last_mode" != "low-power" ]]; then
                
                echo "decoration { 
                    blur { 
                        enabled = false 
                    } 
                } 
                animations { 
                    enabled = false 
                }
                windowrule = opacity 1 override 1 override, match:class .*" > "$MODE_CONFIG"
                
                hyprctl reload
                
                notify-send -u low "power saver" "visuals disabled"
                last_mode="low-power"
            fi
        
        # === BALANCED / PERFORMANCE MODE ===
        else
            if [[ "$last_mode" == "low-power" || "$last_mode" == "" ]]; then
                
                echo "decoration { 
                    blur { 
                        enabled = true 
                    } 
                } 
                animations { 
                    enabled = true 
                }
                source = $OPACITY_RULES" > "$MODE_CONFIG"          
                hyprctl reload
                
                if [[ "$last_mode" != "" ]]; then
                    notify-send -u normal "performance mode" "visuals restored"
                fi
                
                last_mode="$current_mode"
            fi
        fi
    fi
    sleep 2
done