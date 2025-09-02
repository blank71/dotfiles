{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = _: true;

  home = {
    username = "bl";
    homeDirectory = "/Users/bl";
    stateVersion = "24.11";
    
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
      extraConfig = {
        core.editor = "vim";
        commit.verbose = "true";
        commit.gpgsign = "true";
        gpg.format = "ssh";
        user.name = "blank71";
        user.email = "8blank71@gmail.com";
        user.signingkey = "/Users/bl/.ssh/id_ecdsa_512";
        color.ui = "true";
      };
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
