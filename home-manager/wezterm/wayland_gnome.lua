local wezterm = require("wezterm")
local mod = {}

local function desktop_contains(name)
    local desktop = os.getenv("XDG_CURRENT_DESKTOP") or os.getenv("DESKTOP_SESSION") or ""
    return desktop:lower():find(name, 1, true) ~= nil
end

local function is_wayland_session()
    return os.getenv("XDG_SESSION_TYPE") == "wayland" or os.getenv("WAYLAND_DISPLAY") ~= nil
end

local function read_gsetting(schema, key)
    local success, stdout = wezterm.run_child_process({ "gsettings", "get", schema, key })
    if not success then
        return nil
    end

    return stdout:match("^%s*'(.*)'%s*$") or stdout:match("^%s*(.-)%s*$")
end

function mod.apply_to_config(config)
    if not (is_wayland_session() and desktop_contains("gnome")) then
        return
    end

    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.integrated_title_button_style = "Gnome"
    config.tab_bar_at_bottom = false

    -- Match the pointer used by the GNOME Shell instead of falling back to
    -- Wayland's generic cursor theme and size.
    local cursor_theme = read_gsetting("org.gnome.desktop.interface", "cursor-theme")
    if cursor_theme and cursor_theme ~= "" then
        config.xcursor_theme = cursor_theme
    end

    local cursor_size = tonumber(read_gsetting("org.gnome.desktop.interface", "cursor-size"))
    if cursor_size then
        config.xcursor_size = cursor_size
    end
end

return mod
