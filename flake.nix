{
  description = "Nicolas Dufour's flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    ## Pining hardware for 24.05 for now
    ## See https://github.com/NixOS/nixos-hardware/issues/996#issuecomment-2183266924 for explanations
    # nixos-hardware.url = "github:NixOS/nixos-hardware/2f893e185c850bcd6dbf4fbc0c61b1b90d23ff79";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    # sops-nix - secrets with mozilla sops
    # https://github.com/Mic92/sops-nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, sops-nix, ... }@inputs:
    let
    system = "x86_64-linux";
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
    in {
      nixosConfigurations.calypso = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          nixos-hardware.nixosModules.asus-rog-strix-g513im
          sops-nix.nixosModules.sops
          ./nixos/hosts/calypso
        ];
      };
    };
}
