{ ... }:
{
  services = {
    devmon.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
  };
  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];
}
