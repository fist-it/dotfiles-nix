{ pkgs, config, lib, ... }:

let cfg = config.modules.applications.desktop.hyprland;
in {

  config = lib.mkIf cfg.enable {
    services.swww = { enable = true; };

  };
}
