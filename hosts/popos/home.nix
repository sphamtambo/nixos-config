{username, ...}: {
  imports = [(import ../../modules/home-manager/applications)];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    # Session PATH additions
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/bin"
      "/usr/lib/llvm-16/bin" # Clang 16
      "/usr/local/mysql/bin" # MySQL
      "/snap/bin" # Snap packages (MySQL Workbench)
      "$HOME/.local/UCSF-Chimera64-1.17.3/bin" # Chimera
      "$HOME/sofwares/BIOVIA2020/DiscoveryStudio2020/bin" # Discovery Studio
      "$HOME/opt/sirius/sirius/bin" # Sirius
    ];
    sessionVariables = {
      # Discovery Studio library path
      LD_LIBRARY_PATH = "$HOME/sofwares/BIOVIA2020/LicensePack/linux/lib:$LD_LIBRARY_PATH";

      # Mamba/Conda setup
      MAMBA_EXE = "/home/sphalo/miniforge3/bin/mamba";
      MAMBA_ROOT_PREFIX = "/home/sphalo/miniforge3";
    };
    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
