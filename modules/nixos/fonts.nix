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
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font"];
      };
    };
  };
}
