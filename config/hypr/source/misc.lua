----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        disable_hyprland_logo = true, -- Disables random anime girl background
        disable_splash_rendering = true, -- Disables splash rendering
        font_family = "Sans", -- Default font for debug/error text
        splash_font_family = "", -- Font for splash text
        force_default_wallpaper = 1, -- Enforce default wallpapers (-1 random, 0/1 disables anime)
        animate_manual_resizes = false, -- Animate manual window resizes/moves
        animate_mouse_windowdragging = false, -- Animate windows being dragged by mouse
        background_color = background, -- Custom background color
        render_unfocused_fps = 5, -- Max FPS limit for unfocused background windows
        enable_anr_dialog = true -- Enable "App Not Responding" dialog
    },

    xwayland = {
        use_nearest_neighbor = true, -- Nearest neighbor filtering (pixelated vs blurry)
        force_zero_scaling = true -- Force scale of 1 on xwayland windows on scaled displays
    },

    opengl = {
        nvidia_anti_flicker = true -- Reduces flickering on nvidia (ignored on others)
    },

    render = {
        direct_scanout = 0, -- Attempt to reduce lag for single fullscreen app [0=off, 1=on, 2=auto]
        expand_undersized_textures = true, -- Expand undersized textures vs stretching entire texture
        xp_mode = false, -- Disables back buffer and bottom layer rendering
        ctm_animation = 2, -- Fade animation for CTM changes (2=auto disables on Nvidia)
        use_shader_blur_blend = false -- Blurred bg blending
    },

    -- ==========================================
    -- DEBUG VISUALS
    -- ==========================================
    debug = {
        overlay = false, -- Print debug performance overlay
        damage_blink = false, -- Flash areas updated with damage tracking
        colored_stdout_logs = true -- Colors in stdout logs
    }
})