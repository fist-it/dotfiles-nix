{ pkgs, config, lib, ... }:

let
  # To skraca pisanie. Odwołujemy się do opcji zdefiniowanej w default.nix
  cfg = config.modules.applications.desktop.hyprland;
in {

  config = lib.mkIf cfg.enable {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "off";
        splash = false;
        preload = [ "~/.config/wallpapers/the_narrows_from_staten_island.jpg" ];
        wallpaper = [
          "DP-2,~/.config/wallpapers/the_narrows_from_staten_island.jpg"
          "DP-3,~/.config/wallpapers/the_narrows_from_staten_island.jpg"
        ];
      };
    };
  };
}
