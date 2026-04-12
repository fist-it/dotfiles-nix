{ lib
, pkgs
, ...
}:

{
  config = lib.mkIf pkgs.stdenv.isLinux {
    home.packages = [
      pkgs.oo7-server
      pkgs.libsecret
    ];

    systemd.user.services.oo7-daemon = {
      Unit = {
        Description = "oo7 Secret Service Provider";

        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.oo7-server}/libexec/oo7-daemon";
        Restart = "on-failure";
        Type = "dbus";
        BusName = "org.freedesktop.secrets";
      };
    };
  };
}
