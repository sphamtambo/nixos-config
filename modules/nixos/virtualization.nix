{
  config,
  pkgs,
  username,
  ...
}: {
  # CHANGE: intel_iommu enables iommu for intel CPUs with VT-d
  # use amd_iommu if you have an AMD CPU with AMD-Vi
  boot.kernelParams = ["intel_iommu=on" "i915.enable_gvt=1" "kvm.ignore_msrs=1"];

  # These modules are required for PCI passthrough, and must come before early modesetting stuff
  boot.kernelModules = ["vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd"];

  # CHANGE: Don't forget to put your own PCI IDs here
  boot.extraModprobeConfig = "options vfio-pci ids=10de:1292";

  # Add user to libvirtd group
  users.users.${username}.extraGroups = ["libvirtd"];

  programs.dconf.enable = true;

  programs.virt-manager.enable = true;

  services.spice-vdagentd.enable = true;

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    pciutils
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];
  # virtualisation = {
  #   libvirtd = {
  #     enable = true;
  #     qemu = {
  #       swtpm.enable = true;
  #       ovmf.enable = true;
  #       runAsRoot = false;
  #       verbatimConfig = ''
  #         nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
  #       '';
  #     };
  #     onShutdown = "shutdown";
  #     onBoot = "ignore";
  #     spiceUSBRedirection.enable = true;
  #   };
  # };

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
    spiceUSBRedirection.enable = true;
  };
}
