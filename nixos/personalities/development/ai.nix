{
  pkgs,
  config,
  ...
}:
{
  # From https://wiki.nixos.org/wiki/Ollama
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.ollama;
  };

  # Ensure Ollama service has proper CUDA environment
  # This prevents CUDA initialization errors (999) after GPU-intensive workloads
  systemd.services.ollama = {
    path = [ config.boot.kernelPackages.nvidiaPackages.stable ];
    serviceConfig = {
      Environment = [
        "CUDA_PATH=${pkgs.cudaPackages.cudatoolkit}"
        "LD_LIBRARY_PATH=/run/opengl-driver/lib"
      ];
    };
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

    # GPU reset helper script for when CUDA gets stuck after gaming
    (pkgs.writeShellScriptBin "reset-gpu" ''
      echo "Checking for processes using NVIDIA GPU..."
      ${pkgs.lsof}/bin/lsof /dev/nvidia* 2>/dev/null || echo "No processes found"

      echo "Stopping Ollama..."
      systemctl stop ollama

      echo "Reloading NVIDIA kernel modules..."
      modprobe -r nvidia_uvm nvidia_drm nvidia_modeset nvidia || {
        echo "Failed to unload modules. Some processes may still be using the GPU."
        echo "Try closing Steam, games, or other GPU applications first."
        exit 1
      }

      sleep 1
      modprobe nvidia nvidia_modeset nvidia_drm nvidia_uvm

      echo "Starting Ollama..."
      systemctl start ollama

      echo "GPU reset complete. Testing CUDA..."
      sleep 2
      systemctl status ollama
    '')
  ];
}