{ pkgs, ... }:

{
  services.swayosd.enable = true;

  wayland.windowManager.hyprland.settings = {
    bindl = [
      # Audio
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume 5"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume -5"

      # Brightness
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"

      # Capslock
      ", --release Caps_Lock, exec, swayosd-client --caps-lock"
    ];
  };
}
