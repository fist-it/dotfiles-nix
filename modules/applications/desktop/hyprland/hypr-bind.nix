{ lib, config, pkgs, ... }:

let cfg = config.modules.applications.desktop.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      bind = [
        # Apps
        "$optMod, T, exec, $terminal"
        "$optMod, F, exec, $browser"
        "$optMod, E, exec, $fileManager"
        "$optMod, SPACE, exec, $menu"
        "$optMod, ESCAPE, exec, $power_menu"

        # Window Management
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod CONTROL, F, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, P, pseudo" # dwindle
        "$mainMod, J, togglesplit" # dwindle

        # Focus Movement
        "$optMod, h, movefocus, l"
        "$optMod, l, movefocus, r"
        "$optMod, k, movefocus, u"
        "$optMod, j, movefocus, d"

        # Special Workspaces (Scratchpad)
        "$optMod, S, togglespecialworkspace, magic"
        "$optMod SHIFT, S, movetoworkspace, special:magic"

        # Custom Special Workspaces
        "$mainMod, T, togglespecialworkspace, term"
        "$mainMod CONTROL, T, exec, [workspace special term; float; move 15% 15%; size 70% 70%] kitty" # Note: explicitly calling kitty here

        "$mainMod, S, togglespecialworkspace, spotify"
        "$mainMod CONTROL, S, exec, [workspace special spotify; float; move 15% 15%; size 70% 70%] spotify"

        "$mainMod, B, togglespecialworkspace, btop"
        "$mainMod CONTROL, B, exec, [workspace special btop; float; move 15% 15%; size 70% 70%] kitty -e btop"

        "$mainMod SHIFT, 4, exec, grim -g \"$(slurp -w 0)\""
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" -t png - | wl-copy"

        # Scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move workspace to monitor
        "$optMod CONTROL, W, movecurrentworkspacetomonitor, +1"
      ] ++ (builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$optMod, ${ws}, workspace, ${toString (x + 1)}"
          "$optMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]) 10));

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ", XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
      ];
    };
  };
}
