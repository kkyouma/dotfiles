-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })

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

-- LaTeX ------------------------------------------------------------
-- Compile
vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<cr>', { desc = 'LaTeX Compile' })

-- View PDF
vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<cr>', { desc = 'View PDF' })

-- Clean auxiliary files
vim.keymap.set('n', '<leader>lc', '<cmd>VimtexClean<cr>', { desc = 'Clean LaTeX' })
