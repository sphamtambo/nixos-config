{
  inputs,
  pkgs,
  ...
}:
{
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    configPackages = with pkgs; [ xdg-desktop-portal-hyprland ];
    extraPortals = [
      # pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtwayland
    qt5.qtwayland
  ];
}
