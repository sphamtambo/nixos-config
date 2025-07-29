{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "1";
      window_padding_width = 10;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      active_tab_foreground = "#282a36";
      active_tab_background = "#bd93f9";
      inactive_tab_foreground = "#f8f8f2";
      inactive_tab_background = "#44475a";

      scrollback_pager = "less --chop-long-lines --raw-control-chars +INPUT_LINE_NUMBER";
    };

    keybindings = {
      ## Tabs
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };

    extraConfig = ''

      font_family      JetBrainsMono NF Regular
      bold_font        JetBrainsMono NF Bold
      italic_font      JetBrainsMono NF Italic
      bold_italic_font JetBrainsMono NF Bold Italic
      font_size        18

      map ctrl+shift+space kitten hints --type=linenum


      # Dracula Theme
      foreground            #f8f8f2
      background            #282a36
      selection_foreground  #ffffff
      selection_background  #44475a

      # Cursor colors
      cursor                #f8f8f2
      cursor_text_color     #282a36

      # URL underline color when hovering with mouse
      url_color             #8be9fd

      # Kitty window border colors
      active_border_color   #bd93f9
      inactive_border_color #44475a
      bell_border_color     #ff5555

      # Tab bar colors
      tab_bar_background    #282a36

      # Colors for marks (marked text in the terminal)
      mark1_foreground #282a36
      mark1_background #ff5555
      mark2_foreground #282a36
      mark2_background #50fa7b
      mark3_foreground #282a36
      mark3_background #f1fa8c

      # The 16 terminal colors

      # black
      color0 #21222c
      color8 #6272a4

      # red
      color1 #ff5555
      color9 #ff6e6e

      # green
      color2  #50fa7b
      color10 #69ff94

      # yellow
      color3  #f1fa8c
      color11 #ffffa5

      # blue
      color4  #bd93f9
      color12 #d6acff

      # magenta
      color5  #ff79c6
      color13 #ff92df

      # cyan
      color6  #8be9fd
      color14 #a4ffff

      # white
      color7  #f8f8f2
      color15 #ffffff
    '';
  };
}
