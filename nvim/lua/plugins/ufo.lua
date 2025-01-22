-- INFO: Fold (collapse/expand) functions, class and method class

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == "neo-tree" then
          return ""
        end
        return { "treesitter", "indent" }
      end,
    })
  end,
}
