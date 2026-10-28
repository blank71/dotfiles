{
  pkgs,
  ...
}:
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  home.packages = with pkgs; [
    discord
    slack
    obs-studio
    zoom-us
  ];
}
