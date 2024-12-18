local wezterm = require("wezterm")
local wayland_gnome = require("wayland_gnome")

local config = {}

if wezterm.config_builder then
        config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.enable_wayland = true

config.color_scheme = "AdventureTime"
config.font_size = 12
config.initial_cols = 120
config.initial_rows = 20

config.font =
        wezterm.font("UDEV Gothic NFLG")

config.window_decorations = "RESIZE"
config.show_close_tab_button_in_tabs = false

wayland_gnome.apply_to_config(config)

return config