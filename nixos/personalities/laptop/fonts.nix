{ pkgs, ... }: {
    fonts = {
        enableDefaultPackages = true;
        fontDir.enable = true;
        fontconfig = {
            antialias = true;
            cache32Bit = true;
            hinting.autohint = true;
            hinting.enable = true;
        };
        
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-emoji
            noto-fonts-extra
            ubuntu_font_family
            fira-code
            fira-code-symbols
        ]
        # Installing all nerd-fonts (since 25.05)
        ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    };
}
