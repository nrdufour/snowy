{
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # Make sure any users are included to vboxusers
    users.users.ndufour.extraGroups = [ "libvirtd" ];
}