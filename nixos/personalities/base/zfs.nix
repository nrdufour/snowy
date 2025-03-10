{
  networking.hostId = "2b08729b";

  # setup boot
  boot = {
    supportedFilesystems = [
      "zfs"
    ];
    zfs = {
      forceImportRoot = false; # if stuck on boot, modify grub options , force importing isn't secure
      extraPools = [ "tank"];
      devNodes = "/dev/disk/by-id";
    };
  };

  # Disable this unit as it's slowing down the boot by at least 3 mins wait !
  # See https://discourse.nixos.org/t/boot-faster-by-disabling-udev-settle-and-nm-wait-online/6339
  # and main issue here https://github.com/NixOS/nixpkgs/issues/244562
  # and upstream in zfs here https://github.com/openzfs/zfs/issues/10891
  systemd.services.systemd-udev-settle.enable = false;

  services.zfs = {
    autoScrub.enable = true;
    # Defaults to weekly and is a bit too regular for my NAS
    autoScrub.interval = "monthly";
    trim.enable = true;
  };
}