{
  # From https://nixos.wiki/wiki/Bluetooth

  # enables support for Bluetooth
  hardware.bluetooth.enable = true;
  # powers up the default Bluetooth controller on boot
  hardware.bluetooth.powerOnBoot = true;

  # In order to show battery charge
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };

  # gui
  services.blueman.enable = true;
}