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
      noto-fonts-cjk-sans
      noto-fonts-emoji
      twemoji-color-font
      terminus_font
      nerd-font-patcher
      nerd-fonts.inconsolata
      nerd-fonts.hack
      # nerd-fonts.Meslo
      # nerd-fonts.DroidSansMono
      # nerd-fonts.JetBrainsMono
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
