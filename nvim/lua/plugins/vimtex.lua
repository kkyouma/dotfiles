return {
  'lervag/vimtex',
  lazy = false,
  config = function()
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
    vim.g.vimtex_view_method = 'zathura'      -- PDF viewer (linux)
    vim.g.vimtex_compiler_method = 'latexmk'  -- Compiler backend
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
  end,
}
