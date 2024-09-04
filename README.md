# x13

```
sudo nix flake update /home/bl/dotfiles/; \ 
sudo nixos-rebuild switch --show-trace --refresh --verbose --upgrade --flake /home/bl/dotfiles/#x13; \
nix run home-manager -- switch --flake /home/bl/dotfiles/#bl@x13
```

# hlab

```
sudo nix flake update /home/bl/dotfiles/; \
sudo nixos-rebuild switch --show-trace --refresh --verbose --upgrade --flake /home/bl/dotfiles/#hlab; \
nix run home-manager -- switch --flake /home/bl/dotfiles/#bl@hlab
```

# hvm

```
sudo nix flake update /home/bl/dotfiles/; \ 
sudo nixos-rebuild switch --show-trace --refresh --verbose --upgrade --flake /home/bl/dotfiles/#hvm; \ 
nix run home-manager -- switch --flake /home/bl/dotfiles/#bl@hvm
```

# vim

home-manager

```
nix-channel --update; \
home-manager build -f hosts/vim/home.nix --show-trace
```
