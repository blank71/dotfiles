{
  pkgs,
  ...
}: {
  imports = [
    ../../home-manager/dev
    ../../home-manager/gui
    ../../home-manager/neovim
    ../../home-manager/nix-direnv
    ../../home-manager/tools
    ../../home-manager/wezterm
    ../../home-manager/zsh
    # ../../home-manager/gnome-desktop
    # ../../home-manager/desktop
    # ../../home-manager/gui
  ];

  home.packages = with pkgs; [
    warp-terminal
  ];
}
