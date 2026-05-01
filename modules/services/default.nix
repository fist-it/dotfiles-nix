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
  };

  imports = [
    ./direnv
    ./grafana
  ];
}
