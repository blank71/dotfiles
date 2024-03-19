{
  pkgs,
  username,
  ...
}: {
  home.packages = with pkgs; [
    gcc 
    go 
    opam
  ];
}