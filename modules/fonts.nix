{ 
  pkgs,
  ... 
}: {
  fonts = {
    packages = with pkgs; [
      fira-code
      hackgen-font
      ibm-plex
      ipafont
      ipaexfont
      migu
      #nerd-fonts
      #nerd-fonts.fira-code
      fira-code
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
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
    #   localConf = ''
    #     <?xml version="1.0"?>
    #     <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    #     <fontconfig>
    #       <description>Change default fonts for Steam client</description>
    #       <match>
    #         <test name="prgname">
    #           <string>steamwebhelper</string>
    #         </test>
    #         <test name="family" qual="any">
    #           <string>sans-serif</string>
    #         </test>
    #         <edit mode="prepend" name="family">
    #           <string>Migu 1P</string>
    #         </edit>
    #       </match>
    #     </fontconfig>
    #   '';
    };
  };
}
