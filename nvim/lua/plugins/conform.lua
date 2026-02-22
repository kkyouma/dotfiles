-- NOTE: formatting only (conform doesn't handle diagnostics)

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      astro = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      json = { 'prettier' },
      sql = { 'sqlfluff' },
      terraform = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
    },
  },
}
