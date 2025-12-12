{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    firefox
    keepassxc
    tor-browser
    keymapp
    pavucontrol
    spotify
    nemo
    krita
    transmission_4-gtk
    mpv
    google-chrome
    sioyek
    anki
    code-cursor
    coolercontrol.coolercontrol-gui
  ];

  programs.rofi = {
    enable = true;
    modes = [ "drun" "ssh" ];
  };

  xdg.desktopEntries = {
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
}

