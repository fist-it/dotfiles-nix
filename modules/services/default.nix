{ lib
, ...
}:

{
  options.modules.services = {
    grafana = {
      enable = lib.mkEnableOption "Grafana Service";
    };
    direnv = {
      enable = lib.mkEnableOption "DirEnv Service";
    };
    oo7 = {
      enable = lib.mkEnableOption "oo7 Keyring Service";
    };
  };

  imports = [
    ./direnv
    ./grafana
    ./oo7
  ];
}
