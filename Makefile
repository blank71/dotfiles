.DEFAULT_GOAL := build

HOST := $(shell hostname)

update:
	sudo nix flake update \
	--extra-experimental-features nix-command \
	--extra-experimental-features flakes \
	--flake "/home/bl/dotfiles/"

build-nixos:
	sudo nixos-rebuild switch --show-trace --refresh --verbose --upgrade --flake "/home/bl/dotfiles/#$(HOST)"; \

build-home-manager:
	nix run home-manager -- switch --flake "/home/bl/dotfiles/#bl@$(HOST)"

build: build-nixos build-home-manager

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
