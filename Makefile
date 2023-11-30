
## Ref
## sudo nixos-rebuild test -I nixos-config=./configuration.nix

test:
	sudo nixos-rebuild test --flake '.#'

switch:
	sudo nixos-rebuild switch --flake '.#'
