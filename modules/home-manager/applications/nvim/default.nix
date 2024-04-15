{pkgs, ...}: {
  programs.neovim = let
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = oil-nvim;
      }

      {
        plugin = plenary-nvim;
      }

      {
        plugin = lualine-nvim;
        config = toLuaFile ./plugin/lualine.lua;
      }

      {
        plugin = dracula-nvim;
        config = toLuaFile ./plugin/colorscheme.lua;
      }

      {
        plugin = lspkind-nvim;
      }

      {
        plugin = gitsigns-nvim;
        config = toLuaFile ./plugin/gitsigns.lua;
      }

      {
        plugin = cmp-buffer;
      }

      {
        plugin = cmp-path;
      }

      {
        plugin = cmp_luasnip;
      }

      {
        plugin = cmp-nvim-lsp;
      }

      {
        plugin = luasnip;
      }

      {
        plugin = friendly-snippets;
      }

      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugin/nvim-cmp.lua;
      }

      {
        plugin = nvim-ts-autotag;
      }

      {
        plugin = nvim-autopairs;
        config = toLuaFile ./plugin/autopairs.lua;
      }

      {
        plugin = comment-nvim;
        config = toLuaFile ./plugin/comment.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }

      {
        plugin = telescope-fzf-native-nvim;
      }

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-html
          p.tree-sitter-cpp
          p.tree-sitter-toml
          p.tree-sitter-markdown
          p.tree-sitter-markdown_inline
          p.tree-sitter-javascript
          p.tree-sitter-typescript
          p.tree-sitter-css
          p.tree-sitter-yaml
          p.tree-sitter-gitignore
        ]);
        config = toLuaFile ./plugin/treesitter.lua;
      }

      {
        plugin = nvim-treesitter-textobjects;
        config = toLuaFile ./plugin/nvim-treesitter-text-objects.lua;
      }

      {
        plugin = toggleterm-nvim;
        config = toLuaFile ./plugin/toggleterm.lua;
      }

      {
        plugin = nvim-web-devicons;
      }

      {
        plugin = nvim-surround;
      }

      {
        plugin = markdown-preview-nvim;
      }

      {
        plugin = copilot-vim;
      }

      {
        plugin = dressing-nvim;
      }

      {
        plugin = vim-tmux-navigator;
      }

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lspconfig.lua;
      }

      {
        plugin = null-ls-nvim;
        config = toLuaFile ./plugin/null-ls.lua;
      }

      {
        plugin = lspsaga-nvim;
        config = toLuaFile ./plugin/lspsaga.lua;
      }

      {
        plugin = nui-nvim;
      }

      {
        plugin = image-nvim;
      }

      {
        plugin = neo-tree-nvim;
        config = toLuaFile ./plugin/neo-tree.lua;
      }

      {
        plugin = which-key-nvim;
        config = toLuaFile ./plugin/which-key.lua;
      }

      {
        plugin = auto-session;
        config = toLuaFile ./plugin/auto-session.lua;
      }

      {
        plugin = alpha-nvim;
        config = toLuaFile ./plugin/alpha.lua;
      }
    ];

    extraPackages = with pkgs; [
      # Language servers and tools for Lua
      lua-language-server
      selene
      stylua

      # Language servers and tools for Python
      python311Packages.python-lsp-server
      python311Packages.flake8
      black
      isort

      # Language servers and tools for C++ (clangd, clang-format,clang++, ..)
      llvmPackages_17.clang-unwrapped

      # Language servers and tools for js/ts
      nodePackages.typescript-language-server
      nodePackages.prettier
      prettierd
      eslint_d

      # Language servers and tools for  css
      nodePackages.vscode-css-languageserver-bin

      # Language server and tools for Nix
      nil
      deadnix
      alejandra

      # Language server and tools for bash
      nodePackages.bash-language-server
      shellcheck

      # Language server and tools for yaml
      yamllint
      nodePackages.yaml-language-server

      # Language server and tools for json
      jsonfmt
      nodePackages.vscode-json-languageserver

      # Language server and tools for toml
      nodePackages.prettier-plugin-toml

      # Language server and tools for html
      nodePackages.vscode-html-languageserver-bin

      # Language server and tools for mardown
      markdownlint-cli2
      marksman

      # Language server and tools for docker
      nodePackages.dockerfile-language-server-nodejs
    ];

    extraLuaConfig = ''

      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}

    '';
  };
}
