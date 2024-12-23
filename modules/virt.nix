{
  pkgs,
  username,
  ...
}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["bl"];
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    quickemu
    virtio-win
  ];

  users.users."${username}".extraGroups = [ "libvirtd" ];
}