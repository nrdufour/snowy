{ pkgs, ... }: {
    users.users.ndufour = {
        isNormalUser = true;
        description = "Nicolas Dufour";
        extraGroups = [ "networkmanager" "wheel" "dialout" ];
        shell = pkgs.fish;
        packages = with pkgs; [
            firefox
            google-chrome
            chromium
            thunderbird
            librewolf
            # betterbird ## Disabling it because of CVE-2024-4367
            bc
        ];
    };

    # Enable drm protected content playing in chrome
    nixpkgs.config = {
        chromium = {
            enableWideVine = true;
        };
    };
}
