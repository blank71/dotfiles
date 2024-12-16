{
  inputs,
  ...
}: {
  imports = [inputs.vscode-server.nixosModules.default];
  services.vscode-server.enable = true;
  programs.nix-ld.enable = true;
}

