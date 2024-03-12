{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # LSP
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = /* lua */ ''
        local lspconfig = require('lspconfig')
        function add_lsp(server, options)
          if options["cmd"] ~= nil then
            binary = options["cmd"][1]
          else
            binary = server["document_config"]["default_config"]["cmd"][1]
          end
          if vim.fn.executable(binary) == 1 then
            server.setup(options)
          end
        end

        add_lsp(lspconfig.dockerls, {})
        add_lsp(lspconfig.bashls, {})
        add_lsp(lspconfig.clangd, {})
        add_lsp(lspconfig.nil_ls, {})
        add_lsp(lspconfig.pylsp, {})
        add_lsp(lspconfig.lua_ls, {})
        add_lsp(lspconfig.tsserver, {
          cmd = { "tsserver", "--stdio" }
        })
      '';
    }
  ];
}
