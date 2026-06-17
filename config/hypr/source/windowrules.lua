--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- Set opacity for specific apps, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Opacity/
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.window_rule({
    name      = "osu-immediate",
    match     = { class = "osu!" },
    immediate = true,
})

hl.layer_rule({
    blur         = true,
    ignore_alpha = 0,
    match        = { namespace = "waybar" },
})

hl.layer_rule({
    blur         = true,
    ignore_alpha = 0,
    match        = { namespace = "swaync-control-center" },
})

hl.layer_rule({
    blur         = true,
    ignore_alpha = 0,
    match        = { namespace = "swaync-notification-window" },
})

hl.layer_rule({
    blur         = true,
    ignore_alpha = 0,
    match        = { namespace = "rofi" },
})

hl.window_rule({
    no_anim = true,
    no_blur = true,
    opaque  = true,
    match   = { fullscreen = true },
})

hl.window_rule({
    no_anim   = true,
    no_blur   = true,
    no_shadow = true,
    float     = true,
    match     = { class = "^(ueberzugpp)$" },
})

hl.window_rule({
    immediate = true,
    workspace = 6,
    match     = { class = "^(osu!.exe)$" },
})

hl.window_rule({
    immediate = true,
    workspace = 6,
    match     = { class = "^(net.neomodnet.neomod)$" },
})

hl.window_rule({
    workspace = 1,
    match     = { class = "^(firefox|librewolf|waterfox|zen|brave-browser|helium|chromium)$" },
})

hl.window_rule({
    workspace = 2,
    match     = { class = "^(discord|vesktop|org.telegram.desktop|com.ayugram.desktop)$" },
})

hl.window_rule({
    workspace = 4,
    match     = { class = "^(Code)$" },
})

hl.window_rule({
    workspace = 4,
    match     = { class = "^(obsidian)$" },
})

hl.window_rule({
    workspace = 5,
    match     = { class = "^(spotify|mpv)$" },
})

hl.window_rule({
    workspace = 5,
    match     = { class = "^(steam|heroic)$" },
})

hl.window_rule({
    workspace   = 6,
    fullscreen  = true,
    match       = { title = "^(.*Minecraft.*)$" },
})

hl.window_rule({
    workspace = 6,
    match     = { class = "^(steam_app_\\d+)$" },
})

hl.window_rule({
    workspace = 6,
    match     = { class = "^(cs2)$" },
})

hl.window_rule({
    workspace = 6,
    match     = { class = "^(dota2)$" },
})

hl.window_rule({
    float = true,
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
})

hl.window_rule({
    float = true,
    match = { class = "^(better_control.py)$" },
})

hl.window_rule({
    float = true,
    match = { class = "^(waypaper)$" },
})

hl.window_rule({
    float = true,
    match = { class = "^(org.twosheds.iwgtk)$" },
})

hl.window_rule({
    float = true,
    pin   = true,
    match = { class = "^(ripdrag)$" },
})

hl.window_rule({
    name = "float-console-prismlauncher",
    match = {
        class = "^(org.prismlauncher.PrismLauncher)$",
        title = "^(.*Console window.*)$",
    },
    float  = true,
    opaque = true,
    size   = "1100 600",
    center = true,
})

hl.window_rule({
    name = "float-mpv",
    match = { class = "^(mpv)$" },
    float  = true,
    opaque = true,
    size   = "640 360",
    center = true,
})

hl.window_rule({
    name = "float-nwg-displays",
    match = { class = "^(nwg-displays)$" },
    float  = true,
    opaque = true,
    size   = "1102 662",
    center = true,
})

hl.window_rule({
    name = "float_qbittorrent_all",
    match = { class = "^(org.qbittorrent.qBittorrent)$" },
    float  = true,
    center = true,
    size   = "650 450",
})

hl.window_rule({
    name = "tile_qbittorrent_main",
    match = {
        class = "^(org.qbittorrent.qBittorrent)$",
        title = "^(qBittorrent v).*$",
    },
    float = false,
})

hl.window_rule({
    name = "steam-general",
    match = { class = "^(steam)$" },
    float = false,
    opaque = true,
})

hl.window_rule({
    name = "steam-main-window",
    match = {
        class = "^(steam)$",
        title = "^(Steam)$",
    },
    size   = "1100 600",
    center = true,
})

hl.window_rule({
    name = "steam-friends",
    match = {
        class = "^(steam)$",
        title = "^(Friends List)$",
    },
    float  = true,
    size   = "460 580",
    center = true,
})

hl.window_rule({
    name = "steam-settings",
    match = {
        class = "^(steam)$",
        title = "^(Steam Settings)$",
    },
    float  = true,
    size   = "1100 600",
    center = true,
})

hl.window_rule({
    name = "steam-special-offers",
    match = {
        class = "^(steam)$",
        title = "^(Special Offers)$",
    },
    float  = true,
    center = true,
})

hl.window_rule({
    name = "steam-idle",
    match = { class = "^(steam)$" },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    name = "gparted",
    match = { class = "^(GParted)$" },
    float  = true,
    size   = "652 431",
    center = true,
})

hl.window_rule({
    name = "float-blueman",
    match = { class = "^(blueman-manager)$" },
    float  = true,
    size   = "530 313",
    center = true,
})

hl.window_rule({
    name = "peaclock",
    match = { class = "^(peaclock)$" },
    float  = true,
    center = true,
    size   = "406 179",
})

hl.window_rule({
    name = "cava",
    match = { class = "^(cava)$" },
    float  = true,
    size   = "791 488",
    center = true,
})

hl.window_rule({
    name = "btop",
    match = { title = "^(btop)$" },
    float  = true,
    size   = "1080 607",
    center = true,
})

hl.window_rule({
    name = "missioncenter",
    match = { class = "^(io.missioncenter.MissionCenter)$" },
    float  = true,
    size   = "1128 715",
    center = true,
})

hl.window_rule({
    name = "pip-global",
    match = { title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]] },
    float  = true,
    pin    = true,
    size   = "645 363",
    move   = [[(monitor_w-window_w-20) (monitor_h-window_h-20)]],
    no_dim = true,
    opaque = true,
})

hl.window_rule({
    name = "galculator",
    match = { class = "^(galculator)$" },
    float  = true,
    size   = "410 457",
    center = true,
})

hl.window_rule({
    name = "style-pinned-windows",
    match = { pin = true },
    no_dim = true,
    border_color = "rgb(328E6E)",
    border_size  = 2,
})

hl.window_rule({
    name = "float-dialogs-title",
    match = { title = [[^(Open|Open File|Select a File|Choose wallpaper|Open Folder|Save As|Rename|Library|File Upload|Authentication Required|Add Folder to Workspace|Choose Files|Confirm to replace files|File Operation Progress)(.*)$|^(.*dialog.*)$]] },
    float  = true,
    center = true,
})

hl.window_rule({
    name = "float-dialogs-class",
    match = { class = "^(org.gnome.FileRoller|[Xx]dg-desktop-portal-gtk|.*dialog.*)$" },
    float  = true,
    center = true,
    size   = "816 537",
})

hl.window_rule({
    name = "float-bitwarden-browser",
    match = {
        class = "^(librewolf)$",
        title = "^(.*Bitwarden.*)$",
    },
    float  = true,
    size   = "1100 600",
    center = true,
})
