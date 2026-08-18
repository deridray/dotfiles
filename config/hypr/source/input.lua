---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ua,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,
        force_no_accel = true,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },

    cursor = {
        sync_gsettings_theme = true,
        no_hardware_cursors = 2,
    },

    gestures = {
        workspace_swipe_distance = 700,
        workspace_swipe_cancel_ratio = 0.2,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_create_new = true,
        workspace_swipe_invert = true,
    },
})

hl.gesture({
    fingers = 3,
    direction = "swipe",
    action = "move",
})
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
})
hl.gesture({
    fingers = 3,
    direction = "pinch",
    action = "float",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.device({
    name   = "opentabletdriver-virtual-artist-tablet",
    output = "eDP-1",
})