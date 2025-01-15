{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        unstable.yt-dlp
        vlc
        ytfzf
        freetube
        kooha # screen recorder
        mpv # good video player
    ];
}