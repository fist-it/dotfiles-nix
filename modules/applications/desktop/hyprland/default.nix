{
  # imports = [ ./hyprland.nix ./hyprbind.nix ];
  imports = [
    ./hyprland.nix
    ./hypr-bind.nix
    ./hypr-rules.nix
    ./swayosd.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];
}
