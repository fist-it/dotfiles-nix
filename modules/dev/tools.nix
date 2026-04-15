{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    claude-code
    terraform
    kompose
    kubectl
    kubernetes
    wireshark
  ];
}
