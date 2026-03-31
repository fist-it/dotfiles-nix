{ pkgs
, lib
, config
, ...
}:

let
  cfg = config.modules.services.direnv;
in
{
  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
