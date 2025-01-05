{
  pkgs,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      histSize = 10000;
      histFile = "$HOME/.zsh_history";
      promptInit = ''
      function prompt {
        PROMPT="%F{green}%n@%M:%~%f%F{yellow}$(__git_ps1 " (%s)")%f %F{cyan}%T%f "$'\n'"%# "
      }

      autoload -Uz add-zsh-hook
      add-zsh-hook precmd prompt
      '';
    };
  };
  users.defaultUserShell = pkgs.zsh;
}