{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_6_1.vmware
    vmware-workstation
  ];
  virtualisation.vmware.host.enable = true;
}