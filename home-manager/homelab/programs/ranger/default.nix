{
  config,
  pkgs,
  ...
}: {
  programs.ranger = {
    enable = true;
  };

  home.file = {
    ".config/ranger/rc.conf".text = builtins.readFile ./rc.conf;
    ".config/ranger/rifle.conf".text = builtins.readFile ./rifle.conf;
    ".config/ranger/commands.py".text = builtins.readFile ./commands.py;
  };
}
