{ pkgs, config, lib, ... }:

let
  cfg = config.modules.applications.desktop.hyprland;
in {
  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      hyprpaper
      hyprlock
      hyprpolkitagent
      hyprpicker
      swayidle
      swayosd
      eww
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "ecosystem:no_update_news" = true;

        monitor = [
          "DP-2, 2560x1440@144, auto, 1"
          "DP-3, 2560x1440@144, auto-left, 1"
        ];

        # ---------------------------------------------------------
        # PROGRAMS
        # ---------------------------------------------------------
        "$optMod" = "ALT";
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$browser" = "qutebrowser";
        "$fileManager" = "nemo";
        "$menu" = "rofi -show drun";

        exec-once = [
          "${pkgs.eww}/bin/eww open-many bar:first bar:second --arg first:screen=1 --arg second:screen=0"

          "${pkgs.swayidle}/bin/swayidle -w timeout 300 'hyprlock --grace 5'"
        ];

        env = [ "XCURSOR_SIZE,24" "HYPRCURSOR_SIZE,24" ];

        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          active_opacity = 1.0;
          inactive_opacity = 0.99;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = true; # "yes, please :)"

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { new_status = "master"; };

        misc = {
          force_default_wallpaper = -0;
          disable_hyprland_logo = true;
        };

        # ---------------------------------------------------------
        # INPUT
        # ---------------------------------------------------------
        input = {
          kb_layout = "pl";
          follow_mouse = 1;
          sensitivity = -0.5;
          touchpad = { natural_scroll = false; };
        };

        # Per-device config
        device = {
          name = "logitech-g502-1";
          sensitivity = -0.5;
        };
      };
      # extraConfig = builtins.readFile ../../../hypr/hyprland.conf.backup;
    };
  };
}

