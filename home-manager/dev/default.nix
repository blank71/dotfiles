{
  pkgs,
  username,
  ...
}: {
  home.packages = with pkgs; [
    gcc 
    go 
    uv
    nixfmt-rfc-style
  ];
}
