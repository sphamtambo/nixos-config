-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		formatting.black, -- python code formatter
		formatting.isort, -- python style linter for import statements
		formatting.alejandra, -- python style linter for import statements
		-- diagnostics.mypy, --python type checker
		formatting.stylua, -- lua code formatter
		diagnostics.flake8, -- python linter, error, complexity analysis
		diagnostics.selene, -- lua linter
		diagnostics.deadnix, -- lua linter
		-- formatting.clang_format, -- c/c++ formatter
		-- formatting.prettier, -- js/ts formatter
		-- diagnostics.eslint_d.with({ -- js/ts linter
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
		-- 	end,
		-- }),
		--run the following command to select Google style and formant on save
		--~/.local/share/nvim/mason/bin/clang-format --style Google --dump-config > .clang-format
		-- null_ls.builtins.code_actions, -- code actions
		-- null_ls.builtins.gitsigns, -- gitsigns
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

-- diagnostics settings
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
})
