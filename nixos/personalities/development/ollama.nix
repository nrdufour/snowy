{
  pkgs,
  ...
}:
{
  # From https://wiki.nixos.org/wiki/Ollama
  services.ollama = {
    enable = true;
    package = pkgs.unstable.ollama; # 0.5.4
    acceleration = "cuda";
  };
}