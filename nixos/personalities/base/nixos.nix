{ pkgs, ... }: {
    nix = {
        settings = {
            trusted-substituters = [
              "https://nrdufour.cachix.org"
              "https://nix-community.cachix.org"
              "https://numtide.cachix.org"
            ];

            trusted-public-keys = [
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
              "nrdufour.cachix.org-1:nwmZmZ3b4h4cEJtIRib7trk8SVB49trCnlxVSNz0YQs="
            ];

            trusted-users = [ "root" "@wheel" ];

            # Fallback quickly if substituters are not available.
            connect-timeout = 5;

            experimental-features = [ "nix-command" "flakes" ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            # Delete older generations too
            options = "--delete-older-than 7d";
        };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        ## NOTE: disabling the usage of any-nix-shell for now
        ## Instead, simply put the following alias in ~/.config/fish/config.fish
        ## alias nix-shell='nix-shell --run fish'
        # any-nix-shell
        nh
    ];
}
