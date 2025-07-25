{
  inputs,
  pkgs,
  hostname,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/fonts.nix
    ../../modules/gnome-desktop.nix
    ../../modules/i18n-en.nix
    ../../modules/libreoffice.nix
    ../../modules/tailscale-server.nix
    ../../modules/podman.nix
    ../../modules/steam.nix
    ../../modules/verilog.nix  
    ../../modules/virt.nix
    #../../modules/vmware.nix
    ../../modules/vscode.nix
    ../../modules/xremap.nix
    ../../modules/zsh.nix

    ../../users/terminal/wezterm.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x13
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
  nixpkgs.config.permittedInsecurePackages = [];

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Power management
  services.upower.enable = true;

  # fingerprint
  services.fprintd.enable = true;
  
  # fwupd
  services.fwupd.enable = true;
  
  # gvfs
  services.gvfs.enable = true;

  # scaleing
  environment.variables = {
    GDK_SCALE = "1";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    QT_SCALE_FACTOR = "1";
    XMODIFIERS = "@im=fcitx";
    XDG_CURRENT_DESKTOP= "gnome";
  };

  # xserver
  # Enable the X11 windowing system.
  services = { 
    desktopManager = {
      gnome = {
        enable = true;
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer']
        '';
      };
    };
    displayManager = {
      defaultSession = "gnome";
      gdm.enable = true;
      gdm.wayland = true;
    };
  };
  # services.xserver = {
  #   enable = true;
  #   xkb = {
  #     layout = "us";
  #     variant = "";
  #   };
  # };

  # xrdp
  services.gnome.gnome-remote-desktop.enable = true; 
  # services.xrdp = {
  #   enable = true;
  #   defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
  #   #defaultWindowManager = "gnome-remote-desktop";
  #   port = 13389;
  # };
  systemd.services."gnome-remote-desktop".wantedBy = [ "graphical.target" ];
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [3389];
    allowedTCPPorts = [3389];
  };

  # Configure console keymap
  #console.keyMap = "jp106";
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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
    packages = with pkgs; [
    ];
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
    libsecret
    gnome-session
    gnome-remote-desktop
    input-remapper
    trash-cli
    vscode
    wget

    gvfs
    usbutils
    gphoto2

  ];

  programs = {
    git = {
      enable = true;
      prompt.enable = true;
      config.credential.helper = "libsecret";
      # config = {
      #   credential.helper = "${
      #       pkgs.git.override { withLibsecret = true; }
      #     }/bin/git-credential-libsecret";
      # };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
  
  # Don't touch this
  system.stateVersion = "23.05";

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
