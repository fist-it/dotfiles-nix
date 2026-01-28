{ pkgs, config, lib, ... }:

let cfg = config.modules.applications.desktop.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      layerrule = [
        "blur on, match:namespace powermenu"
        "ignore_alpha 0, match:namespace powermenu"
      ];
    };
  };
}
