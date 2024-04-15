{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ## Utils
    gamemode
    gamescope
    winetricks
    # inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    wine-wayland

    ## Cli games
    _2048-in-terminal
    vitetris
    nethack

    ## Celeste
    # celeste-classic
    # celeste-classic-pm

    ## Doom
    # gzdoom
    # crispy-doom

    ## Emulation
    # cemu
    # dolphin-emu
  ];
}
