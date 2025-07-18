{pkgs, ...}: {
  home.packages = with pkgs; [
    fuchsia-cursor
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
  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.1/Fuchsia-Amber.tar.xz"
        "sha256-EtUxqAtMqvfQwrlA90Qcm8ffThD1OAmOSeFECF1uwrE="
        "Fuchsia-Amber";
}
