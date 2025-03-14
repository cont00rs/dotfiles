local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

config.color_scheme = 'Catppuccin Mocha'

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
