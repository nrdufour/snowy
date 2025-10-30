# Snowy - NixOS configuration management
# https://github.com/casey/just

# List available recipes (default)
@default:
    just --list

# Update the inputs in the flake.lock file
nix-update:
    nix flake update

# Check the flake is ok
nix-check:
    nix flake check

# Rebuild the OS as a test
nix-test:
    sudo nixos-rebuild test --flake '.#'

# Rebuild the OS and switch
nix-switch:
    sudo nixos-rebuild switch --flake '.#'

# Update all sops secrets
sops-update:
    #!/usr/bin/env bash
    set -euo pipefail
    find . -type f -name '*.sops.yaml' ! -name ".sops.yaml" | while read -r file; do
        echo "Updating $file"
        sops updatekeys "$file"
    done
