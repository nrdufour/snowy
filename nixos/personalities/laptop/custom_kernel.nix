{ pkgs, ...}: {
    # Switch to kernel version 6.12.x
    # See https://nixos.wiki/wiki/Linux_kernel

    ## Disable it for now: no kvm == no go !
    # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
}