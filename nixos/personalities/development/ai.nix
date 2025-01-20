{
  pkgs,
  ...
}:
{
  # From https://wiki.nixos.org/wiki/Ollama
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  # Ollama UI at port 3000
  services.nextjs-ollama-llm-ui.enable = true;

  # Enabling llama-cpp as well (port 8080 by default)
  services.llama-cpp.enable = true;
}