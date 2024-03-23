{
  programs.rofi-wayland = {};
  home.file = {
    ".config/hypr/rofi/rofi.rasi".text = builtins.readFile ./rofi.rasi;
    ".config/hypr/rofi/rofi_config".text = builtins.readFile ./rofi_config.rasi;
  };
}
