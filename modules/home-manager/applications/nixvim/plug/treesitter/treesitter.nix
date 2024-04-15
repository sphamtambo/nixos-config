{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    indent = true;
    folding = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    incrementalSelection = {
      enable = true;
      keymaps = {
        initSelection = "<C-space>";
        nodeIncremental = "<C-space>";
        nodeDecremental = "<bs>";
      };
    };
  };
}
