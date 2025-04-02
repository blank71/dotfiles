local wezterm = require("wezterm")
local wayland_gnome = require("wayland_gnome")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.enable_wayland = true

config.color_scheme = "AdventureTime"
config.font_size = 16
config.initial_cols = 120
config.initial_rows = 20

config.font = wezterm.font("UDEV Gothic NFLG")

-- config.window_decorations = "TITLE|RESIZE"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.tab_bar_at_bottom = false

config.enable_wayland = true
config.hide_mouse_cursor_when_typing = false
-- wayland_gnome.apply_to_config(config)

config.integrated_title_button_style = "Gnome"

return config
