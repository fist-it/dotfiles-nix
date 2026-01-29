{ config, lib, ... }:

let cfg = config.modules.applications.desktop.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        "match:class *, suppress_event maximize"
        "match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0, no_focus on"


        "match:class ^(discord)$, workspace 4 silent"
        "match:class ^(Spotify)$, workspace special:spotify, pseudo on, fullscreen off, size (window_w * 0.5) (window_h * 0.5)" 
      ];

      layerrule = [
        "blur on, match:namespace powermenu"
        "ignore_alpha 0, match:namespace powermenu"
      ];
    };
  };
}
