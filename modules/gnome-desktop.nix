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
    gnome-sound-recorder
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.kimpanel
    gnomeExtensions.resource-monitor
    gnomeExtensions.runcat
    wl-clipboard
  ];
}

