{ pkgs, config, lib, ...}:
{
  options.modules.applications.desktop.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Hyprland specific desktop applications configuration.";
    };
  }; 

  imports = [ ./desktop.nix ./kitty ];
}
