{
  pkgs,
  ...
}: {
  imports = [
    ../../home-manager/dev
    ../../home-manager/gui
    ../../home-manager/neovim
    ../../home-manager/tools
    ../../home-manager/wezterm
    # ../../home-manager/gnome-desktop
    # ../../home-manager/desktop
    # ../../home-manager/gui
  ];

  home.packages = with pkgs; [
    warp-terminal
  ];
}
