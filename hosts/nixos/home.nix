{username, ...}: {
  imports =
    [(import ../../modules/home-manager/applications)]
    ++ [(import ../../modules/home-manager/hyprland)];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
