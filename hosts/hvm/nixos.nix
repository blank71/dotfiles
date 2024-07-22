{
  inputs,
  pkgs,
  hostname,
  username,
  ...
}: {
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/fonts.nix
      # ../../modules/gnome-desktop.nix
      ../../modules/i18n-en.nix
      # ../../modules/xremap.nix
      # ../../modules/tailscale-server.nix

      # ../../users/terminal/wezterm.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # Enable networking
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;
  
  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # nix
  nix = {
    settings = {
       experimental-features = ["nix-command" "flakes"];
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Bluetooth
  # hardware.bluetooth.enable = true;
  # services.blueman.enable = true;

  # Power management
  services.upower.enable = true;

  # fingerprint
  # services.fprintd.enable = true;
  # services.fwupd.enable = true;

  # scaleing
  # environment.variables = {
  #   GDK_SCALE = "1";
  #   GTK_IM_MODULE = "fcitx";
  #   QT_IM_MODULE = "fcitx";
  #   QT_QPA_PLATFORM = "wayland;xcb";
  #   QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  #   QT_SCALE_FACTOR = "1";
  #   XMODIFIERS="@im=fcitx";
  # };

  # xserver
  # Enable the X11 windowing system.
  # services.displayManager.defaultSession = "gnome";
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      # gdm.wayland = true;
    };
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
  };

  # xrdp
  services.xrdp = {
    enable = true;
    defaultWindowManager = "";
    # port = 13389;
    openFirewall = true;
  };

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 3389 ];
    allowedTCPPorts = [ 3389 ];
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    trash-cli
    wget
  ];

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  # Don't touch this
  system.stateVersion = "23.05";

  system.autoUpgrade.enable  = true;
  system.autoUpgrade.allowReboot  = false;
}
