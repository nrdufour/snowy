{ config, pkgs, ... }: {
    imports = [
        ./configuration.nix
    ];
    networking.hostName = "calypso";
    
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "23.11";
}