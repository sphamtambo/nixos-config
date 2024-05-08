{
  config,
  pkgs,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      font-awesome_4
      font-awesome_5
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      twemoji-color-font
      terminus_font
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Inconsolata"
          "Hack"
          "Meslo"
          "DroidSansMono"
          "FiraCode"
          "JetBrainsMono"
        ];
      })
    ];
    fontconfig = {
      hinting.autohint = true;
      antialias = true;
      allowBitmaps = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        monospace = ["Source Code Pro"];
        sansSerif = ["Roboto"];
        serif = ["Source Serif Pro"];
      };
    };
  };
}
