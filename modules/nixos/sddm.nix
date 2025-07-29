{ config, pkgs, ... }:

let
  catppuccinFlavor = "macchiato";
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-${catppuccinFlavor}";
  };

  environment.systemPackages = with pkgs; [
    (pkgs.catppuccin-sddm.override {
      flavor = catppuccinFlavor;
    })
  ];
}
