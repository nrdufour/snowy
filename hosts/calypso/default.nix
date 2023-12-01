{ config, pkgs, ... }: {
    imports = [
        ./configuration.nix
    ];
    networking.hostName = "calypso";
}