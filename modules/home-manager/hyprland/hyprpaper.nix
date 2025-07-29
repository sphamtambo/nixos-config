{
  pkgs,
  ...
}:
{

  home.packages = [ pkgs.hyprpaper ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${./assets/wallpaper.jpg}
    wallpaper = ,${./assets/wallpaper.jpg}
    splash = false
  '';
}
