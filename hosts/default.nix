inputs: let
  mkNixosSystem = {
    system,
    hostname,
    username,
    modules,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username;
      };
    };

  mkHomeManagerConfiguration = {
    system,
    username,
    modules,
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system ;
        config = {
          allowUnfree = true;
        };
      };
      modules =
        modules
        ++ [
          {
            home = {
              inherit username;
              homeDirectory = "/home/${username}";
              stateVersion = "22.11";
            };
            programs.home-manager.enable = true;
          }
        ];
    };
in {
  nixos = {
    "x13" = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "x13";
      username = "bl";
      modules = [
        ./x13/nixos.nix
      ];      
    };
    "hlab" = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "hlab";
      username = "bl";
      modules = [
        ./hlab/nixos.nix
      ];      
    };
    "hvm" = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "home-vm";
      username = "bl";
      modules = [
        ./hvm/nixos.nix
      ];      
    };
  };

  home-manager = {
    "bl@x13" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "bl";
      modules = [
        ./x13/home-manager.nix
      ];
    };
    "bl@hlab" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "bl";
      modules = [
        ./hlab/home-manager.nix
      ];
    };
    "bl@hvm" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "bl";
      modules = [
        ./hvm/home-manager.nix
      ];
    };
    "bl@vim" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "bl";
      modules = [
        ./vim/home-manager.nix
      ];
    };
  };
}

