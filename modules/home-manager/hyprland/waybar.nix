{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = [
      {
        layer = "top";
        position = "top";

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "custom/notifications"
          "cpu"
          "memory"
          "network"
          "backlight"
          # "pulseaudio"
          "battery"
          "tray"
          "custom/lock"
          "custom/power"
        ];

        pulseaudio = {
          format = "{volume}% ";
          format-muted = " muted";
          scroll-step = 5;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.pamixer}/bin/pamixer -t";
        };

        cpu = {
          format = "  {usage}%";
          tooltip = true;
          interval = 2;
        };
        memory = {
          format = "󰍛  {}%";
          tooltip = true;
          interval = 3;
          on-click = "${pkgs.kitty}/bin/kitty --hold htop"; # or use $terminal if defined
        };

        network = {
          format-wifi = "{icon}  ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰈀 ";
          format-linked = "{ifname} (No IP) 󰌘 ";
          format-disc = "Disconnected 󰟦 ";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor"; # launch GUI network tool
        };
        "custom/launcher" = {
          format = " ";
          tooltip = false;
          on-click = "${pkgs.fuzzel}/bin/fuzzel --show drun";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = false;
          all-outputs = true;
          format-icons = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "0" = [ ];
          };
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        clock = {
          timezone = "Africa/Johannesburg";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "  {:%d/%m/%Y}";
          format = "  {:%H:%M}";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱟢 {capacity}%";
          format-alt = "{icon} {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "custom/notifications" = {
          tooltip = false;
          format = "{icon} Notifications";
          format-icons = {
            notification = "󱥁 <span foreground='red'><sup></sup></span>";
            none = "󰍥 ";
            dnd-notification = "󱙍 <span foreground='red'><sup></sup></span>";
            dnd-none = "󱙎 ";
            inhibited-notification = "󱥁 <span foreground='red'><sup></sup></span>";
            inhibited-none = "󰍥 ";
            dnd-inhibited-notification = "󱙍 <span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "󱙎 ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "custom/lock" = {
          tooltip = false;
          on-click = "${pkgs.hyprlock}/bin/hyprlock";
          format = " ";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "${pkgs.wlogout}/bin/wlogout &";
          format = " ";
        };
      }
    ];

    style = ''
      * {
        font-family: 'JetBrainsMono Nerd Font', 'Font Awesome 6 Free';
        font-size: 18px;
        min-height: 0;
      }

      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }

      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
      }

      #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: @peach;
      }

      #workspaces button:hover {
        color: @peach;
      }

      #custom-launcher,
      #custom-music,
      #tray,
      #backlight,
      #network,
      #clock,
      #battery,
      #custom-lock,
      #custom-notifications,
      #cpu,
      #memory,
      #pulseaudio,
      #custom-power {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
        border-radius: 1rem;
      }
      #pulseaudio {
      background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
        border-radius: 1rem;
      }
      #memory {
      background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
        border-radius: 1rem;
      }
      #cpu {
        color: @mauve;
        margin-left: 5px;
      }
      #pulseaudio {
        color: @yellow;
        margin-left: 5px;
      }
      #memory {
        color: @yellow;
        margin-left: 5px;
      }
      #custom-launcher {
        margin-left: 1rem;
        color: @mauve;
      }
      #clock {
        color: @blue;
        margin-right: 1rem;
      }

      #battery {
        color: @green;
        margin-left: 5px;
      }

      #battery.warning:not(.charging) {
        color: @red;
      }

      #backlight {
        color: @yellow;
        margin-left: 5px;
      }

      #network {
      background-color: @surface0;
      color: @sky;
      margin-left: 5px;
      padding: 0.5rem 1rem;
      border-radius: 1rem;
      }

      #custom-notifications {
        color: @peach;
        margin-right: 1rem;
      }

      #custom-lock {
        color: @lavender;
        margin-left: 5px;
      }

      #custom-power {
        color: @red;
        margin-left: 1rem;
        margin-right: 1rem;
      }

      #tray {
        margin-right: 1rem;
      }

      @define-color rosewater #f4dbd6;
      @define-color flamingo #f0c6c6;
      @define-color pink #f5bde6;
      @define-color mauve #c6a0f6;
      @define-color red #ed8796;
      @define-color maroon #ee99a0;
      @define-color peach #f5a97f;
      @define-color yellow #eed49f;
      @define-color green #a6da95;
      @define-color teal #8bd5ca;
      @define-color sky #91d7e3;
      @define-color sapphire #7dc4e4;
      @define-color blue #8aadf4;
      @define-color lavender #b7bdf8;
      @define-color text #cad3f5;
      @define-color subtext1 #b8c0e0;
      @define-color subtext0 #a5adcb;
      @define-color overlay2 #939ab7;
      @define-color overlay1 #8087a2;
      @define-color overlay0 #6e738d;
      @define-color surface2 #5b6078;
      @define-color surface1 #494d64;
      @define-color surface0 #363a4f;
      @define-color base #24273a;
      @define-color mantle #1e2030;
      @define-color crust #181926;
    '';
  };
}
