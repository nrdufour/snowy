{ pkgs, ... }: {
  # IRC and more ;-)
  environment.systemPackages = with pkgs; [
      weechat
      weechatScripts.weechat-matrix
  ];
}