{pkgs, ...}: {
  programs.swaynotificationcenter = {};

  home.file = {
    ".config/hypr/swaync/config.json".text = builtins.readFile ./config.json;
    ".config/hypr/swaync/style.css".text = builtins.readFile ./style.css;
    ".config/hypr/swaync/start".text = builtins.readFile ./start;
    ".config/hypr/swaync/configSchema".text =
      builtins.readFile
      ./configSchema.json;
  };
}
