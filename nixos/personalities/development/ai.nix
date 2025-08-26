{
  pkgs,
  ...
}:
{
  # From https://wiki.nixos.org/wiki/Ollama
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.ollama;
  };

  # Ollama UI at port 3000
  services.nextjs-ollama-llm-ui.enable = true;
  
  environment.systemPackages = with pkgs; [
    # Adding llama-cpp as is first to experiment
    llama-cpp

    # Claude-code became a must-have as well
    unstable.claude-code

    # the contender ;) specially for ollama
    unstable.opencode
  ];
}