{ pkgs, config, ... }:

{

  services.tldr-update = {
    enable = true;
    period = "weekly";
    package = pkgs.tealdeer;
  };

  home.packages = with pkgs; [
    tealdeer
  ];
}
