return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'tokyonight-night' -- Activa el esquema de color
  end,
}
