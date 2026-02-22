return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        sql = { 'sqlfluff' },
        json = { 'eslint_d' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        astro = { 'eslint_d' },
        terraform = { 'tflint', 'trivy' },
        tf = { 'tflint', 'trivy' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
