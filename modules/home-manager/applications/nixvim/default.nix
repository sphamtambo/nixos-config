{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.nixvim.packages.${system}.default
  ];

  # nixpkgs.overlays = [(import ../../../../overlays/default.nix)];
}
