{
  pkgs,
  username,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    gnome-extension-manager
    gnome.pomodoro
    # gnome-pomodoro
    gnomeExtensions.keyman
    # gnome-keyring
    gnome.gnome-tweaks
    # gnome-tweaks
    gnome.gnome-sound-recorder
    #gnomeExtensions.gtk-title-bar
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.keyman
    gnomeExtensions.kimpanel
    gnomeExtensions.resource-monitor
    gnomeExtensions.runcat
  ];
}