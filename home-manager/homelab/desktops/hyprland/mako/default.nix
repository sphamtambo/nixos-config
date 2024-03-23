{
  programs.mako = {};

  home.file = {
    ".config/hypr/mako/config".text = builtins.readFile ./config;
    ".config/hypr/mako/start".text = builtins.readFile ./start;
  };
}
