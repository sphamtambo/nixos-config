{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-sddm-corners";
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
  ];
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
