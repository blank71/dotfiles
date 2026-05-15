{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      fira-code
      hackgen-font
      ibm-plex
      ipafont
      ipaexfont
      migu
      fira-code
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      udev-gothic
      udev-gothic-nf
    ];
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
