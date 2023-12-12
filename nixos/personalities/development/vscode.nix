{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
            ms-python.python
            bbenoist.nix
            ];
        })
    ];
}