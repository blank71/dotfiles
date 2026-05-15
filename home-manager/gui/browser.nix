{
  inputs,
  config,
  username,
  ...
}: {
  programs = {
    firefox = {
      enable = true;
      configPath = "/home/bl/mozilla/firefox";
    };
    google-chrome = {
      enable = true;
    };
  };
}
