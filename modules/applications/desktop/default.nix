{ pkgs, config, lib, ... }: {
  imports = [ ./desktop.nix ./kitty ./hyprland ];
}
