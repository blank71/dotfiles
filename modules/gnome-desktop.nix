{
  pkgs,
  username,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    gnome-extension-manager
    gnome-pomodoro
    gnome-keyring
    gnome-tweaks
    gnome.gnome-sound-recorder
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.keyman
    gnomeExtensions.kimpanel
    gnomeExtensions.resource-monitor
    gnomeExtensions.runcat
  ];
}