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
            vivaldi
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
