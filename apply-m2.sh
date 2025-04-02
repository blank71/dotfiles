#!/bin/bash

# nix-darwinが未インストールの場合はインストール
if ! command -v darwin-rebuild &> /dev/null; then
  echo "Installing nix-darwin..."
  nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
  ./result/bin/darwin-installer
fi

# macOS構成を適用
echo "Applying macOS configuration..."
nix --experimental-features "nix-command flakes" build .#darwinConfigurations.m2.system
./result/sw/bin/darwin-rebuild switch --flake .#m2

echo "Configuration applied successfully!"
