{pkgs, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      shell = "zsh";
      live_config_reload = true;
      font = {
        size = 10;
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMono NF";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono NF";
          style = "Bold Italic";
        };
        bold = {
          family = "JetBrainsMono NF";
          style = "Bold";
        };
      };

      # Colors (dracula theme)
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '#1d2021'
          # background = "0x282a36";
          # # soft contrast: background = '#32302f'
          # foreground = "0xf8f8f2";

          background = "#282a36";
          foreground = "#f8f8f2";
          bright_foreground = "#ffffff";
        };

        cursor = {
          text = "#282a36";
          cursor = "#f8f8f2";
        };

        vim_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        selections = {
          text = "CellForeground";
          background = "#44475a";
        };

        # Normal colors
        normal = {
          # black = "0x000000";
          # red = "0xff5555";
          # green = "0x50fa7b";
          # yellow = "0xf1fa8c";
          # blue = "0xbd93f9";
          # magenta = "0xff79c6";
          # cyan = "0x8be9fd";
          # white = "0xbbbbbb";

          black = "#21222c";
          red = "#ff5555";
          green = "#50fa7b";
          yellow = "#f1fa8c";
          blue = "#bd93f9";
          magenta = "#ff79c6";
          cyan = "#8be9fd";
          white = "#f8f8f2";
        };
        # Bright colors
        bright = {
          # black = "0x555555";
          # red = "0xff5555";
          # green = "0x50fa7b";
          # yellow = "0xf1fa8c";
          # blue = "0xcaa9fa";
          # magenta = "0xff79c6";
          # cyan = "0x8be9fd";
          # white = "0xffffff";
          black = "#6272a4";
          red = "#ff6e6e";
          green = "#69ff94";
          yellow = "#ffffa5";
          blue = "#d6acff";
          magenta = "#ff92df";
          cyan = "#a4ffff";
          white = "#ffffff";
        };
      };

      window = {
        opacity = 1; # Set window opacity to 1
        padding = {
          x = 5;
          y = 5;
        };
      };

      env = {
        # Better color support in some apps
        TERM = "xterm-256color";
      };

      scrolling = {
        history = 100000;
      };
    };
  };
}
