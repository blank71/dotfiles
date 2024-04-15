{
  pkgs,
  ...
}: {
  imports = [
    ../../home-manager/dev
    ../../home-manager/gui
    ../../home-manager/neovim
    ../../home-manager/tools
    ../../home-manager/wezterm
  ];

  programs.bash = {
    enable = true;

    initExtra = ''
    alias code-remote='code --remote ssh-remote+hv home/bl'
    '';
  };
}
