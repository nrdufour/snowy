{
  pkgs,
  ...
}:
{
  # From https://wiki.nixos.org/wiki/Ollama
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.unstable.ollama;
  };

  # Ollama UI at port 3000
  services.nextjs-ollama-llm-ui.enable = true;

  # Adding llama-cpp as is first to experiment
  environment.systemPackages = with pkgs; [
    llama-cpp
  ];
}