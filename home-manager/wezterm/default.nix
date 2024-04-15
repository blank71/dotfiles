{
  pkgs,
  ...
}: {
  home.file = {
    ".wezterm.lua" = {
      source = ./wezterm.lua;
    };
    ".config/wezterm/wayland_gnome.lua" = {
      source = ./wayland_gnome.lua;
    };
  };
  home.packages = with pkgs;  [
    wezterm
  ];
}