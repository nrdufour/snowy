{
  pkgs,
  ...
}: {

  environment.systemPackages = with pkgs; [
      # Must have
      kiwix
      kiwix-tools
      zim-tools
  ];
}