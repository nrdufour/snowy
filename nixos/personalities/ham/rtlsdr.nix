{ pkgs, ...}: {
  ## Heavily inspired from this post:
  ## https://discourse.nixos.org/t/sdr-radio-with-rtl-sdr-usb-dongle-setup/8324

  # blacklist this module
  boot.kernelParams = [ "modprobe.blacklist=dvb_usb_rtl28xxu" ]; 

  services.udev.packages = [ pkgs.rtl-sdr ];

  environment.systemPackages = with pkgs; [
    pkgs.rtl-sdr
    gqrx
  ];

  hardware.rtl-sdr.enable = true;
  users.users.ndufour.extraGroups = [ "plugdev" ];
}
