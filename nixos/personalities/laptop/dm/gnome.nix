{
    # Enable wayland for chrome/electron
    # See https://nixos.wiki/wiki/Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    gtk.iconCache.enable = true;

    services = {
        xserver = {
            enable = true;
            desktopManager.gnome = {
                enable = true;
            };
            displayManager.gdm = {
                enable = true;
                wayland = true;
                autoSuspend = true;
            };
        };
        geoclue2.enable = true;
    };
}