# Snowy

Nicolas Dufour's Nixos flake configuration to setup the laptop (for now).

## Usage

Simply:

+ `task nix:update` : update the flake locks (`nix flake update`)
+ `task nix:check` : ensure the flake is ok (`nix flake check`)
+ `task nix:test` : deploy without changing the boot (~ `nixos-rebuild test`)
+ `task nix:switch` : deploy and add a new generation to the boot (~ `nixos-rebuild switch`)
+ `task sops:update` : update all sops secret files with latest keys

## TODO/Recently

Recently switched to 24.11 even though it's still a bit in beta at the moment.

TODO:

+ refactor the whole repository to follow the module paradigm
+ see how to merge it into the snowpea project
+ see a better way to control kernel version

## Thank you

Heavily inspired by 2 excellent repositories:

+ <https://github.com/anthr76/snowflake>
+ <https://github.com/bjw-s/nix-config/>
