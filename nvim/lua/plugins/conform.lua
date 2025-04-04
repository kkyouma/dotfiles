-- NOTE: formatting only (conform doesn't handle diagnostics)

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format', 'ruff' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        astro = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        json = { 'prettier' },
        html = { 'prettier' },
        sql = { 'sql_formatter' },
        -- Add more filetypes and formatters as needed
      },
      formatters = {
        ruff = {
          args = { '--select', 'I', '--fix', '-' },
        },
      },
      -- Format on save (similar to the keybinding you had)
      format_on_save = {
        -- Customize options if needed
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    -- Keybinding for manual formatting (same as your original config)
    vim.keymap.set('n', '<leader>f', function()
      conform.format { lsp_fallback = true }
    end, { desc = 'Format document' })
  end,
}
