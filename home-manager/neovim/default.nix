{pkgs, ...}: {
  home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

    viAlias = true;
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

      # C/C++
      clang-tools

      # CUE
      cuelsp

      # Docker
      nodePackages.dockerfile-language-server-nodejs

      # Go
      gopls

      # GraphQL
      nodePackages.graphql-language-service-cli

      # Haskell
      haskell-language-server
      haskellPackages.fourmolu

      # HTML/CSS
      nodePackages.vscode-langservers-extracted

      # JavaScript/TypeScript
      nodePackages.prettier
      nodePackages.typescript-language-server
      nodePackages.svelte-language-server
      nodePackages."@tailwindcss/language-server"
      biome

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
