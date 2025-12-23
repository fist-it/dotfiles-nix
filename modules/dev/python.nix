{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    uv
    stdenv.cc.cc.lib
  ];

}
