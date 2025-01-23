-- INFO: Fold (collapse/expand) functions, class and method class

return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99 -- Using ufo provider needs a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Remove background highlight for folded sections
    vim.api.nvim_set_hl(0, 'Folded', { bg = 'NONE', fg = '#A9A9A9', italic = true })

    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == 'neo-tree' then
          return ''
        end
        return { 'treesitter', 'indent' }
      end,
    }

    -- Optional: Bind zR and zM to open/close all folds
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
  end,
}
