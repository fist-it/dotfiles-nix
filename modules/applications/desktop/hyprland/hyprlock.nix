{ pkgs, config, lib, ... }:

let cfg = config.modules.applications.desktop.hyprland;
in {
  config = lib.mkIf cfg.enable {

    programs.hyprlock = {
      enable = true;
      settings = {
        general = { hide_cursor = true; };

        background = [{
          monitor = "";
          path =
            "${config.home.homeDirectory}/.config/wallpapers/mountains_mono.jpg";
          blur_passes = 3;
        }];

        input-field = [{
          monitor = "";
          size = "20%, 5%";
          outline_thickness = 3;
          inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

          outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
          fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

          font_color = "rgb(143, 143, 143)";
          fade_on_empty = false;
          rounding = 15;

          font_family = "Hack Nerd Font";
          placeholder_text = "Input password...";
          fail_text = "$PAMFAIL";

          dots_spacing = 0.3;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }];

        label = [
          {
            monitor = "";
            text = "$TIME";
            font_size = 90;
            font_family = "Hack Nerd Font";
            position = "-30, 0";
            halign = "center";
            valign = "top";
          }
          {
            monitor = "";
            text = ''cmd[update:60000] date +"%A, %d %B %Y"'';
            font_size = 25;
            font_family = "Hack Nerd Font";
            position = "-30, -150";
            halign = "center";
            valign = "top";
          }
          {
            monitor = "";
            text = "$LAYOUT[en,pl]";
            font_size = 24;
            onclick = "hyprctl switchxkblayout all next";
            position = "280, -20";
            halign = "center";
            valign = "center";
          }
        ];

      };
    };
  };
}
