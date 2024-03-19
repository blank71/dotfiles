{ 
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    discord
    slack
    obs-studio
    zoom-us
  ];
}
