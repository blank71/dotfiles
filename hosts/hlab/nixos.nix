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
      ../../modules/gnome-desktop.nix
      ../../modules/i18n-en.nix
      # ../../modules/vmware.nix
      ../../modules/xremap.nix
      ../../modules/tailscale-server.nix

      ../../users/terminal/wezterm.nix


      # ../../modules/flatpak.nix
      # ../../modules/fcitx5.nix
      # ../../modules/gaming.nix
      # ../../modules/networking.nix
      # ../../modules/nix.nix
      # ../../modules/sound.nix
      # ../../modules/system-tools.nix
      # ../../modules/virtualisation.nix
      # ../../modules/xremap.nix
      # ../../modules/xserver.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

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
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Power management
  services.upower.enable = true;

  # fingerprint
  services.fprintd.enable = true;
  services.fwupd.enable = true;

  # scaleing
  environment.variables = {
    GDK_SCALE = "1";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    QT_SCALE_FACTOR = "1";
    XMODIFIERS="@im=fcitx";
  };

  # xserver
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "gnome";
      gdm.enable = true;
      gdm.wayland = true;
    };
    desktopManager = {
      gnome = {
        enable = true;
        # extraGSettingsOverrides = ''
        #   [org.gnome.mutter]
        #   experimental-features=['scale-monitor-framebuffer']
        # '';
      };
    };
  };

  # xrdp
  services.xrdp = {
    enable = true;
    defaultWindowManager = "${pkgs.gnome3.gnome-session}/bin/gnome-session";
    # port = 13389;
    openFirewall = true;
  };

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 3389 ];
    allowedTCPPorts = [ 3389 ];
  };

  services.gnome.gnome-remote-desktop.enable  = true;

  # Configure console keymap
  #console.keyMap = "jp106";
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
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
    cloudflared
    fprintd
    git
    gnome3.gnome-session
    # remmina
    trash-cli
    vscode
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
