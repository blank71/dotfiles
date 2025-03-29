{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    htop
    pstree
    remmina
    tmux
    unzip
    vscode
    wget
    zip
    zellij
  ];
}
