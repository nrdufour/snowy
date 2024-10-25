{
  description = "Nicolas Dufour's flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    ## Pining hardware for 24.05 for now
    ## See https://github.com/NixOS/nixos-hardware/issues/996#issuecomment-2183266924 for explanations
    nixos-hardware.url = "github:NixOS/nixos-hardware/2f893e185c850bcd6dbf4fbc0c61b1b90d23ff79";

    # ## Lix project
    # ## See https://lix.systems/add-to-config/
    # lix-module = {
    #   url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, ... }@inputs:
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
          # lix-module.nixosModules.default
          ./nixos/hosts/calypso
        ];
      };
    };
}
