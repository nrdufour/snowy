# Snowy

Nicolas Dufour's Nixos flake configuration to setup the laptop (for now).

## Usage

Simply:

+ `make update` : update the flake locks (`nix flake update`)
+ `make check` : ensure the flake is ok (`nix flake check`)
+ `make test` : deploy without changing the boot (~ `nixos-rebuild test`)
+ `make switch` : deploy and add a new generation to the boot (~ `nixos-rebuild switch`)

## Side notes

Heavily inspired by 2 excellent repositories:

+ <https://github.com/anthr76/snowflake>
+ <https://github.com/bjw-s/nix-config/>
