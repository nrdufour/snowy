{ pkgs, ... }: {
    # Enable networking
    networking.networkmanager.enable = true;

    # networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

    services.resolved = {
        enable = true;
        # fallbackDns = [ "9.9.9.9" "1.1.1.1" ];
    };

    environment.systemPackages = with pkgs; [
        update-resolv-conf
    ];

    services.sshd.enable = true;
}