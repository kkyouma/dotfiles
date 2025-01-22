return {
	"kawre/leetcode.nvim",
	lazy = false,
	config = function()
		require("leetcode").setup({
			lang = "python3",
		})
	end,
}
