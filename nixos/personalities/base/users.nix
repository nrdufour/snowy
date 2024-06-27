{ pkgs, ... }: {
    users.users.ndufour = {
        isNormalUser = true;
        description = "Nicolas Dufour";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.fish;
        packages = with pkgs; [
            firefox
            ungoogled-chromium
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
