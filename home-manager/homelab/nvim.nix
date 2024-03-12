{
  pkgs,
  config,
  ...
}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim

      {
        plugin = lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }

      {
        plugin = dracula-nvim;
        config = toLuaFile ./nvim/plugin/colorscheme.lua;
      }

      lspkind-nvim

      {
        plugin = gitsigns-nvim;
        config = toLuaFile ./nvim/plugin/autopairs.lua;
      }

      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets

      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/plugin/nvim-cmp.lua;
      }

      nvim-ts-autotag

      {
        plugin = nvim-autopairs;
        config = toLuaFile ./nvim/plugin/autopairs.lua;
      }

      {
        plugin = comment-nvim;
        config = toLuaFile ./nvim/plugin/comment.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
      }

      telescope-fzf-native-nvim

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]);
        config = toLuaFile ./nvim/plugin/treesitter.lua;
      }

      {
        plugin = toggleterm-nvim;
        config = toLuaFile ./nvim/plugin/toggleterm.lua;
      }

      nvim-web-devicons
      nvim-surround
      # markdown-preview-nvim
      copilot-vim
      dressing-nvim
      vim-tmux-navigator

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lspconfig.lua;
      }

      {
        plugin = null-ls-nvim;
        config = toLuaFile ./nvim/plugin/null-ls.lua;
      }

      {
        plugin = lspsaga-nvim;
        config = toLuaFile ./nvim/plugin/lspsaga.lua;
      }
    ];

    # lsp
    extraPackages = with pkgs; [
      lua-language-server
      selene
      stylua

      nodePackages.pyright
      python311Packages.flake8
      black
      isort

      nil
      deadnix
      alejandra

      # for clipboard
      xclip
      wl-clipboard
    ];

    extraLuaConfig = ''

      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/keymaps.lua}

    '';
  };
}
