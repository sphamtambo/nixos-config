{
  lib,
  config,
  pkgs,
  ...
}: {
  hardware.opengl.enable = true;
  # hardware.opengl.driSupport = true;
  # hardware.opengl.driSupport32Bit = true;
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";
  hardware.opengl.extraPackages = with pkgs; [
  ];

  # nvidia support
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "#nvidia-x11"
  #   ];
  # hardware.nvidia.open = false;
  # hardware.nvidia.prime.offload.enable = true;
  # hardware.nvidia = {
  #   package = config.boot.kernelPackages.nvidiaPackages.latest;
  # };
  # hardware.nvidia.nvidiaSettings = true;
  # hardware.nvidia.forceFullCompositionPipeline = true;
  # hardware.nvidia.powerManagement.enable = false;
  # hardware.nvidia.powerManagement.finegrained = false;
}
