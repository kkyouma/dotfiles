vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Images
-- vim.api.nvim_set_keymap('n', '<leader>ip', ":lua require('image_preview').toggle_preview()<CR>", { noremap = true, silent = true })

-- Underline
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    local hl_groups = {
      'DiagnosticUnderlineError',
      'DiagnosticUnderlineWarn',
      'DiagnosticUnderlineHint',
      'DiagnosticUnderlineInfo',
    }
    for _, hl in ipairs(hl_groups) do
      vim.cmd('highlight ' .. hl .. ' gui=underline')
    end
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autowrap
vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Wrap text when it exceeds the right margin',
  pattern = { 'markdown', 'text', 'tex' },
  callback = function()
    vim.opt_local.wrap = true      -- Enable text wrapping
    vim.opt_local.linebreak = true -- Break lines at word boundaries
  end,
})
