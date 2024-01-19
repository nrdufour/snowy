{ pkgs, ... }: {
    imports = [
        #./latest_kernel.nix
        ./sound.nix
        ./fonts.nix
        ./dm
        ./printing.nix
        ./steam.nix
        ./video.nix
        ./bluetooth.nix
    ];

    environment.systemPackages = with pkgs; [
        inkscape
        unstable.discord
    ];
}