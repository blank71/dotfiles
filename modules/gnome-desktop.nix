{
  pkgs,
  username,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    gnome-extension-manager
    gnome-pomodoro
    gnome-tweaks
    gnome-sound-recorder
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.kimpanel
    gnomeExtensions.resource-monitor
    gnomeExtensions.runcat
    wl-clipboard
  ];
  services.gnome.gnome-keyring.enable = true;
  programs.ssh.startAgent = true;
}

