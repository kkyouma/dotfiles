vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Delete word backwards in Insert Mode
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, silent = true })

-- Move Lines
vim.keymap.set("n", "<S-up>", "<cmd>m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<S-down>", "<cmd>m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<S-up>", "<cmd>m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-down>", "<cmd>m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Navigate vim panes better ---------------------------------------
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

-- neo-tree (plugin)
vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>bf", "<cmd>Neotree buffers reveal float<CR>", {})
vim.keymap.set("n", "<C-S>", "<cmd>Neotree toggle buffers reveal float<CR>", {})

-- Hold selection in ident
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Diagnostic
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Images
vim.api.nvim_set_keymap(
	"n",
	"<leader>ip",
	":lua require('image_preview').toggle_preview()<CR>",
	{ noremap = true, silent = true }
)

-- Underline
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl_groups = {
			"DiagnosticUnderlineError",
			"DiagnosticUnderlineWarn",
			"DiagnosticUnderlineHint",
			"DiagnosticUnderlineInfo",
		}
		for _, hl in ipairs(hl_groups) do
			vim.cmd("highlight " .. hl .. " gui=underline")
		end
	end,
})
