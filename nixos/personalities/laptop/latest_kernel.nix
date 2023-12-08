{ pkgs, ...}: {
    # Switch to latest kernel version
    # See https://nixos.wiki/wiki/Linux_kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;
}