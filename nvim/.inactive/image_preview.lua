-- INFO: To see images in nvim

return {
	"adelarsq/image_preview.nvim",
	event = "VeryLazy",
	config = function()
		require("image_preview").setup({
			backend = "kitty",
		})
	end,
}
