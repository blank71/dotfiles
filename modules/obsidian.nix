{
  pkgs,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    obsidian
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" # for obsidian
  ];
}