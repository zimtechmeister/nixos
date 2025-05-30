{
  lib,
  config,
  ...
}: {
  options.hyprlock.enable = lib.mkEnableOption "enables hyprlock";
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          ignore_empty_input = true;
        };

        background = {
          monitor = "";
          path = "~/.config/wallpaper/forest-fog-grey.jpg";
          blur_passes = 0;
        };

        input-field = {
          monitor = "";
          size = "200, 40";
          outline_thickness = 0;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.4; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgb(8ccf7e)";
          inner_color = "rgba(1d202180)";
          font_color = "rgb(d4be98)";
          fade_on_empty = false;
          check_color = "rgb(1d2021)";
          fail_color = "rgb(ea6962)";
          fail_text = "<i><span foreground='##1d2021'>Fail $ATTEMPTS</span></i>";
          fail_transition = 0;
          placeholder_text = "<i><span foreground='##d4be98'>Hi, $USER</span></i>";
          hide_input = false;
          rounding = -1;
          position = "0, 0";
          halign = "center";
          valign = "center";
        };

        shape = {
          monitor = "";
          size = "400, 400";
          color = "rgba(1d202180)";
          rounding = 8;
          border_size = 0;
          rotate = 0;
          xray = false; # if true, make a "hole" in the background (rectangle of specified size, no rotation)

          position = "0, 130";
          halign = "center";
          valign = "center";
        };

        # TIME HOUR
        label = [
          {
            monitor = "";
            text = "cmd[update:1000] echo -e $(date '+%H')";
            color = "rgb(d4be98)";
            font_size = 80;
            font_family = "${config.systemFont} Bold";
            halign = "center";
            valign = "center";
            position = "0, 235";
          }

          # TIME MINUTE
          {
            monitor = "";
            text = "cmd[update:1000] echo -e $(date '+%M')";
            color = "rgb(d4be98)";
            font_size = 80;
            font_family = "${config.systemFont} Bold";
            halign = "center";
            valign = "center";
            position = "0, 135";
          }

          # DATE
          {
            monitor = "";
            text = "cmd[update:1000] echo -e $(date '+%a %d-%m')";
            color = "rgb(d4be98)";
            font_size = 20;
            font_family = "${config.systemFont} Bold";
            halign = "center";
            valign = "center";
            position = "0, 50";
          }
        ];
      };
    };
  };
}
