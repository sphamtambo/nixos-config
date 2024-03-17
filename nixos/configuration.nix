# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    # overlays = [
    #   # Add overlays your own flake exports (from overlays and pkgs dir):
    # ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = ["nix-command" " flakes"];
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  networking = {
    hostName = "homelab";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;
  };

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sdc";
    useOSProber = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      # Configure keymap in X11
      xkb.layout = "za";
      xkb.variant = "";
    };
    # Enable CUPS to print documents.
    printing = {
      enable = true;
    };
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [zsh];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.sphalo = {
    isNormalUser = true;
    description = "Sphalo";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    htop
    git
  ];

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  # fonts = {
  #   packages = with pkgs; [
  #     noto-fonts
  #     noto-fonts-cjk
  #     noto-fonts-emoji
  #     font-awesome
  #     source-han-sans
  #     source-han-sans-japanese
  #     source-han-serif-japanese
  #     (nerdfonts.override {fonts = ["Meslo"];})
  #   ];
  #   fontconfig = {
  #     enable = true;
  #     defaultFonts = {
  #       monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
  #       serif = ["Noto Serif" "Source Han Serif"];
  #       sansSerif = ["Noto Sans" "Source Han Sans"];
  #     };
  #   };
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
