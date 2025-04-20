{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        unstable.yt-dlp
        vlc
        libvlc
        ytfzf
        freetube
        kooha # screen recorder
        mpv # good video player
        obs-studio

        ### GStreamer plugins
        # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
        gst_all_1.gstreamer
        # Common plugins like "filesrc" to combine within e.g. gst-launch
        gst_all_1.gst-plugins-base
        # Specialized plugins separated by quality
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        # Plugins to reuse ffmpeg to play almost every video format
        gst_all_1.gst-libav
        # Support the Video Audio (Hardware) Acceleration API
        gst_all_1.gst-vaapi
    ];


  environment.variables = {
    GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
    GST_PLUGIN_SYSTEM_PATH_1_0="${pkgs.gst_all_1.gstreamer.out}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-base}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-good}/lib/gstreamer-1.0";
  };
}