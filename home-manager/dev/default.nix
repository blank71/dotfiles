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
    shfmt
    zed-editor

    glab
    forgejo-cli
    vja

    talosctl
    kubectl
    kubernetes-helm

    codex
  ];
}
