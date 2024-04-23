{
  pkgs, 
  username,
  ...
}: {
  users.users."${username}".packages = with pkgs; [
    libreoffice-qt
    pympress
  ];
}