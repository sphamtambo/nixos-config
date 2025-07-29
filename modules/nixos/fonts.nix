{
  config,
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # Core fonts
      fira-code
      fira-code-symbols

      # Noto fonts (Google's comprehensive font family)
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      # Web-safe fonts
      liberation_ttf # Contains Arial, Times New Roman, Courier New alternatives
      dejavu_fonts # Good fallback fonts

      # Icon fonts
      font-awesome
      font-awesome_4
      font-awesome_5

      # Emoji
      twemoji-color-font

      # Terminal fonts
      terminus_font

      # Nerd fonts
      nerd-font-patcher
      nerd-fonts.inconsolata
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
    ];

    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "slight"; # Better for web rendering
      };
      antialias = true;
      subpixel = {
        rgba = "rgb"; # Better for LCD screens
        lcdfilter = "default";
      };
      allowBitmaps = true;
      useEmbeddedBitmaps = true;

      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font"
          "Fira Code"
          "DejaVu Sans Mono"
          "Liberation Mono"
          "monospace"
        ];
        sansSerif = [
          "Noto Sans"
          "DejaVu Sans"
          "Liberation Sans"
          "Arial"
          "sans-serif"
        ];
        serif = [
          "Noto Serif"
          "DejaVu Serif"
          "Liberation Serif"
          "Times New Roman"
          "serif"
        ];
      };
    };
  };
}
