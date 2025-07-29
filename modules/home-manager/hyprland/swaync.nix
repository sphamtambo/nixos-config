{
  lib,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.libnotify ];
  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 6;
      control-center-marging-bottom = 6;
      control-center-margin-left = 6;
      control-center-margin-right = 6;
      notification-icon-size = 64;
      notification-body-image-height = 128;
      notification-body-image-width = 200;
      notification-2fa-action = true;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 400;
      control-center-height = 500;
      notification-window-width = 350;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "menubar#desktop"
        "volume"
        "backlight#mobile"
        "battery"
        "network"
        "mpris"
        "dnd"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Control Center";
          clear-all-buttons = true;
          botton-text = " Clear Everything ";
        };
        "menubar#desktop" = {
          "menu#screenshot" = {
            label = "󰄀 ";
            position = "left";
            actions = [
              {
                label = "  Full Screen";
                action = "${pkgs.grim}/bin/grim | wl-copy";
              }
              {
                label = "  Area";
                action = "${pkgs.grim}/bin/grim -g \"$(slurp)\" - | ${pkgs.swappy}/bin/swappy -f -";
              }
            ];
          };
          "menu#record" = {
            label = " ";
            position = "left";
            actions = [
              {
                label = "  Record Full Screen";
                command = "${pkgs.wf-recorder}/bin/wf-recorder -f ~/recording.mp4";
              }
              {
                label = "󰩭 Record Area";
                command = "${pkgs.wf-recorder}/bin/wf-recorder -g \"$(slurp)\" -f ~/recording.mp4";
              }
              {
                label = "󰵸 Record GIF";
                command = "${pkgs.wf-recorder}/bin/wf-recorder -g \"$(slurp)\" -f ~/recording.gif";
              }
              {
                label = " stop Recording";
                command = "pkill wf-recorder";
              }
            ];
          };
          "menu#power-buttons" = {
            label = " ";
            position = "left";
            actions = [
              {
                label = " Lock Session";
                command = "${pkgs.hyprlock}/bin/hyprlock";
              }
              {
                label = "  Reboot";
                command = "systemctl reboot";
              }
              {
                label = "  Shutdown";
                command = "systemctl poweroff";
              }
            ];
          };
        };
        "backlight#mobile" = {
          label = " ";
          device = "panel";
        };
        volume = {
          label = "  ";
          expand-button-label = "";
          colapse-button-label = "";
          show-per-app = true;
          show-per-app-label = false;
        };
        dnd = {
          text = " Silence";
        };
        mpris = {
          image-size = 85;
          image-radius = 5;
        };
      };
    };
  };
}
