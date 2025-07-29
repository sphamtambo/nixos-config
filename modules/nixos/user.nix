{
  pkgs,
  username,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "lp"
      "audio"
      "video"
      "bluetooth"
      "sddm"
      "input"
      "storage"
      "render"
      "docker"
      "scanner"
    ];
  };
}
