local servers = { "lua_ls", "pyright", "sqlls", "taplo", "ruff", "astro" }

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, opts)
			end

			-- lua_ls (LSP)
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Pyright (LSP)
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
				settings = {
					pyright = {
						disableOrganizeImports = false, -- Using Ruff
					},
					python = {
						analysis = {
							typeCheckingMode = "standard", -- Using mypy (last config: "off")
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			-- Ruff (LSP)
			lspconfig.ruff.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
				trace = "messages",
				settings = {
					configurationPreference = "filesystemFirst", -- editorFirst
					organizeImports = true,
					logLevel = "info",
					lineLenght = 88,
					lint = true,
				},
			})

			-- sqlls
			lspconfig.sqlls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- taplo
			lspconfig.taplo.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- astro
			lspconfig.astro.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
