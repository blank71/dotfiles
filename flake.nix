{
    inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # ハードウェア設定のコレクション
    xremap.url = "github:xremap/nix-flake"; # キー設定をいい感じに変更できるツール
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # macOS用のnix-darwin
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs:
  let
    # nix-darwinシステムの作成関数
    mkDarwinSystem = hostName: system: darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ./hosts/${hostName}/configuration.nix
        
        # Home Manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.bl = import ./hosts/${hostName}/home.nix;
        }
      ];
      specialArgs = { inherit inputs; };
    };
  in
  {
    nixosConfigurations = (import ./hosts inputs).nixos;
    homeConfigurations = (import ./hosts inputs).home-manager;

    # macOSの設定を追加
    darwinConfigurations = {
      m2 = mkDarwinSystem "m2" "aarch64-darwin"; # Apple Silicon用
      # Intel Macの場合は "x86_64-darwin"
    };
  };
}
