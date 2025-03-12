local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

local colors, _ = wezterm.color.load_base16_scheme("/Users/max/cont00rs/dotfiles/config/wezterm/minicyan.yaml")

config.color_schemes = {
    ["minicyan"] = colors
}

config.color_scheme = 'minicyan'

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
