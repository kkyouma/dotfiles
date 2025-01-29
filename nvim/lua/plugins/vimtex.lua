return {
  'lervag/vimtex',
  ft = 'tex', -- Lazy-load for .tex files
  config = function()
    vim.g.vimtex_view_method = 'zathura'     -- PDF viewer (linux)
    vim.g.vimtex_compiler_method = 'latexmk' -- Compiler backend
    vim.g.vimtex_quickfix_mode = 0           -- Disable auto-open quickfix
  end,
}
