{
  pkgs,
  username,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    gnome-extension-manager
    gnome.pomodoro
    gnome.gnome-keyring
    gnome.gnome-tweaks
    gnome.gnome-sound-recorder
    #gnomeExtensions.gtk-title-bar
    gnomeExtensions.just-perfection
    gnomeExtensions.keyman
    gnomeExtensions.kimpanel
    gnomeExtensions.resource-monitor
    gnomeExtensions.runcat
  ];
}