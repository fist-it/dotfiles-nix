{ pkgs, config, lib, ... }:

{

  home.packages = with pkgs; [
    ffmpeg
    imagemagick
    ncdu
    jq
    btop
    tmux
    nmap
    stow
    just
    unzip
    p7zip
    caligula
    dysk
    tealdeer
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    playerctl
    spotify-player
    cursor-cli
    nvtopPackages.nvidia
  ];
}
