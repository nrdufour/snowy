{ pkgs, ... }: {
    imports = [
        #./latest_kernel.nix
        ./sound.nix
        ./fonts.nix
        ./dm
        ./printing.nix
        ./gaming.nix
        ./video.nix
        ./bluetooth.nix
    ];

    # Prevent the laptop to suspend when the lid is closed and still on external power
    services.logind.lidSwitchExternalPower = "ignore";

    environment.systemPackages = with pkgs; [
        inkscape
        unstable.discord
        gnome3.gnome-tweaks
    ];
}