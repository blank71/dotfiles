{
  pkgs,
  username,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    gnome-extension-manager
<<<<<<< HEAD
    gnome.pomodoro
    # gnome-pomodoro
    gnomeExtensions.keyman
    # gnome-keyring
    gnome.gnome-tweaks
    # gnome-tweaks
    gnome.gnome-sound-recorder
    #gnomeExtensions.gtk-title-bar
=======
    gnome-pomodoro
    gnome-keyring
    gnome-tweaks
    gnome-sound-recorder
>>>>>>> origin/main
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.keyman
    gnomeExtensions.kimpanel
    gnomeExtensions.resource-monitor
    gnomeExtensions.runcat
  ];
}

