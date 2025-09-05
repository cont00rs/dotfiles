local wezterm = require 'wezterm'

local config = {}

config.color_schemes = {
    -- Derived through vibing from the (neo)vim lunaperche colorscheme.
    ["lunaperche"] = {
        foreground = "#c6c6c6",
        background = "#000000",
        cursor_bg = "#c6c6c6",
        cursor_fg = "#000000",
        cursor_border = "#c6c6c6",
        selection_fg = "#000000",
        selection_bg = "#5fafff",
        scrollbar_thumb = "#767676",
        split = "#767676",

        ansi = {
            "#000000", -- black
            "#ff5f5f", -- bright red
            "#5fd75f", -- bright green
            "#ffd787", -- bright yellow
            "#5fafff", -- bright blue
            "#ff87ff", -- bright magenta
            "#5fd7d7", -- bright cyan
            "#c6c6c6", -- white
        },

        brights = {
            "#767676", -- bright black
            "#ff5f5f", -- bright red
            "#5fd75f", -- bright green
            "#ffd787", -- bright yellow
            "#5fafff", -- bright blue
            "#ff87ff", -- bright magenta
            "#5fd7d7", -- bright cyan
            "#ffffff", -- bright white
        },

        tab_bar = {
            background = "#000000",
            active_tab = {
                bg_color = "#c6c6c6",
                fg_color = "#000000",
                intensity = "Bold",
            },
            inactive_tab = {
                bg_color = "#767676",
                fg_color = "#000000",
            },
            inactive_tab_hover = {
                bg_color = "#4e4e4e",
                fg_color = "#000000",
                italic = true,
            },
            new_tab = {
                bg_color = "#000000",
                fg_color = "#5fafff",
            },
            new_tab_hover = {
                bg_color = "#4e4e4e",
                fg_color = "#5fafff",
                italic = true,
            },
        },
    }
}

config.color_scheme = "lunaperche"

-- On Windows run Ubuntu through WSL.
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_domain = 'WSL:Ubuntu'
end

config.font = wezterm.font {
    family = 'JetBrains Mono',
    -- Disable ligatures, e.g. joining of `!=`.
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 14

-- To maximize the window on startup.
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function()
--     local _, _, window = mux.spawn_window {}
--     window:gui_window():maximize()
-- end)

return config
