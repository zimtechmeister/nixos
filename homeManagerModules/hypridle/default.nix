{
  lib,
  config,
  ...
}: {
  options.hypridle.enable = lib.mkEnableOption "enables hypridle";
  config = lib.mkIf config.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
        };

        listener = [
          {
            timeout = 600; # 10min.
            on-timeout = "brightnessctl -s set 10%"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
            on-resume = "brightnessctl -r"; # monitor backlight restore.
          }
          {
            timeout = 720; # 12min
            on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
            on-resume = "birghtnessctl -r"; # monitor backlight restore.
          }
          {
            timeout = 750; # 12.5min
            on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
            on-resume = "birghtnessctl -r"; # monitor backlight restore.
          }
          {
            timeout = 900; # 15min
            on-timeout = "systemctl suspend"; # suspend pc
            on-resume = "brightnessctl -r"; # monitor backlight restore.
          }
        ];
      };
    };
  };
}
