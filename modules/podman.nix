{ 
  pkgs, 
  username,
  ...
}: {
  virtualisation = {
    containers.registries.search = ["docker.io"];
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = false;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
    docker = {
      enable = true;
    };
  };
  users.users."${username}".extraGroups = [ "docker" ];
}
