-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        border_size = 0, -- Size of the border around windows
        gaps_in = 5, -- Gaps between windows
        gaps_out = 8, -- Gaps between windows and monitor edges
        float_gaps = 2, -- Gaps for floating windows (-1 means default)
        gaps_workspaces = 50, -- Gaps between workspaces (stacks with gaps_out)

        ["col.inactive_border"] = inverse_on_surface, -- Border color for inactive windows
        ["col.active_border"] = primary, -- Border color for the active window
        ["col.nogroup_border"] = inverse_on_surface, -- Inactive border color for window that cannot be added to a group
        ["col.nogroup_border_active"] = secondary, -- Active border color for window that cannot be added to a group

        resize_on_border = false, -- Enables resizing windows by clicking and dragging on borders and gaps
        extend_border_grab_area = 15, -- Extends click/drag area around the border (needs resize_on_border)
        hover_icon_on_border = true, -- Shows cursor icon when hovering over borders (needs resize_on_border)
        allow_tearing = true, -- Master switch for allowing tearing to occur
        resize_corner = 0 -- Forces floating windows to use specific corner when resized (1-4, 0 to disable)
    },

    decoration = {
        rounding = 24, -- Rounded corners' radius (in layout px)
        rounding_power = 4.0, -- Curve used for rounding (2.0 is circle, 4.0 squircle, 1.0 triangular)
        fullscreen_opacity = 1.0, -- Opacity of fullscreen windows [0.0 - 1.0]
        dim_modal = true, -- Enables dimming of parents of modal windows
        dim_inactive = true, -- Enables dimming of inactive windows
        dim_strength = 0.1, -- How much inactive windows should be dimmed [0.0 - 1.0]
        dim_special = 0.1, -- How much to dim screen when special workspace is open [0.0 - 1.0]
        dim_around = 0.4, -- How much the dim_around window rule should dim by [0.0 - 1.0]
        screen_shader = "", -- Path to custom shader applied at the end of rendering
        border_part_of_window = true, -- Whether the window border should be a part of the window

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            ignore_opacity = true, -- Whether to ignore window opacity when applying blur (false = blur is applied proportionally to opacity, true = blur is applied fully regardless of opacity)
            new_optimizations = true,
            xray = false,
            vibrancy = 0,
            vibrancy_darkness = 0.30,
        },

        shadow = {
            enabled = false, -- Enable drop shadows on windows
            range = 3, -- Shadow range ("size") in layout px
            render_power = 1, -- Falloff power (more power = faster falloff) [1 - 4]
            sharp = false, -- Make shadows sharp, akin to infinite render power
            color = "rgba(1a1a1aee)", -- Shadow's color. Alpha dictates opacity
            offset = {0, 4}, -- Shadow's rendering offset
            scale = 1.0 -- Shadow's scale [0.0 - 1.0]
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Curves converted from provided config
hl.curve("expressiveFastSpatial",     { type = "bezier", points = { {0.42, 1.67}, {0.21, 0.90} } })
hl.curve("expressiveSlowSpatial",     { type = "bezier", points = { {0.39, 1.29}, {0.35, 0.98} } })
hl.curve("expressiveDefaultSpatial",  { type = "bezier", points = { {0.38, 1.21}, {0.22, 1.00} } })
hl.curve("emphasizedDecel",           { type = "bezier", points = { {0.05, 0.7},  {0.1, 1}    } })
hl.curve("emphasizedAccel",           { type = "bezier", points = { {0.3, 0},    {0.8, 0.15} } })
hl.curve("standardDecel",             { type = "bezier", points = { {0, 0},      {0, 1}      } })
hl.curve("menu_decel",                { type = "bezier", points = { {0.1, 1},    {0, 1}      } })
hl.curve("menu_accel",                { type = "bezier", points = { {0.52, 0.03},{0.72, 0.08} } })
hl.curve("stall",                     { type = "bezier", points = { {1, -0.1},   {0.7, 0.85} } })

-- Animations converted from provided config (enabled = true when original had 1)
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3, bezier = "emphasizedDecel", style = "popin 80%" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 3, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2, bezier = "emphasizedDecel", style = "popin 90%" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 2, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "border",           enabled = true, speed = 10, bezier = "emphasizedDecel" })

hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.7, bezier = "emphasizedDecel", style = "popin 93%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.4, bezier = "menu_accel", style = "popin 94%" })

hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 0.5, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 2.7, bezier = "stall" })

hl.animation({ leaf = "workspaces",       enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 2.8, bezier = "emphasizedDecel", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.2, bezier = "emphasizedAccel", style = "slidevert" })

hl.animation({ leaf = "zoomFactor",        enabled = true, speed = 3, bezier = "emphasizedDecel" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split  = true,
        -- pseudotile      = true,
        smart_split     = false,
        smart_resizing  = false,
        -- precise_mouse_move = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.window_rule({ match = { class = "Alacritty" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "Code" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "kitty" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "thunar" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "obsidian" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "spotify" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "discord" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "vesktop" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "org.telegram.desktop" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "com.ayugram.desktop" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "steam" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "Rofi" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "swaync" }, opacity = "0.80 override" })
hl.window_rule({ match = { class = "better_control.py" }, opacity = "0.80 override" })