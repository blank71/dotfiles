{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_6_6_hardened.vmware
    linuxKernel.packages.linux_6_6.vmware 
    vmware-workstation
  ];
  virtualisation.vmware.host.enable = true;
}