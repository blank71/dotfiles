{
  pkgs,
  ...
}:
{
  fonts = {
    packages = import ./font-packages.nix { inherit pkgs; };
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Serif"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Sans"
          "Noto Color Emoji"
        ];
        monospace = [
          "HackGen Console"
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
