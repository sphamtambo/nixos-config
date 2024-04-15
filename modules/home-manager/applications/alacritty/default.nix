{pkgs, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "Fira Code Nerd Font";
          style = "Medium";
        };
        size = 10;
      };

      # Colors (dracula theme)
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '#1d2021'
          background = "0x282a36";
          # soft contrast: background = '#32302f'
          foreground = "0xf8f8f2";
        };

        # Normal colors
        normal = {
          black = "0x000000";
          red = "0xff5555";
          green = "0x50fa7b";
          yellow = "0xf1fa8c";
          blue = "0xbd93f9";
          magenta = "0xff79c6";
          cyan = "0x8be9fd";
          white = "0xbbbbbb";
        };
        # Bright colors
        bright = {
          black = "0x555555";
          red = "0xff5555";
          green = "0x50fa7b";
          yellow = "0xf1fa8c";
          blue = "0xcaa9fa";
          magenta = "0xff79c6";
          cyan = "0x8be9fd";
          white = "0xffffff";
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
