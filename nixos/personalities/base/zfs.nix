{
  # setup boot
  boot = {
    supportedFilesystems = [
      "zfs"
    ];
    zfs = {
      forceImportRoot = false; # if stuck on boot, modify grub options , force importing isn't secure
      # extraPools = [ "tank" ];
    };


  };

  services.zfs = {
    autoScrub.enable = true;
    # Defaults to weekly and is a bit too regular for my NAS
    autoScrub.interval = "monthly";
    trim.enable = true;
  };
}