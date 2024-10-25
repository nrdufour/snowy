{ pkgs, inputs, ... }: {
    environment.systemPackages = with pkgs; [
        # Tools used by vscode extensions
        helm-ls

        (unstable.vscode-with-extensions.override {

            # See example flake at https://github.com/nix-community/nix-vscode-extensions/blob/master/template/flake.nix

            vscodeExtensions = let
                inherit (inputs.nix-vscode-extensions.extensions.${pkgs.system}) vscode-marketplace;
            in
                with vscode-marketplace; [
                    ## Themes
                    catppuccin.catppuccin-vsc
                    thang-nm.catppuccin-perfect-icons

                    ## Language support
                    golang.go
                    hashicorp.terraform
                    jnoortheen.nix-ide
                    mrmlnc.vscode-json5
                    # ms-azuretools.vscode-docker
                    ms-python.python
                    redhat.ansible
                    redhat.vscode-yaml
                    tamasfe.even-better-toml
                    helm-ls.helm-ls
                    ms-vscode.makefile-tools
                    grafana.vscode-jsonnet
                    github.vscode-github-actions
                    ms-vscode.cpptools-extension-pack
                    unifiedjs.vscode-mdx
                    ms-python.vscode-pylance
                    ms-python.black-formatter
                    nickgo.cuelang

                    ## Formatters
                    esbenp.prettier-vscode
                    darkriszty.markdown-table-prettify

                    ## Linters
                    davidanson.vscode-markdownlint
                    fnando.linter
                    dbaeumer.vscode-eslint
                    charliermarsh.ruff

                    ## Remote development
                    ms-vscode-remote.remote-containers
                    ms-vscode-remote.remote-ssh

                    ## Other
                    # gruntfuggly.todo-tree
                    ionutvmi.path-autocomplete
                    luisfontes19.vscode-swissknife
                    ms-kubernetes-tools.vscode-kubernetes-tools
                    shipitsmarter.sops-edit
                    editorconfig.editorconfig
                    shd101wyy.markdown-preview-enhanced
                    bierner.emojisense
                    yzhang.markdown-all-in-one
                    streetsidesoftware.code-spell-checker
                    # github.copilot
                    mechatroner.rainbow-csv
                    tobermory.es6-string-html
                    bpruitt-goddard.mermaid-markdown-syntax-highlighting
                    bashmish.es6-string-css
                    # github.vscode-pull-request-github
                ];

        })
    ];
}
