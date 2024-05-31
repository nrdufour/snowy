{
    virtualisation = {
        virtualbox = {
            host.enable = true;
            host.enableExtensionPack = true;
            guest.enable = true;
        };
    };

    # Make sure any users are included to vboxusers
    users.extraGroups.vboxusers.members = [ "ndufour" ];
}