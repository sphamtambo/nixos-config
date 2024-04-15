{pkgs, ...}: {
  programs = {
    nixvim.extraPackages = with pkgs; [
      nodePackages.prettier
      prettierd
      alejandra
      black
      isort
      cmake-format
      stylua
    ];

    nixvim.plugins.conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;
      formattersByFt = {
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        javascript = [["prettierd" "prettier"]];
        javascriptreact = [["prettierd" "prettier"]];
        typescript = [["prettierd" "prettier"]];
        python = [["isort" "black"]];
        cpp = ["clang-formant"];
        cmake = ["cmake_format"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = [["prettierd" "prettier"]];
        yaml = [["prettierd" "prettier"]];
        json = [["prettierd" "prettier"]];
      };
    };
  };
}
