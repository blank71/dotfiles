{
  pkgs,
  ...
}: {
  home.file.".wezterm.lua" = {
    source = ./wezterm.lua;
  };
  home.packages = with pkgs;  [
    wezterm
  ];
}