{
  pkgs,
  username,
  ...
}: {
  home.file = {
    source = ./.;
    recursive = true;
  }
  users.users."${username}".packages = with pkgs; [
    wezterm
  ];
}