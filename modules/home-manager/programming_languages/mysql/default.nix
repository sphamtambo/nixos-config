{
  config,
  lib,
  pkgs,
  ...
}: {
  services.mysql = {
    enable = true;
    package = pkgs.mysql;
    # initialRootPassword = "";
    # Optionally configure additional settings here
  };
}
