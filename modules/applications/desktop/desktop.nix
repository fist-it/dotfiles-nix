{ pkgs, config, lib, ... }:

let
  cfg = config.modules.applications.desktop;
in
{
  options.modules.applications.desktop = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable desktop applications module.";
    };
    xdg-entries = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable custom xdg-desktop applications creation.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      firefox
      keepassxc
      sioyek
      anki
    ] ++ lib.optionals pkgs.stdenv.isLinux [
      spotify
      tor-browser
      pavucontrol
      nemo
      krita
      transmission_4-gtk
      mpv
      google-chrome
      code-cursor
      coolercontrol.coolercontrol-gui
      keymapp
      slurp
      grim
    ];

    programs.rofi = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      modes = [ "drun" "ssh" ];
    };

    xdg.desktopEntries = lib.mkIf cfg.xdg-entries {
      Balatro = {
        name = "Balatro";
        exec = "/home/fist-it/.local/Balatro.v1.0.1N/run.sh";
        terminal = false;
      };

      Firefox_private = {
        name = "Firefox Private";
        exec = "firefox --private-window %U";
        terminal = false;
        categories = [ "Network" "WebBrowser" ];
        genericName = "Incognito Web Browser";
      };
    };

    programs.discord = { enable = true; };
  };
}

