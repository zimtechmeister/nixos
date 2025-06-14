{lib, ...}: {
  programs.waybar.style =
    lib.mkAfter
    /*
    css
    */
    ''
      @define-color bgDim #1b1b1b;
      @define-color bg0 #282828;
      @define-color bg1 #32302f;
      @define-color bg2 #45403d;
      @define-color bg3 #5a524c;
      @define-color grey0 #7c6f64;
      @define-color grey1 #928374;
      @define-color grey2 #a89984;
      @define-color fg0 #d4be98;
      @define-color fg1 #ddc7a1;
      @define-color red #ea6962;
      @define-color orange #e78a4e;
      @define-color yellow #d8a657;
      @define-color green #a9b665;
      @define-color aqua #89b482;
      @define-color blue #7daea3;
      @define-color purple #d3869b;
      @define-color redDim #402120;
      @define-color greenDim #34381b;
      @define-color blueDim #0e363e;
      @define-color redBg #4c3432;
      @define-color yellowBg #4f422e;
      @define-color greenBg #3b4439;
      @define-color blueBg #374141;

      * {
          /* important to reset all setings set by gtk theme */
          all: initial;
      }

      window#waybar {
          background-color: alpha(@bg0, 0.0);
          transition-property: background-color;
          transition-duration: .5s;
      }
      window#waybar label {
          font-family: Maple Mono NF;
          font-size: 16px;
          color: @fg0;
      }

      tooltip {
          background: @bg0;
          border-color: @green;
          border-width: 0px;
          border-radius: 8px;
          border-style: solid;
      }
      tooltip label {
          color: @fg0;
      }

      .module {
          padding: 0 8px;
      }

      #workspaces {
          /* border-color: @green; */
          /* border-width: 2px; */
          /* border-radius: 8px; */
          /* border-style: solid; */
      }
      #workspaces button {
          padding: 0 4px;
      }
      #workspaces button.visible label {
      }
      #workspaces button.empty label {
          color: @grey0;
      }
      #workspaces button.active label {
      }
      #workspaces button.hosting-monitor label {
          font-weight: bold;
      }
      #workspaces button:not(.visible) label {
          color: @fg0;
          font-weight: normal;
      }
      #workspaces button:hover label {
          /* box-shadow: inherit; */
          /* text-shadow: inherit; */
          color: @bg3;
      }

      #tray {
          background-color: @bg1;
      }
      #tray menu {
          background: @bg0;
          border-width: 0px;
          border-radius: 8px;
          border-style: solid;
          padding: 8px;
      }
      #tray > .passive {
      }
      #tray > .active {
      }
      #tray > .needs-attention {
      }



      #custom-separator {
          color: @green;
      }

      #backlight-slider {
      }
      #backlight-slider slider {
      }
      #backlight-slider trough {
          background-color: @bg2;
          min-height: 10px;
          min-width: 100px;
          border-radius: 2px;
      }
      #backlight-slider highlight {
          background-color: @green;
          border-radius: 2px;
      }

      #pulseaudio-slider {
      }
      #pulseaudio-slider slider {
      }
      #pulseaudio-slider trough {
          background-color: @bg2;
          min-height: 10px;
          min-width: 100px;
          border-radius: 2px;
      }
      #pulseaudio-slider highlight {
          background-color: @green;
          border-radius: 2px;
      }
    '';
}
