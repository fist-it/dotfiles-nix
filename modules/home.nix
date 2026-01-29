{ config, pkgs, lib, ... }:

{
  options.sysInfo = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "Username for the system";
    };
    homeDirectory = lib.mkOption {
      type = lib.types.str;
      description = "Home directory path";
    };
  };
  imports = [ ./dev ./applications ];

  config = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = config.sysInfo.username or "fist-it";
    home.homeDirectory = config.sysInfo.homeDirectory or "/home/fist-it";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "25.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = with pkgs;
      [ neovim pure-prompt qutebrowser fastfetch ripgrep tree-sitter ]
      ++ lib.optionals pkgs.stdenv.isLinux [ spotify nordic ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    # home.file = {
    #   # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    #   # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    #   # # symlink to the Nix store copy.
    #   # ".screenrc".source = dotfiles/screenrc;
    #
    #   "${config.xdg.configHome}" = {
    #     source = ../../.dotfiles;
    #     recursive = true;
    #   };
    # };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/fist-it/etc/profile.d/hm-session-vars.sh
    #

    gtk = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        name = "Hack Nerd Font";
        size = 11;
      };
    };

    qt = lib.mkIf pkgs.stdenv.isLinux { enable = true; };

    home.pointerCursor = lib.mkIf pkgs.stdenv.isLinux {
      gtk.enable = true;
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-hyprcursors";
      size = 28;
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      GRIM_DEFAULT_DIR = "~/Pictures/Screenshots/";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
