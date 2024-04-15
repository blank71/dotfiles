--test

local wezterm = require("wezterm")
local wayland_gnome = require("wayland_gnome")

local config = {}

if wezterm.config_builder then
        config = wezterm.config_builder()
end

-- config.enable_wayland = false

config.color_scheme = "AdventureTime"
config.font_size = 12
config.initial_cols = 120
config.initial_rows = 20

config.font =
        wezterm.font("UDEV Gothic NFLG")

wayland_gnome.apply_to_config(config)

return config