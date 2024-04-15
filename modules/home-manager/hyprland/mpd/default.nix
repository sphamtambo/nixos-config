{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  services.mpd.enable = true;

  services.mpd = {
    # user = "mpd";

    musicDirectory = "~/Music/";
    #
    # pulseaudioSupport = true;

    # http_streaming = true;
  };

  # users.extraUsers.${username} = {
  #   isNormalUser = true;
  #   home = "/home/${username}";
  #   extraGroups = ["audio"]; # Add the user to the audio group to access audio devices
  # };
}
