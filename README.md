# Snowy

Nicolas Dufour's Nixos flake configuration to setup the laptop (for now).

## Usage

Simply:

+ `task nix:update` : update the flake locks (`nix flake update`)
+ `task nix:check` : ensure the flake is ok (`nix flake check`)
+ `task nix:test` : deploy without changing the boot (~ `nixos-rebuild test`)
+ `task nix:switch` : deploy and add a new generation to the boot (~ `nixos-rebuild switch`)
+ `task sops:update` : update all sops secret files with latest keys

## Side notes

Heavily inspired by 2 excellent repositories:

+ <https://github.com/anthr76/snowflake>
+ <https://github.com/bjw-s/nix-config/>
