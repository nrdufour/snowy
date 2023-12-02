{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../personalities/base
      ../../personalities/development
      ../../personalities/laptop
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    chezmoi
    python3
    wget
    weechat
    starship
    lshw
    discord
    gnome3.gnome-tweaks
    kubectl
    vagrant
    yt-dlp
    vlc
    gnumake
    direnv
    sops
    openssl
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        ms-python.python
        bbenoist.nix
      ];
    })
    ytfzf
    any-nix-shell
    freetube
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
