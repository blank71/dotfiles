{
  config,
  pkgs,
  ...
}:

let
  # Import nixpkgs from nixos-24.05 for all i18n-related packages
  i18nPkgs = import (builtins.fetchGit {
    # Descriptive name to make the store path easier to identify
    name = "nixos-24.05-i18n";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-23.11";
    rev = "7ad2e9c9fedb5c7f4e5edeb655b385228eba6193";
  }) { system = pkgs.system; };
in

{
  # Use nixos-24.05 packages for i18n via overlay
  nixpkgs.overlays = [
    (final: prev: {
      # Override i18n-related packages with versions from nixos-24.05
      fcitx5 = i18nPkgs.fcitx5;
      fcitx5-mozc = i18nPkgs.fcitx5-mozc;
      fcitx5-gtk = i18nPkgs.fcitx5-gtk;
      fcitx5-qt = i18nPkgs.fcitx5-qt;
      fcitx5-with-addons = i18nPkgs.fcitx5-with-addons;
    })
  ];
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    #enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
    type = "fcitx5";
    enable = true;
    fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };
}
