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
  home = {
    homeDirectory = "/home/sphalo";
    username = "sphalo";
    stateVersion = "23.11";

    packages = with pkgs; [
      vim
      neovim
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
      clang_12
      nodejs
      python3Full
      python311Packages.pip
      shutter
      zathura
      nil
	  nixpkgs-fmt
      less
      tree
    ];

  };

  programs.home-manager.enable = true;

  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
