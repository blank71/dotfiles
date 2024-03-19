{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gnumake
    pstree
    remmina
    unzip
    vscode
    wget
    zip
  ];
}