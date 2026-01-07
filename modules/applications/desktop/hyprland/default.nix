{ lib, ... }: {
  # imports = [ ./hyprland.nix ./hyprbind.nix ];
  imports = [
    ./hyprland.nix
    ./hypr-bind.nix
    ./hypr-rules.nix
    ./swayosd.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  options.modules.applications.desktop.hyprland = {
    enable = lib.mkEnableOption "Hyprland Configuration";
  };
}
