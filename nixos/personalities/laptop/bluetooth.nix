{
  # From https://nixos.wiki/wiki/Bluetooth

  hardware.bluetooth = {
    # enables support for Bluetooth
    enable = true;
    # powers up the default Bluetooth controller on boot
    powerOnBoot = true;

    # In order to show battery charge
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  # gui
  services.blueman.enable = true;
}