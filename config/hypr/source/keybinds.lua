---------------------
---- KEYBINDINGS ----
---------------------
-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local browser     = "zen-browser"
local email       = "betterbird"
local editor      = "code"
local musicPlayer = "spotify"
local notificationDaemon = "swaync-client -t"
local wallpaper   = "waypaper"
local colorpicker = "hyprpicker -a -l"
local screenshot  = "hyprshot -m region --freeze -o ~/pictures/screenshots/ -f $(date '+%d.%m.%Y-%H:%M:%S').png"
local menu        = "$HOME/.config/rofi/launcher/launcher.sh"
local clipboard   = "$HOME/.config/rofi/clipboard/clipboard.sh"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Converted binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + N",      hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + T",      hl.dsp.exec_cmd(wallpaper))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(musicPlayer))
hl.bind(mainMod .. " + O",      hl.dsp.exec_cmd(notificationDaemon))
hl.bind(mainMod .. " + 0",      hl.dsp.exec_cmd("better-control"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + M",      hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + S",      hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + Tab",            hl.dsp.focus({ workspace = "previous" }), { repeating = true })
hl.bind("SUPER + L",            hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V",      hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + C",      hl.dsp.exec_cmd(colorpicker))
-- hl.bind(mainMod .. " + .",      hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + P",      hl.dsp.exec_cmd("nwg-displays"))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd("missioncenter"))
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit")) -- dwindle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces 1-9
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && ~/.local/bin/volume.sh"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ~/.local/bin/volume.sh"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ~/.local/bin/volume.sh"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && ~/.local/bin/mic.sh"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+ && ~/.local/bin/brightness.sh"),        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%- && ~/.local/bin/brightness.sh"),        { locked = true, repeating = true })

-- Lock/Num toggle scripts
-- hl.bind("capslock", hl.dsp.exec_cmd("~/.local/bin/capslock.sh"))
hl.bind("num_lock", hl.dsp.exec_cmd("~/.local/bin/numlock.sh"))

-- Player controls
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"))