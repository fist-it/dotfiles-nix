{ pkgs, config, ... }:

{

  home.packages = with pkgs; [
    ffmpeg
    imagemagick
    ncdu
    jq
    btop
    tmux
    playerctl
    spotify-player
    nmap
    stow
    just
    unzip
    p7zip
    cursor-cli
    caligula
    dysk
    nvtopPackages.nvidia
  ];
}
