{ 
  inputs,
  config, 
  pkgs, 
  lib, 
  ...
}:

{
  imports = [

    ./fonts.nix
    #../../modules/gnome-desktop.nix
    #../../modules/i18n-en.nix
    #../../modules/libreoffice.nix
    #../../modules/tailscale-server.nix
    #../../modules/podman.nix
    #../../modules/steam.nix
    #../../modules/verilog.nix
    #../../modules/virt.nix
    #../../modules/vscode.nix
    #../../modules/xremap.nix
    #../../modules/zsh.nix

    #../../users/terminal/wezterm.nix
  ];

  # ホスト名設定
  networking.hostName = "m2";
  
  # macOS固有のNix設定
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # 基本パッケージ
  environment.systemPackages = with pkgs; [
    curl
    wget
    git
    coreutils
    zellij
  ];

  # macOSシステム設定
  system.defaults = {
    NSGlobalDomain = {
    };
    dock = {
      autohide = true;
    };
    finder = {
      AppleShowAllExtensions = true;
      QuitMenuItem = true;
    };
  };

  # Homebrewサポート（オプション）
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap"; # 明示的に管理されていないものを削除
      upgrade = true;
    };
    global = {
      brewfile = true;
      lockfiles = true;
    };
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
    ];
    # ターミナルアプリケーション
    brews = [
      # 例: ここに必要なbrewsを追加
      # "mas" # Mac App Store CLIクライアント
    ];
    # GUIアプリケーション
    casks = [
      # 例: ここに必要なcasksを追加
      # "google-chrome"
      # "visual-studio-code"
    ];
    # Mac App Storeアプリケーション
    masApps = {
      # 例: ここに必要なMac App Storeアプリを追加
      # "LINE" = 539883307;
      # "Xcode" = 497799835;
    };
  };

  # nix-darwinのサービス設定
  services.nix-daemon.enable = true;
}
