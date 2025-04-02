{ config, pkgs, ... }:

{
  imports = [
    ./default.nix
  ];

  nix.package = pkgs.nix;
  
  # システム設定
  system.stateVersion = 4;
  
  # ユーザー設定
  users.users.bl = {
    name = "bl";
    home = "/Users/bl";
  };
  
  # シェル設定
  programs.zsh.enable = true;
  programs.fish.enable = true;
}
