{pkgs, ...}: {
  programs.nixvim.colorschemes.onedark = {
    enable = true;
    package = pkgs.vimPlugins.onedark-nvim;
  };
}
