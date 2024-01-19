{ config, pkgs, ... }: {
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ../../personalities/base
            ../../personalities/development
            ../../personalities/laptop
            ../../personalities/ham
        ];

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        weechat
        starship
        gnome3.gnome-tweaks
    ];

    networking.hostName = "calypso";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "23.11";
}