{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    windsurf

    terraform
    kompose
    kubectl
    kubernetes
  ];
}
