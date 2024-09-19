{ pkgs, ... }: {
    users.users.ndufour = {
        isNormalUser = true;
        description = "Nicolas Dufour";
        extraGroups = [ "networkmanager" "wheel" "dialout" ];
        shell = pkgs.fish;
        packages = with pkgs; [
            firefox
            google-chrome
            thunderbird
            librewolf
            betterbird
        ];
    };

    # Enable drm protected content playing in chrome
    nixpkgs.config = {
        chromium = {
            enableWideVine = true;
        };
    };
}
