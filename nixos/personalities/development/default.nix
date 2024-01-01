{ pkgs, ... }: {
    imports = [
        ./podman.nix
        ./virtualbox.nix
        ./privateca
        ./vscode.nix
        ./libvirtd.nix
    ];

    environment.systemPackages = with pkgs; [
        # Must have
        vim
        git
        wget
        chezmoi
        pre-commit
        ripgrep

        # Because you know ... python and go
        python3
        go

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
