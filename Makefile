
## Ref
## sudo nixos-rebuild test -I nixos-config=./configuration.nix

.PHONY: check
check:
	nix flake check

.PHONY: test
test:
	sudo nixos-rebuild test --flake '.#'

.PHONY: switch
switch:
	sudo nixos-rebuild switch --flake '.#'
