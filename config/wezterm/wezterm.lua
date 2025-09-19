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
    },
    ["tokyonight-night"] = {
        foreground = "#c0caf5",
        background = "#1a1b26",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#1a1b26",
        selection_bg = "#283457",
        selection_fg = "#c0caf5",
        split = "#7aa2f7",
        compose_cursor = "#ff9e64",
        scrollbar_thumb = "#292e42",

        ansi = {
            "#15161e",
            "#f7768e",
            "#9ece6a",
            "#e0af68",
            "#7aa2f7",
            "#bb9af7",
            "#7dcfff",
            "#a9b1d6",
        },
        brights = { "#414868",
            "#ff899d",
            "#9fe044",
            "#faba4a",
            "#8db0ff",
            "#c7a9ff",
            "#a4daff",
            "#c0caf5" },

        tab_bar = {
            active_tab = {
                fg_color = "#16161e",
                bg_color = "#7aa2f7",
            },

            inactive_tab = {
                fg_color = "#545c7e",
                bg_color = "#292e42",
            },

            inactive_tab_hover = {
                fg_color = "#7aa2f7",
                bg_color = "#292e42",
            },

            new_tab_hover = {
                fg_color = "#7aa2f7",
                bg_color = "#1a1b26",
                intensity = "Bold",
            },

            new_tab = {
                fg_color = "#7aa2f7",
                bg_color = "#1a1b26",
            },
        }
    },
}

config.color_scheme = "Gruvbox dark, hard (base16)"

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
