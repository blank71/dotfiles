{
  pkgs,
  username,
  ...
}:
let
  # Tidal Cycles用のHaskell環境を作成
  tidalHaskellEnv = pkgs.haskellPackages.ghcWithPackages (
    hpkgs: with hpkgs; [
      tidal
      # その他の有用なライブラリ
      base
      containers
      random
    ]
  );
in
{
  users.users."${username}".packages = with pkgs; [
    # Haskell environment with Tidal
    tidalHaskellEnv
    haskellPackages.cabal-install

    # supercollider
    supercollider
    supercolliderPlugins.sc3-plugins

    # Audio tools for JACK and debugging
    jack2
    qjackctl
    alsa-utils
    pulseaudio # pactl などのコマンドを含む
    pavucontrol # グラフィカルなオーディオ設定ツール
  ];
}

/*
  https://tidalcycles.org/docs/getting-started/linux_install/

  # install SuperDirt plugin for SuperCollider

  ```zsh
  % sclang

  sc3> Quarks.checkForUpdates({Quarks.install("SuperDirt", "v1.7.4"); thisProcess.recompile()})
  -> Quarks
  ```

  # create sc3-plugins

  https://github.com/supercollider/sc3-plugins/releases

  # install tidal from cabal

  ```zsh
  cabal update; cabal install tidal --lib
  ```
*/
