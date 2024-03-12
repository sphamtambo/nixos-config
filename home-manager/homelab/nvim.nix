{pkgs, config, ... }:
{

  programs.neovim = 

  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in

  {
    enable = true;

  plugins = with pkgs.vimPlugins; [

	{
	plugin = lualine-nvim;
	config = toLuaFile ./nvim/plugin/lualine.lua;
	}

	{
	plugin = dracula-nvim;
	config = toLuaFile ./nvim/plugin/colorscheme.lua;
	}

	{
	plugin = lspkind-nvim;
	}

	{
	plugin = gitsigns-nvim;
	config = toLuaFile ./nvim/plugin/autopairs.lua;
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
	plugin = luasnip;
	}

	{
	plugin = friendly-snippets;
	}

	{
	plugin = nvim-cmp;
	config = toLuaFile ./nvim/plugin/nvim-cmp.lua;
	}

	{
	plugin = nvim-ts-autotag;
	}

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

	{
	plugin = telescope-fzf-native-nvim;
	}

	{
	plugin = (nvim-treesitter.withPlugins (p: [
	  p.tree-sitter-nix
	  p.tree-sitter-vim
	  p.tree-sitter-bash
	  p.tree-sitter-lua
	  p.tree-sitter-python
	  p.tree-sitter-json
	]));
	config = toLuaFile ./nvim/plugin/treesitter.lua;
	}

	{
	plugin = toggleterm-nvim;
	config = toLuaFile ./nvim/plugin/toggleterm.lua;
	}

	
	{
	plugin = nvim-web-devicons;
	}

	{
	plugin = nvim-surround;
	}

	{
	plugin = dressing-nvim;
	}

	{
	plugin = vim-tmux-navigator;
	}

	{
	plugin = copilot-vim;
	}

	{
	plugin = markdown-preview-nvim;
	}

  ];





    extraLuaConfig = ''

    ${builtins.readFile ./nvim/options.lua}
    ${builtins.readFile ./nvim/keymaps.lua}

    '';

};
}



