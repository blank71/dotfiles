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
}
