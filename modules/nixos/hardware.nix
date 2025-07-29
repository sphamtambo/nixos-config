{
  lib,
  config,
  pkgs,
  ...
}:
{

  # Enable graphical environment
  services.xserver.enable = true;
  hardware.opengl.enable = true; # Enable OpenGL acceleration
  hardware.opengl.driSupport32Bit = true;

  hardware.graphics.enable = true;
  hardware.enableRedistributableFirmware = true;

  # Changed to powersave for better battery life on laptop
  powerManagement.cpuFreqGovernor = "powersave"; # or "ondemand"
  powerManagement.enable = true;

  # Nvidia support
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  hardware.nvidia = {
    open = false;

    # Prime configuration with your specific Bus IDs
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # Provides nvidia-offload command
      };
      # Your specific Bus IDs from lspci output
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    # Use stable for older GPUs like GT 740M
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidiaSettings = true;

    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # Enable modesetting for better compatibility
    modesetting.enable = true;
  };

  # Optional: Additional power management for laptops
  services.power-profiles-daemon.enable = true;

  # Kernel modules for Intel graphics
  boot.kernelModules = [ "i915" ];
}
