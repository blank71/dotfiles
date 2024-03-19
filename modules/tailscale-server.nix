{
  config,
  pkgs, 
  ...
}: {
  # if Auto Suspend enable, this will down
  # disable Auto Suspend require
  environment.systemPackages = [ pkgs.tailscale ];
  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
    allowedTCPPorts = [ 22 ];
  };
}