{
  pkgs,
  ...
}: {
  imports = [
    ../../home-manager/dev
    ../../home-manager/gui
    ../../home-manager/neovim
    ../../home-manager/nix-direnv
    ../../home-manager/tools
    ../../home-manager/wezterm
  ];

  home.packages = with pkgs; [
    warp-terminal
  ];


  programs.bash = {
    enable = true;

    initExtra = ''
    '';
  };
}
