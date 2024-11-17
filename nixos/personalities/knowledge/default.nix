{
  pkgs,
  ...
}: {

  environment.systemPackages = with pkgs; [
      # Must have
      kiwix
      kiwix-tools
      zim-tools

      # News
      liferea
      newsflash
  ];
}