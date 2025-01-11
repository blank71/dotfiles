local wezterm = require 'wezterm'
local mod = {}

function mod.apply_to_config(config)
  config.tab_bar_at_bottom = false
  local success, stdout, stderr = wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", "cursor-theme"})
  if success then
    config.xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
  end

  local success, stdout, stderr = wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", "cursor-size"})
  if success then
    config.xcursor_size = tonumber(stdout)
  end

  local desktop = os.getenv("DESKTOP_SESSION")
  if desktop == "gnome" then
    config.integrated_title_button_style = "Gnome"
  else
    config.integrated_title_button_style = "Windows"
  end
end

return mod
