local wezterm = require("wezterm")
local wayland_gnome = require("wayland_gnome")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Prefer the native Wayland backend.  WebGpu avoids doing terminal rendering
-- on the CPU while leaving adapter selection to WezTerm/wgpu.
config.front_end = "WebGpu"
config.enable_wayland = true

config.color_scheme = "AdventureTime"
config.font_size = 16
config.initial_cols = 120
config.initial_rows = 20

config.font = wezterm.font("UDEV Gothic NFLG")

-- Keep Japanese input available on the native Wayland backend.  This uses
-- the compositor's text-input protocol rather than the X11 XIM path.
config.use_ime = true

-- These make maximized/tiled windows feel natural in GNOME.
config.adjust_window_size_when_changing_font_size = false
config.hide_mouse_cursor_when_typing = true

wayland_gnome.apply_to_config(config)

return config
