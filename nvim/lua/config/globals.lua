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
    vim.opt_local.wrap = true -- Enable text wrapping
    vim.opt_local.linebreak = true -- Break lines at word boundaries
  end,
})

-- Changing Python highlight
vim.api.nvim_set_hl(0, '@module.python', { link = 'Variable' })
-- vim.api.nvim_set_hl(0, '@string.documentation.python', { link = 'Comment' })

-- Changing TOML and YML highlight
vim.api.nvim_set_hl(0, '@property.toml', { link = '@module.builtin' })
vim.api.nvim_set_hl(0, '@property.yml', { link = '@module.builtin' })

vim.diagnostic.config { virtual_text = true }

-- Which-key toggle
-- _G.which_key_enabled = true
--
-- local function toggle_which_key()
--   local wk = require 'which-key'
--
--   if _G.which_key_enabled then
--     wk.setup { triggers = {} }
--     _G.which_key_enabled = false
--     print 'Which-key disabled'
--   else
--     wk.setup { triggers = { { '<auto>', mode = 'nxso' } } }
--     _G.which_key_enabled = true
--     print 'Which-key enabled'
--   end
-- end
--
-- vim.api.nvim_create_user_command('ToggleWhichKey', toggle_which_key, {})
-- vim.keymap.set('n', '<leader>wk', toggle_which_key, { desc = 'Toggle which-key' })
