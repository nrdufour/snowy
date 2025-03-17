{ pkgs, ... }: {
    imports = [
        ./rtlsdr.nix
    ];

    environment.systemPackages = with pkgs; [
        # Must have for FT8 and Olivia
        wsjtx

        # For listening for NOAA satellites and others ;-)
        ## See https://www.a-centauri.com/articoli/noaa-poes-satellites-reception for details
        sdrpp # useful for anything actually
        gpredict
    ];
}
