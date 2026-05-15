{
  config,
  pkgs,
  ...
}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        ControllerMode = "dual";
        FastConnectable = true;
        Discoverable = true;
        DiscoverableTimeout = 0;
        AlwaysPairable = false;
        
        # A2DP/オーディオ設定
        MaxControllers = 4;
        MaxConnectedDevices = 10;
        
        # BTコーデック設定
        BREDR = "true";
        LE = "true";
      };
      
      # LE設定
      LE = {
        EnableAdvMonInterleaveScan = true;
      };
      
      # オーディオプロファイル用の追加設定
      AVDTP = {
        SessionMode = "auto";
      };
    };
  };

  services.blueman.enable = true;

  # PulseAudio/PipeWireでBluetoothオーディオ対応
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "10-bluez" = {
        context.modules = [
          {
            name = "libpipewire-module-bluez5";
            args = {
              bluez5.msbc-support = true;
              bluez5.ldac-support = true;
              bluez5.sbc-xq-support = false;
            };
          }
        ];
      };
    };
  };

  # または、PulseAudioを使用する場合は以下
  # hardware.pulseaudio = {
  #   enable = true;
  #   package = pkgs.pulseaudioFull;
  #   extraModules = [pkgs.pulseaudio-modules-bt];
  # };

  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
  ];
}
