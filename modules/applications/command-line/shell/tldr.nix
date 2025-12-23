{ pkgs, config, lib, ... }:

{
  config = lib.mkIf pkgs.stdenv.isLinux {
    services.tldr-update = {
      enable = true;
      period = "weekly";
      package = pkgs.tealdeer;
    };
  };

}
