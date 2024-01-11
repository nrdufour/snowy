{ pkgs, ... }: {
    imports = [
        ./rtlsdr.nix
    ];

    environment.systemPackages = with pkgs; [
        # Must have for FT8 and Olivia
        wsjtx
    ];
}
