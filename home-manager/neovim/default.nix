{pkgs, ...}: {
  home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraPackages = with pkgs; [
      xsel
      ripgrep
      lazygit

      # Bash
      nodePackages.bash-language-server

      # Go
      gopls

      # GraphQL
      nodePackages.graphql-language-service-cli

      # Haskell
      haskell-language-server
      haskellPackages.fourmolu

      # HTML/CSS
      nodePackages.vscode-langservers-extracted

      # Lua
      lua-language-server
      stylua

      # OCaml
      ocamlPackages.ocaml-lsp
      ocamlformat

      # Protocol Buffers
      buf-language-server

      # Shell
      shellcheck
      shfmt

      # Terraform
      terraform-ls

      # TOML
      taplo

    ];
  };
}
