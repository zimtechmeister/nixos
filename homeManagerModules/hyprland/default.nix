{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  monitorLayouts = {
    PC = [
      "desc:Microstep Optix MAG24C 0000000000001, preferred, 0x0, 1"
      "desc:Dell Inc. DELL U2412M 0FFXD33I1C7L, preferred, 1920x0, 1"
      ", preferred, auto, 1, mirror, eDP-"
    ];
    t480 = [
      "eDP-1, preferred, 0x0, 1"
      "desc:Microstep Optix MAG24C 0000000000001, preferred, 1920x0, 1"
      "desc:Dell Inc. DELL U2412M 0FFXD33I1C7L, preferred, 3840x0, 1"
      ", preferred, auto, 1, mirror, eDP-"
    ];
  };
  monitorLayout = builtins.getAttr (config.hyprland.monitorLayout) monitorLayouts;
in {
  imports = [
    ./keybinds.nix
    # ./plugins/hyprscrolling.nix
  ];
  options.hyprland = {
    enable = lib.mkEnableOption "enables hyprland";
    monitorLayout = lib.mkOption {
      # NOTE: this default might cause problems and its not the only
      # occurrence of such a problem (maybe keep null the default and only if
      # its set to something else this has effect)
      default = null;
      description = ''
        hyprland monitor layout
      '';
    };
  };
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager = {
      hyprland = {
        # NOTE: do i even need to enable specify the package if i already did in mypackages.nix
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
        # TODO: dont know how to do the first line in settings
        extraConfig = ''
          $LAPTOP_KB_ENABLED = true
          device {
            name = at-translated-set-2-keyboard
            enabled = $LAPTOP_KB_ENABLED
            kb_options = caps:swapescape
          }
        '';
        settings = {
          monitor = monitorLayout;
          exec-once = [
            "wl-paste --watch cliphist store"
            "systemctl --user start hyprpolkitagent"
            "waybar"
            "swaync"
          ];
          input = {
            kb_layout = "eu, de, us";
            accel_profile = "flat";
          };
          gestures = {
            workspace_swipe = true;
            workspace_swipe_invert = false;
            workspace_swipe_use_r = true;
          };
          general = {
            border_size = 2;
            gaps_in = 4;
            gaps_out = 8;
            # NOTE: style
            "col.inactive_border" = "rgb(1d2021)";
            "col.active_border" = "rgb(d4be98)";
            #col.active_border = rgb(ea6962) rgb(e78a4e) rgb(d8a657) rgb(a9b665) rgb(89b482) rgb(7daea3) rgb(d3869b) 0deg

            layout = "dwindle";
            resize_on_border = true;
            snap = {
              enabled = true;
            };
          };
          decoration = {
            rounding = 4;
            blur = {
              enabled = true;
              size = 4;
              passes = 4;
              ignore_opacity = true;
            };
            shadow = {
              range = 4;
              render_power = 1;
              # NOTE: style
              color = "rgb(282828)";
              # color_inactive = "rgb(d3869b)"; # if not set, will fall back to color
            };
          };
          animations = {
            enabled = false;
          };
          dwindle = {
            force_split = 2;
            preserve_split = true;
          };
          misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
            # NOTE: font
            font_family = config.systemFont;
            mouse_move_enables_dpms = false;
            key_press_enables_dpms = true;
            new_window_takes_over_fullscreen = true;
          };
          windowrulev2 = [
            "suppressevent maximize, class:.*"
            "float, title:Picture-in-Picture"
          ];
          workspace = "special:scratchpad, gapsout:64, gapsin:32";
        };
      };
    };
  };
}
