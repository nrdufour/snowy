{ pkgs, ... }: {
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
        # Lutris platform
        ## See https://nixos.wiki/wiki/Lutris for more
        lutris

        # for minecraft
        (atlauncher.override { 
            additionalLibs = [
                xorg.libX11
                xorg.libXcursor
                xorg.libXext
                xorg.libXrender
                xorg.libXtst
                xorg.libXi
                xorg.libXrandr
            ];
        })
    ];
}