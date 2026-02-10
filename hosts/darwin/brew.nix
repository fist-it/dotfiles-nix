{ pkgs, ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps = [
      "felixkratz/formulae"
      "neovim/neovim"
      "nikitabobko/tap"
      "opencode-ai/tap"
    ];

    # Aplikacje GUI (Casks)
    casks = [
      "spotify"
      "aerospace"
      "anki"
      "basictex"
      "firefox"
      "font-sf-pro"
      "font-sketchybar-app-font"
      "ghostty"
      "hiddenbar"
      "iina"
      "keepassxc"
      "keymapp"
      "kitty"
      "orbstack"
      "qutebrowser"
      "rar"
      "raycast"
      "signal"
      "tailscale-app"
      "vlc"
    ];

    brews = [
      "mas"
      "devcockpit"
      "docker"
      "felixkratz/formulae/sketchybar"
      "gh"
      "libheif"
      "libvterm"
      "ninja"
      "openblas"
      "pandoc"
      "pnpm"
      "spicetify-cli"
      "tailscale"
      "tree"
      "tree-sitter-cli"
      "libiconv"
    ];

    # Aplikacje z Mac App Store (wymaga bycia zalogowanym w App Store)
    # Klucz to nazwa, wartość to ID aplikacji (znajdziesz w linku w przeglądarce)
    masApps = {
      # "Xcode" = 497799835;
      # "Messenger" = 1480068668;
      "AdGuard for Safari" = 1440147259;
#      "Balatro" = 6502451661;
      "Hand Mirror" = 1502839586;
      "Lockera Widgets" = 6466819847;
      "Pages" = 409201541;
    };
  };
}
