{
  pkgs,
  ...
}:
let
  fontPackages = import ../../modules/font-packages.nix { inherit pkgs; };
  onlyoffice-desktopeditors-with-fonts = pkgs.onlyoffice-desktopeditors.override {
    # OnlyOffice discovers fonts inside its FHS environment at /usr/share/fonts.
    noto-fonts-cjk-sans = pkgs.symlinkJoin {
      name = "onlyoffice-fonts";
      paths = fontPackages;
    };
  };
in
{
  home.packages = with pkgs; [
    bitwarden-desktop
    devcontainer
    fuchsia-cursor
    gnumake
    htop
    lazygit
    pstree
    onlyoffice-desktopeditors-with-fonts
    remmina
    thorium-reader
    tmux
    unzip
    vscode
    wget
    zip
    zellij
    basex
    go
    uv
    nixfmt
    nil
    nixd
    zed-editor
    shfmt

    # rust
    cargo
    rust-analyzer
    rustc
  ];
  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        enable = true;
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 48;
        package = pkgs.runCommand "moveUp" { } ''
          mkdir -p $out/share/icons
          ln -s ${
            pkgs.fetchzip {
              url = url;
              hash = hash;
            }
          } $out/share/icons/${name}
        '';
      };
    in
    getFrom "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.1/Fuchsia-Amber.tar.xz"
      "sha256-EtUxqAtMqvfQwrlA90Qcm8ffThD1OAmOSeFECF1uwrE="
      "Fuchsia-Amber";
}
