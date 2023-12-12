{ pkgs, ... }: {
    imports = [
        ./podman.nix
        ./virtualbox.nix
        ./privateca
        ./vscode.nix
    ];

    environment.systemPackages = with pkgs; [
        # Must have
        vim
        git
        wget
        chezmoi

        # Because you know ... python
        python3

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
    ];
}