-- NOTE: syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "markdown", "markdown_inline" },
			run = ":TSUpdate",
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			additional_vim_regex_highlighting = false,
		})
	end,
}
