{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    mathematica
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    mathematica = pkgs.mathematica.override {
      source = pkgs.requireFile {
        name = "Wolfram_15_LIN_Japanese_Bndl.sh";
        # Get this hash via a command similar to this:
        # nix-store --query --hash $(nix store add-path Wolfram_15_LIN_Japanese_Bndl.sh --name 'Wolfram_15_LIN_Japanese_Bndl.sh')
        sha256 = "sha256:1j23y2402lynzsc34qn596fiz82vxdiyz0ms5asgbxb7k926zw08";
        message = ''
          Your override for Mathematica includes a different src for the installer,
          and it is missing.
        '';
        hashMode = "recursive";
      };
    };

    # Override libtins to disable tests that are failing due to C++17 requirements
    # libtins = pkgs.libtins.overrideAttrs (oldAttrs: {
    #   doCheck = false;
    # });
  };
}
