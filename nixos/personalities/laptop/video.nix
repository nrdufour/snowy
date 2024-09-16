{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        yt-dlp
        vlc
        ytfzf
        freetube
        kooha # screen recorder
    ];
}