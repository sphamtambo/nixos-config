{pkgs, ...}: {
  home.packages = with pkgs; [
    libnotify
    mate.mate-notification-daemon
    networkmanager
    network-manager-applet
    bluez
    bluez-utils
    blueman
    papirus-icon-theme
    lxde.lxsession
    brightnessctl
    light
    yad
    sox
    cinnamon.mint-themes
    xdg-desktop-portal-hyprland
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    packages = pkgs.hyprland;
    xwayland.enable = true;
  };
  home.file = {
    ".config/hypr/hyprland/hyprland.conf".text = builtins.readFile ./hyprland.conf;
  };
}
