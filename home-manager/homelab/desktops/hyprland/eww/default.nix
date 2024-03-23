{
  programs.eww-wayland = {};

  home.file = {
    ".config/hypr/eww/config".text = builtins.readFile ./config;
    ".config/hypr/eww/start".text = builtins.readFile ./start;
    ".config/hypr/eww/eww.yuck".text = builtins.readFile ./eww.yuck;
    ".config/hypr/eww/eww.scss".text = builtins.readFile ./eww.scss;
  };
}
