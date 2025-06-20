{...}: {
  imports =
    [(import ./bootloader.nix)]
    ++ [(import ./hardware.nix)]
    ++ [(import ./sddm.nix)]
    ++ [(import ./network.nix)]
    ++ [(import ./pipewire.nix)]
    ++ [(import ./programs.nix)]
    ++ [(import ./security.nix)]
    ++ [(import ./services.nix)]
    ++ [(import ./system.nix)]
    ++ [(import ./user.nix)]
    ++ [(import ./wayland.nix)]
    ++ [(import ./fonts.nix)]
    ++ [(import ./ssh.nix)]
    ++ [(import ./cloudflare-warp.nix)]
    ++ [(import ./bluetooth.nix)]
    ++ [(import ./virtualization.nix)]
    # ++ [(import ./flatpak.nix)]
    # ++ [(import ./../home-manager/programming_languages/mysql)]
    ++ [(import ../../hosts/nixos/hardware-configuration.nix)];
  # ++ [ (import ./steam.nix) ]
}
