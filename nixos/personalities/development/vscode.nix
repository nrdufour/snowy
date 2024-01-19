{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        (unstable.vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
            ms-python.python
            ms-vscode.makefile-tools
            ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                    name = "signageos-vscode-sops";
                    publisher = "signageos";
                    version = "0.8.0";
                    sha256 = "1mjvlv3yr2ilyki5ydj8kn851rr1lmf05rm9rkv8dihhyqmdpiid";
                }
                {
                    name = "nix-ide";
                    publisher = "jnoortheen";
                    version = "0.2.2";
                    sha256 = "1264027sjh9a112si0y0p3pk3y36shj5b4qkpsj207z7lbxqq0wg";
                }
                {
                    name = "ansible";
                    publisher = "redhat";
                    version = "2.9.118";
                    sha256 = "0yndj2r0w2zxc5firxgfrykkc5ajy9gsmrfmkz80kfhwk33n9y1p";
                }
                {
                    name = "prettier-vscode";
                    publisher = "esbenp";
                    version = "10.1.0";
                    sha256 = "01s0vi2h917mqfpdrhqhp2ijwkibw95yk2js0l587wvajbbry2s9";
                }
                {
                    name = "linter";
                    publisher = "fnando";
                    version = "0.0.19";
                    sha256 = "13bllbxd7sy4qlclh37qvvnjp1v13al11nskcf2a8pmnmj455v4g";
                }
                {
                    name = "catppuccin-vsc";
                    publisher = "catppuccin";
                    version = "3.8.2";
                    sha256 = "034rwrd56xcgnzfqvpbdhhhil7ihxdqqhfh2wikk6c1xvw52wiwl";
                }
                {
                    name = "catppuccin-vsc-icons";
                    publisher = "catppuccin";
                    version = "0.30.0";
                    sha256 = "035rl1kx565h9s0xlh20pr6p26g9g9zy2l4zag0bn653lbm51jhg";
                }
                {
                    name = "pre-commit-helper";
                    publisher = "elagil";
                    version = "0.4.3";
                    sha256 = "1877k35biy72sh0c5f890z0mh36sr2cvd3d1mmw9mb2mdfq6xyqk";
                }
                {
                    name = "vscode-yaml";
                    publisher = "redhat";
                    version = "1.14.0";
                    sha256 = "0pww9qndd2vsizsibjsvscz9fbfx8srrj67x4vhmwr581q674944";
                }
                {
                    name = "go";
                    publisher = "golang";
                    version = "0.40.0";
                    sha256 = "1k2zv49pam436cgvb970dc9n4xpdkd07lp8jllrsx5vnx7m2ml52";
                }
                {
                    name = "vscode-kubernetes-tools";
                    publisher = "ms-kubernetes-tools";
                    version = "1.3.15";
                    sha256 = "1x6npc90p6b1wx5sd1hd0x0djahmffr6lw9cxh2zg10rbpq48w8i";
                }
                {
                    name = "terraform";
                    publisher = "hashicorp";
                    version = "2.29.0";
                    sha256 = "tGBs7+5ho+mvcJQF5gi/XfoiJ70MuCtFFOiPi2baae8=";
                }
                {
                    name = "path-autocomplete";
                    publisher = "ionutvmi";
                    version = "1.25.0";
                    sha256 = "0jjqh3p456p1aafw1gl6xgxw4cqqzs3hssr74mdsmh77bjizcgcb";
                }
                {
                    name = "vscode-pylance";
                    publisher = "ms-python";
                    version = "2023.11.10";
                    sha256 = "1i2xywjw4dghw0bbgk2z90zhgiy7sxdl4yv88399shjwyvbp2psf";
                }
                {
                    name = "vscode-docker";
                    publisher = "ms-azuretools";
                    version = "1.28.0";
                    sha256 = "0nmc3pdgxpmr6k2ksdczkv9bbwszncfczik0xjympqnd2k0ra9h0";
                }
                {
                    name = "remote-ssh";
                    publisher = "ms-vscode-remote";
                    version = "0.107.1";
                    sha256 = "1q9xp8id9afhjx67zc7a61zb572f296apvdz305xd5v4brqd9xrf";
                }
            ];
        })
    ];
}
