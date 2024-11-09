{ config, pkgs, ... }: {
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ../../personalities/base
            ../../personalities/development
            ../../personalities/laptop
            ../../personalities/ham
            ../../personalities/chat
            ../../personalities/backups
        ];

    networking.hostName = "calypso";

    sops = {
        defaultSopsFile = ../../../secrets/calypso/secrets.sops.yaml;
        secrets = {
            "backups.localndufour.repository" = {};
            "backups.localndufour.password" = {};
            "backups.localndufour.env" = {};
        };
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05";
}