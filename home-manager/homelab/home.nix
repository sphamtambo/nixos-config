# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: 

{

imports = [
./nvim.nix
];


  home = {
    homeDirectory = "/home/sphalo";
    username = "sphalo";
    stateVersion = "23.11";

    packages = with pkgs; [
      zsh
      ranger
      wget
      neofetch
      git
      alacritty
      bat
      stow
      lsd
      eza
      fzf
      ripgrep
      lazygit
      tmux
      unzip
      zip
      docker
      docker-compose
      spaceship-prompt
      zsh-autosuggestions
      zsh-syntax-highlighting
      z-lua
      gcc
      # clang_12
      nodejs
      python3Full
      shutter
      zathura
      nil
	  nixpkgs-fmt
      less
      tree
	  htop
    ];

  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
}
