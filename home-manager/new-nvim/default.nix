{pkgs, ...}: {
  home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

    vimAlias = false;

    plugins = with pkgs.vimPlugins; [
      #lazy-nvim
    ];

    extraPackages = with pkgs; [
      #xsel
      #ripgrep
      #lazygit

      # Go
      #gopls

      # Haskell
      #haskell-language-server
      #haskellPackages.fourmolu

      # Lua
      #lua-language-server
      #stylua

      # OCaml
      #ocamlPackages.ocaml-lsp
      #ocamlformat

      # Shell
      #shellcheck
      #shfmt

      # Terraform
      #terraform-ls
    ];
  };
}
