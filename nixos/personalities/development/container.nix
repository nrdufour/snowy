{
  pkgs,
  ...
}: 
let
  nerdctlPackage = pkgs.nerdctl;
  nerdctlSource = pkgs.fetchFromGitHub {
    owner = "containerd";
    repo = "nerdctl";
    rev = "v${nerdctlPackage.version}";
    sha256 = "z83c8Ji0zSM1QDwjB4FwhHW6XCqG0Hb5crM3jjK46jk=";
  };
in
{
  virtualisation = {
    containerd = {
      enable = true;
    };
  };

  # Containerd (Rootless)
  systemd.user.services.rootless-containerd = {
    enable = true;
    requires = [ "dbus.socket" ];
    wantedBy = ["default.target"];
    description = "Containerd (Rootless)";

    path = with pkgs; [
      # For rootless
      rootlesskit # Providing fakeroot
      slirp4netns # Providing network utilities
      cni-plugins # The actual CNI being used
      containerd
      shadow      # for 'newuidmap'
    ];

    script = nerdctlSource + "/extras/rootless/containerd-rootless.sh";
    reload = "/run/current-system/sw/bin/kill -s HUP $MAINPID"; # TODO replace the hardcoded path if possible
  };

  # # BuildKit (Rootless) ### Soon ...
  # systemd.user.services.buildkit = {
  #   enable = true;
  #   after = [ "network.target" ];
  #   wantedBy = [ "default.target" ];
  #   description = "BuildKit (Rootless)";
  # };

  environment.systemPackages = with pkgs; [
    # For rootless
    rootlesskit # Providing fakeroot
    slirp4netns # Providing network utilities
    cni-plugins # The actual CNI being used

    # Engines
    runc        # the container engine used here

    # Docker cli client
    buildkit    # necessary to build containers
    nerdctlPackage
  ];
}