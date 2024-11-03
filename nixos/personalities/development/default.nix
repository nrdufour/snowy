{ pkgs, ... }: {
    imports = [
        ./podman.nix
        ./virtualbox.nix
        ./privateca
        ./vscode.nix
        ./libvirtd.nix
        ./container.nix
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
        arduino-ide
        restic
        rclone

        # Because you know ... python and go
        go
        go-tools

        (pkgs.python3.withPackages (python-pkgs: [
            # select Python packages here
            python-pkgs.pyserial
        ]))

        # K8s tools
        kubectl
        kubectl-cnpg
        kubernetes-helm
        fluxcd
        k9s
        timoni
        cue
        kubecolor

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
