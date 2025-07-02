{
  pkgs,
  ...
}:
{
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # Make sure any users are included to vboxusers
    users.users.ndufour.extraGroups = [ "libvirtd" ];

    environment.systemPackages = with pkgs; [
        # Needed to simulate a TPM for windows 11 ...
        # See https://getlabsdone.com/how-to-install-windows-11-on-kvm/
        # and https://getlabsdone.com/how-to-enable-tpm-and-secure-boot-on-kvm/
        swtpm
    ];
}