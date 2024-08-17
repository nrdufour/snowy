{
  pkgs,
  ...
}: {
  virtualisation = {
    containerd = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
      nerdctl
  ];
}