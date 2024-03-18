# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/default.nix
  ];

  home = {
    homeDirectory = "/home/sphalo";
    username = "sphalo";
    stateVersion = "23.11";

    packages = with pkgs; [
      ranger
      wget
      neofetch
      bat
      stow
      lsd
      eza
      ripgrep
      lazygit
      unzip
      zip
      docker
      docker-compose
      zsh-autosuggestions
      zsh-syntax-highlighting
      # gcc
      nodejs
      python313
      shutter
      zathura
      less
      tree
      htop
      # Clipboard managers
      xclip
      wl-clipboard
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "Meslo"
          "Hack"
          # "JetBrainsMono Nerd Font"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;
}
