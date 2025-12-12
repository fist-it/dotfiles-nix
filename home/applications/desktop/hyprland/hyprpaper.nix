{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [
        "~/.config/wallpapers/the_narrows_from_staten_island.jpg"
      ];
      wallpaper = [
        "DP-2,~/.config/wallpapers/the_narrows_from_staten_island.jpg"
        "DP-3,~/.config/wallpapers/the_narrows_from_staten_island.jpg"
      ];
    };
  };
}
