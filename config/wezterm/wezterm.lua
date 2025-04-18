local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

local minicyan_dark, _ = wezterm.color.load_base16_scheme(
    "/Users/max/cont00rs/dotfiles/config/wezterm/minicyan.yaml")

local minicyan_light, _ = wezterm.color.load_base16_scheme(
    "/Users/max/cont00rs/dotfiles/config/wezterm/minicyan-light.yaml")

local tokyonight_storm, _ = wezterm.color.load_scheme(
    "/Users/max/cont00rs/dotfiles/config/wezterm/tokyonight_storm.toml")

local tokyonight_night, _ = wezterm.color.load_scheme(
    "/Users/max/cont00rs/dotfiles/config/wezterm/tokyonight_night.toml")

local tokyonight_day, _ = wezterm.color.load_scheme(
    "/Users/max/cont00rs/dotfiles/config/wezterm/tokyonight_day.toml")

config.color_schemes = {
    ["minicyan"] = minicyan_dark,
    ["minicyan-light"] = minicyan_light,
    ["tokyostorm-storm"] = tokyonight_storm,
    ["tokyonight-night"] = tokyonight_night,
    ["tokyonight-day"] = tokyonight_day,
    ["gruvbox_material_dark_hard"] = {
        foreground = "#D4BE98",
        background = "#1D2021",
        cursor_bg = "#D4BE98",
        cursor_border = "#D4BE98",
        cursor_fg = "#1D2021",
        selection_bg = "#D4BE98",
        selection_fg = "#3C3836",

        ansi = {
            "#1d2021", "#ea6962", "#a9b665", "#d8a657",
            "#7daea3", "#d3869b", "#89b482", "#d4be98",
        },
        brights = {
            "#eddeb5", "#ea6962", "#a9b665", "#d8a657",
            "#7daea3", "#d3869b", "#89b482", "#d4be98",
        },
    },
}

-- config.color_scheme = 'minicyan'
-- config.color_scheme = 'minicyan-light'
-- config.color_scheme = 'tokyonight-storm'
-- config.color_scheme = 'tokyonight-night'
-- config.color_scheme = 'tokyonight-day'
-- config.color_scheme = "gruvbox_material_dark_hard"
config.color_scheme = "Gruvbox dark, hard (base16)"

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- We are running on Windows.
    config.default_domain = 'WSL:Ubuntu'
end

config.font = wezterm.font {
    family = 'JetBrains Mono',
    -- Disable ligatures, e.g. joining of `!=`.
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 14

return config
