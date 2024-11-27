{
    # Enable wayland for chrome/electron
    # See https://nixos.wiki/wiki/Wayland
    ### Disabling it to see if it's causing vscode to misbehave with gnome favorite system
    #environment.sessionVariables.NIXOS_OZONE_WL = "1";
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

    # Note: yet another trouble with nvidia, messing up with wayland and gnome 47
    # see https://gitlab.freedesktop.org/mesa/mesa/-/issues/11723
    # and https://gitlab.gnome.org/GNOME/gtk/-/issues/7010
    # So we have to revert the GSK Renderer from "vulkan" to "ngl"
    # --- Related to nvidia 56x
    environment.variables = {
        GSK_RENDERER = "ngl";
    };
}
