{ pkgs, config, lib, ... }:

let
  # To skraca pisanie. Odwołujemy się do opcji zdefiniowanej w default.nix
  cfg = config.modules.applications.desktop.hyprland;
  wallpaper_path1 = "~/.config/wallpapers/the_narrows_from_staten_island.jpg";
  wallpaper_path2 = wallpaper_path1;
in {

  config = lib.mkIf cfg.enable {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "off";
        splash = false;
        wallpaper = [
          {
            monitor = "DP-2";
            path = wallpaper_path1;
          }
          {
            monitor = "DP-3";
            path = wallpaper_path2;
          }
        ];
      };
    };
  };
}
