{ config
, ...
}:
{
  imports = [
    ./nixPC.nix
  ];

  # TODO: encrypt secrets (for grafana) using sops

  # sops.defaultSopsFile = ../../secrets/secrets.yaml;
  # sops.defaultSopsFormat = "yaml";
  #
  # sops.secrets."grafana_secret_key" = {
  #   owner = config.systemd.services.grafana.serviceConfig.User;
  # };
}
