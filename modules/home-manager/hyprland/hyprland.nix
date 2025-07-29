{
  lib,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };

    settings = {
      "$terminal" = "alacritty";
      "$mod" = "SUPER";
      monitor = [
        ",preferred,auto,1"
      ];
      xwayland = {
        force_zero_scaling = true;
      };
      general = {
        gaps_in = 45;
        gaps_out = 45;
        # gaps_in = 6;
        # gaps_out = 6;
        border_size = 2;
        layout = "dwindle";
        allow_tearing = true;
      };
      input = {
        kb_layout = "uk";
        follow_mouse = true;
        touchpad = {
          natural_scroll = true;
        };
        accel_profile = "flat";
        sensitivity = 0;
      };
      decoration = {
        rounding = 15;
        active_opacity = 0.9;
        inactive_opacity = 0.8;
        fullscreen_opacity = 0.9;

        blur = {
          enabled = true;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 14;
          passes = 4;
          brightness = 1;
          noise = 0.01;
          contrast = 1;
          popups = true;
          popups_ignorealpha = 0.6;
          ignore_opacity = false;
        };

        # drop_shadow = true;
        # shadow_ignore_window = true;
        # shadow_range = 20;
        # shadow_offset = "0 2";
        # shadow_render_power = 4;
      };

      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      cursor = {
        enable_hyprcursor = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        # no_gaps_when_only = 0;
        smart_split = false;
        smart_resizing = false;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      bind = [
        # General
        "$mod, return, exec, $terminal"
        "$mod, q, killactive"
        "$mod, c, killactive"
        "$mod SHIFT, l, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "$mod SHIFT, q, exec, ${pkgs.wlogout}/bin/wlogout &"

        # Screen focus
        "$mod, space, togglefloating"
        "$mod, u, focusurgentorlast"
        "$mod, tab, focuscurrentorlast"
        "$mod, f, fullscreen"

        # Screen resize
        "$mod CTRL, h, resizeactive, -20 0"
        "$mod CTRL, l, resizeactive, 20 0"
        "$mod CTRL, k, resizeactive, 0 -20"
        "$mod CTRL, j, resizeactive, 0 20"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move to workspaces
        "$mod SHIFT, 1, movetoworkspace,1"
        "$mod SHIFT, 2, movetoworkspace,2"
        "$mod SHIFT, 3, movetoworkspace,3"
        "$mod SHIFT, 4, movetoworkspace,4"
        "$mod SHIFT, 5, movetoworkspace,5"
        "$mod SHIFT, 6, movetoworkspace,6"
        "$mod SHIFT, 7, movetoworkspace,7"
        "$mod SHIFT, 8, movetoworkspace,8"
        "$mod SHIFT, 9, movetoworkspace,9"
        "$mod SHIFT, 0, movetoworkspace,10"

        # Navigation
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Applications
        "$mod SHIFT, b, exec, ${pkgs.firefox}/bin/firefox"
        "$mod, E ,exec,${pkgs.xfce.thunar}/bin/thunar"
        "$mod SHIFT, y, exec, $terminal --hold -e ${pkgs.yazi}/bin/yazi"
        "$mod, D, exec, pkill fuzzel || ${pkgs.fuzzel}/bin/fuzzel"
        # "$mod ALT, r, exec, pkill anyrun || ${pkgs.anyrun}/bin/anyrun"
        # "$mod, D, exec, ${pkgs.wofi}/bin/wofi --show drun --show-icons"
        "$mod ALT, n, exec, swaync-client -t -sw"

        # Screencapture
        # Area screenshot without cursor
        "$mod, Print, exec, ${pkgs.grimblast}/bin/grimblast --notify save area ~/Pictures/screenshot_$(date +'%Y-%m-%d-At-%Hh%Mm%Ss').png"
        # Fullscreen screenshot with cursor
        "$mod SHIFT, Print, exec, ${pkgs.grimblast}/bin/grimblast --notify --cursor save output ~/Pictures/screenshot_$(date +'%Y-%m-%d-At-%Hh%Mm%Ss').png"

        # screen recording
        "$mod, SHIFT, R , exec, ${pkgs.wf-recorder}/bin/wf-recorder -f ~/Videos/wf_recording_$(date +'%Y-%m-%d-At-%Hh%Mm%Ss').mkv -r 60 --codec libx264 --bframes 3 -x yuv444p -p crf=16 -p preset=veryslow -p tune=zerolatency"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      env = [
        "NIXOS_OZONE_WL,1"
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        # gtk theme
        "XCURSOR_SIZE,24"
        "GTK_THEME,Catppuccin-Mocha-Compact-Lavender-Dark"
        "XCURSOR_THEME,Bibata-Modern-Ice"
      ];

      exec-once = [
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg,pkcs11)"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "hash dbus-update-activation-environment 2>/dev/null"
        "export SSH_AUTH_SOCK"
        "${pkgs.plasma5Packages.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
        "${pkgs.waybar}/bin/waybar"
      ];
    };
  };
}
