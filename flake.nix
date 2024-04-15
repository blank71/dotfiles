{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # ハードウェア設定のコレクション
    xremap.url = "github:xremap/nix-flake"; # キー設定をいい感じに変更できるツール
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = inputs: {
    nixosConfigurations = (import ./hosts inputs).nixos;
    homeConfigurations = (import ./hosts inputs).home-manager;
  };
  # // inputs.flake-utils.lib.eachDefaultSystem (system: let
  #   pkgs = import inputs.nixpkgs {
  #     inherit system;
  #   };
  #   scripts = with pkgs; [
  #     (writeScriptBin "switch-home" ''
  #       home-manager switch --flake ".#$@"
  #     '')
  #     (writeScriptBin "switch-nixos" ''
  #       sudo nixos-rebuild switch --flake ".#$@"
  #     '')
  #   ];
  # in {
  #   formatter = pkgs.alejandra;
  #   devShell = pkgs.mkShell {
  #     packages = scripts;
  #   };
  # });
}
