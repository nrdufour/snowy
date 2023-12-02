{
    virtualisation = {
        virtualbox = {
            host.enable = true;
            host.enableExtensionPack = true;
            guest.enable = true;
            guest.x11 = true;
        };
    };

    # Make sure any users are included to vboxusers
    users.extraGroups.vboxusers.members = [ "ndufour" ];
}