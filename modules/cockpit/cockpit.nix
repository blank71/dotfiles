{
  pkgs,
  # lib,
  ...
}:
# let
#   # cockpit-machine = pkgs.callPackage ./cockpit-machine.nix { inherit pkgs; };
#   # libvirt-dbus-self = pkgs.callPackage ./libvirt-dbus.nix { inherit pkgs; };
# in
{
  environment.systemPackages = with pkgs; [
    #   cockpit
    #   libvirt # Needed for virtual-machines
    cockpit-machines
    #   virt-manager # Needed for virtual-machines
    #   libvirt-dbus
  ];
  services.cockpit = {
    enable = true;
    port = 9090;
    openFirewall = true;
    # settings = {
    #   WebService.Origins = lib.mkForce "http://localhost:9090 https://localhost:9090 https://hlab:9090";
    # };
    allowed-origins = [
      "http://localhost:9090"
      "https://localhost:9090"
      "https://hlab:9090"
    ];
    plugins = with pkgs; [
      cockpit-machines
      cockpit-files
      cockpit-podman
    ];
  };
}
