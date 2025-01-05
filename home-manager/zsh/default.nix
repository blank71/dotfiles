{pkgs, ...}: {
  home.file.".zshrc" = {
    text = ''
    # Lines configured by zsh-newuser-install
    setopt autocd extendedglob nomatch notify
    unsetopt beep
    bindkey -e
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word

    # End of lines configured by zsh-newuser-install
    # The following lines were added by compinstall
    zstyle :compinstall filename '/home/bl/.zshrc'

    autoload -Uz compinit
    compinit
    '';
  };
}
