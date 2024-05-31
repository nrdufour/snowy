{ config, pkgs, ... }: {
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ../../personalities/base
            ../../personalities/development
            ../../personalities/laptop
            ../../personalities/ham
            ../../personalities/chat
        ];

    networking.hostName = "calypso";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05";
}