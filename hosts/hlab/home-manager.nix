{
  pkgs,
  ...
}:
{
  imports = [
    ../../home-manager/gui
    # ../../home-manager/neovim
    ../../home-manager/new-nvim
    ../../home-manager/nix-direnv
    ../../home-manager/tools
    ../../home-manager/wezterm
    ../../home-manager/zsh
  ];
  nixpkgs.config.allowUnfree = true;
}
