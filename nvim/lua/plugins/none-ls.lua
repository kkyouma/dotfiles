-- NOTE: formatting and diagnostic
-- INFO: black and isort are deactivated, ruff is working inplace

return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local mason_null = require 'mason-null-ls'

    mason_null.setup {
      ensure_installed = {
        'ruff',
        'prettier',
        'eslint_d',
        'taplo',
      },
    }

    null_ls.setup {
      sources = {
        require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
        require 'none-ls.formatting.ruff_format',
        null_ls.builtins.formatting.stylua, -- lua
        null_ls.builtins.formatting.prettier.with {
          filetypes = { 'astro', 'typescript', 'javascript', 'yaml', 'markdown', 'json', 'html' },
        }, -- javascript
        null_ls.builtins.formatting.sql_formatter, -- sql
        -- WARNING: eslint_d is not founded
        -- null_ls.builtins.diagnostic.eslint_d, -- javascript typescript
      },
    }
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
  end,
}
