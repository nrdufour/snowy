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
      echo "=== GPU Reset for Ollama ==="
      echo ""
      echo "Checking for processes using NVIDIA GPU..."
      ${pkgs.lsof}/bin/lsof /dev/nvidia* 2>/dev/null | grep -v "gnome-shell" || echo "No non-GNOME processes found"

      # Kill any lingering Steam processes
      echo ""
      echo "Killing Steam processes..."
      ${pkgs.procps}/bin/pkill -f "steam" || echo "No Steam processes found"
      sleep 2

      # Try to unload just the UVM module (CUDA-specific)
      echo ""
      echo "Attempting to reset CUDA subsystem..."

      # Stop Ollama first
      systemctl stop ollama

      # Try to unload nvidia_uvm (CUDA-specific module)
      if modprobe -r nvidia_uvm 2>/dev/null; then
        echo "✓ Unloaded nvidia_uvm module"
        sleep 1
        modprobe nvidia_uvm
        echo "✓ Reloaded nvidia_uvm module"
      else
        echo "⚠ Could not reload nvidia_uvm (GNOME is using GPU)"
        echo "  Trying alternative: restart Ollama with fresh environment"
      fi

      # Restart Ollama (will pick up proper environment variables)
      echo ""
      echo "Restarting Ollama..."
      systemctl start ollama

      sleep 2
      echo ""
      echo "=== Status ==="
      systemctl status ollama --no-pager -l | head -20

      echo ""
      echo "If Ollama still can't see GPU, you may need to logout/login from GNOME"
      echo "or check logs with: journalctl -u ollama -n 50"
    '')
  ];
}