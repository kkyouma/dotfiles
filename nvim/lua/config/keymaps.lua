-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic 
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Open diagnostic [Q]'})

-- Delete word backwards in Insert Mode
vim.keymap.set('i', '<C-H>', '<C-W>', { noremap = true, silent = true })

-- Navigate vim panes better ---------------------------------------
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<CR>')

-- neo-tree (plugin)
vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle filesystem reveal left<CR>', {})
vim.keymap.set('n', '<leader>bf', '<cmd>Neotree buffers reveal float<CR>', {})
vim.keymap.set('n', '<C-S>', '<cmd>Neotree toggle buffers reveal float<CR>', {})

-- Hold selection in ident
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
