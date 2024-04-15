{
  programs.nixvim.plugins = {
    lualine = {
      enable = true;
      iconsEnabled = true;
      globalstatus = true;
      extensions = ["neo-tree" "nvim-dap-ui" "toggleterm" "quickfix" "fzf"];
      disabledFiletypes = {
        statusline = ["dashboard" "alpha"];
      };
      theme = "auto";
      sectionSeparators.left = "";
      sectionSeparators.right = "";
      componentSeparators.left = "";
      componentSeparators.right = "";
      sections.lualine_c = ["filename"];
      sections.lualine_x = ["location"];
      tabline = {};
      winbar = {};
      inactiveWinbar = {};
      refresh = {
        statusline = 1000;
        tabline = 1000;
        winbar = 1000;
      };
    };
  };
}
