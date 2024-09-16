{ pkgs, ... }: {
    imports = [
        ./podman.nix
        ./virtualbox.nix
        ./privateca
        ./vscode.nix
        ./libvirtd.nix
        # ./container.nix
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
        go-task
        pwgen
        cachix

        # Because you know ... python and go
        python3
        go
        go-tools

        # K8s tools
        kubectl
        kubectl-cnpg
        kubernetes-helm
        fluxcd
        k9s
        timoni
        cue

        # encryption
        sops
        openssl

        # Make it so
        gnumake
        direnv
        vagrant
        bottles

        # Becoming must-have
        ollama
    ];
}
