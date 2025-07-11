.DEFAULT_GOAL := build

HOST := $(shell hostname)

update:
	sudo nix flake update \
	--extra-experimental-features nix-command \
	--extra-experimental-features flakes \
	--flake "/home/bl/dotfiles/"

build:
	sudo nixos-rebuild switch --show-trace --refresh --verbose --upgrade --flake "/home/bl/dotfiles/#$(HOST)"; \
	nix run home-manager -- switch --flake "/home/bl/dotfiles/#bl@$(HOST)"

update-build: update build

vim:
	nix-channel --update
	home-manager switch -f hosts/vim/home.nix --show-trace

clean:
	sudo nix store gc
	sudo nix-collect-garbage -d
	sudo nix-env --delete-generations old
	sudo nix-store --gc
	sudo nix-collect-garbage -d
