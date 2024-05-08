{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.nixvimed.packages.${system}.default
  ];
}
