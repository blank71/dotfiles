{pkgs, ...}: {
  home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  };

  home.packages = with pkgs;  [
    devcontainer
    tinymist
    wl-clipboard
  ];

  programs.neovim = {
    enable = true;

    vimAlias = false;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      typst-preview-nvim
      copilot-vim
    ];

    extraPackages = with pkgs; [
      nodePackages.nodejs
      xsel
      #ripgrep
      lazygit
      wl-clipboard

      # Go
      #gopls

      # Haskell
      #haskell-language-server
      #haskellPackages.fourmolu

      # Lua
      #lua-language-server
      #stylua

      # OCaml
      ocamlPackages.ocaml-lsp
      ocamlformat

      # Shell
      #shellcheck
      #shfmt

      # Terraform
      #terraform-ls
    ];
  };
}
