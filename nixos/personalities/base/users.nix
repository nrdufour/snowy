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
}
