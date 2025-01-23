return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('tokyonight').setup {
      style = 'night', -- Aplica el estilo deseado
      lualine_bold = true,
      -- on_colors = function(colors)
      --   colors.bg = '#1a1b26'
      -- end,
      -- on_highlights = function(highlights, colors)
      --   highlights.String = { fg = colors.green }
      --   highlights['@punctuation.delimiter.string'] = { fg = colors.yellow }
      -- end,
    }
    vim.cmd [[colorscheme tokyonight-night]] -- Activa el esquema de color
  end,
}
