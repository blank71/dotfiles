{ config, pkgs, lib, ... }:

{
  # ホスト名設定
  networking.hostName = "m2";
  
  # macOS固有のNix設定
  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  # 基本パッケージ
  environment.systemPackages = with pkgs; [
    curl
    wget
    git
    coreutils
  ];

  # macOSシステム設定
  system.defaults = {
    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    dock = {
      autohide = true;
      mru-spaces = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      QuitMenuItem = true;
    };
  };

  # Homebrewサポート（オプション）
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    taps = [
      "homebrew/core"
      "homebrew/cask"
    ];
  };

  # nix-darwinのサービス設定
  services.nix-daemon.enable = true;
}
