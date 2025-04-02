{config, ...}: {
  services.flatpak.enable = true;
  environment.variables = {
    QT_QPA_PLATFORM = "xcb";
    # XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:${config.environment.variables.XDG_DATA_DIRS or ""}";
  };
}
