{ pkgs, ... }: {
    imports = [
        ./podman.nix
        ./virtualbox.nix
        ./privateca
        ./vscode.nix
        ./libvirtd.nix
    ];

    # Enable aarch64 emulation
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

    environment.systemPackages = with pkgs; [
        # Must have
        vim
        git
        wget
        chezmoi
        pre-commit
        ripgrep
        file
        tree
        starship

        # Because you know ... python and go
        python3
        go
        go-tools

        # K8s tools
        kubectl
        kubernetes-helm
        fluxcd

        # encryption
        sops
        openssl

        # Make it so
        gnumake
        direnv
        vagrant
    ];
}
