{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 13;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
      };

      # Colors (dracula theme)
      colors = {
        primary = {
          background = "#282a36";
          foreground = "#f8f8f2";
          bright_foreground = "#ffffff";
        };

        cursor = {
          text = "#282a36";
          cursor = "#f8f8f2";
        };

        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        selection = {
          text = "CellForeground";
          background = "#44475a";
        };

        normal = {
          black = "#21222c";
          red = "#ff5555";
          green = "#50fa7b";
          yellow = "#f1fa8c";
          blue = "#bd93f9";
          magenta = "#ff79c6";
          cyan = "#8be9fd";
          white = "#f8f8f2";
        };

        bright = {
          black = "#6272a4";
          red = "#ff6e6e";
          green = "#69ff94";
          yellow = "#ffffa5";
          blue = "#d6acff";
          magenta = "#ff92df";
          cyan = "#a4ffff";
          white = "#ffffff";
        };

        search.matches = {
          foreground = "#44475a";
          background = "#50fa7b";
        };

        search.focused_match = {
          foreground = "#44475a";
          background = "#ffb86c";
        };

        footer_bar = {
          background = "#282a36";
          foreground = "#f8f8f2";
        };

        hints.start = {
          foreground = "#282a36";
          background = "#f1fa8c";
        };

        hints.end = {
          foreground = "#f1fa8c";
          background = "#282a36";
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
        TERM = "xterm-256color";
      };

      scrolling = {
        history = 100000;
      };
    };
  };
}
