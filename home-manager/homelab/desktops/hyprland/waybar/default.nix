{pkgs, ...}: {
  programs.waybar = {
    enabel = true;
    packages = pkgs.waybar;
  };
  home.file = {
    ".config/hypr/waybar/config".text = builtins.readFile ./config;
    ".config/hypr/waybar/sytle.css".text = builtins.readFile ./style.css;
  };
}
