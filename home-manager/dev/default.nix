{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    gcc
    go
    uv
    nixfmt
    nil
    nixd
    koodo-reader
    zed-editor
    # elmPackages.elm
    # elmPackages.elm-test
    # elmPackages.elm-format
    # elmPackages.elm-language-server
  ];
}
