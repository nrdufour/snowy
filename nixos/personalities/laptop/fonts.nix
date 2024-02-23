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
            noto-fonts-cjk
            noto-fonts-emoji
            noto-fonts-extra
            ubuntu_font_family
            fira-code
            fira-code-symbols
            nerdfonts
        ];
    };
}
