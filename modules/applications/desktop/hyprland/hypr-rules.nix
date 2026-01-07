{ pkgs, config, lib, ... }:

let cfg = config.modules.applications.desktop.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      # Window Rules
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # Layer Rules
      layerrule = [ "blur, rofi" "ignorezero, rofi" "ignorealpha 0.5, rofi" ];
    };
  };
}
