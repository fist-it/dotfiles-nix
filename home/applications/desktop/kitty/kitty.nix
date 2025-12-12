{ pkgs, config, ... }:

let
  # "kanagawa", "poimandres", "rose-pine"
  activeTheme = "kanagawa";
in
{
  programs.kitty = {
    enable = true;

    # Font Configuration
    font = {
      name = "Hack Nerd Font";
      size = 18;
    };

    # Main Settings (Migrated from your backup)
    settings = {
      # Cursor
      cursor_shape = "block";
      shell_integration = "no-cursor";
      cursor_trail = 1;
      cursor_trail_decay = "0.05 0.4";

      # Background
      background_opacity = "0.97";
      background_blur = 20;

      # Window Behavior (Standard defaults you might want explicitly)
      confirm_os_window_close = 0;
    };

    # Theme Loading
    # This reads the content of the file selected in 'activeTheme'
    # and appends it to your kitty.conf
    extraConfig = builtins.readFile ./themes/${activeTheme}.conf;
  };
}
