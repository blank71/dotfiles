{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
  }
  # nix = {
  #   settings = {
  #     experimental-features = ["nix-command" "flakes"];
  #   };
  # };

  # imports = [
  #   ../../home-manager/neovim
  # ];
}
