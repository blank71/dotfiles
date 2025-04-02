{ config, pkgs, lib, ... }:

{
  home = {
    username = "bl";
    homeDirectory = "/Users/bl";
    stateVersion = "23.11";
    
    packages = with pkgs; [
      # macOS向けパッケージ
      ripgrep
      fd
      jq
      bat
    ];
  };

  programs = {
    home-manager.enable = true;
    
    git = {
      enable = true;
      userName = "bl";
      userEmail = "your-email@example.com";
    };
    
    # 他のプログラム設定
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
  # // inputs.flake-utils.lib.eachDefaultSystem (system: let
  #   pkgs = import inputs.nixpkgs {
  #     inherit system;
  #   };
  #   scripts = with pkgs; [
  #     (writeScriptBin "switch-home" ''
  #       home-manager switch --flake ".#$@"
  #     '')
  #     (writeScriptBin "switch-nixos" ''
  #       sudo nixos-rebuild switch --flake ".#$@"
  #     '')
  #   ];
  # in {
  #   formatter = pkgs.alejandra;
  #   devShell = pkgs.mkShell {
  #     packages = scripts;
  #   };
  # });
}
