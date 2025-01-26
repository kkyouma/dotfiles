return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    user_default_options = {
      RGB = true,      -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      names = false,   -- "Name" codes like Blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      css = true,      -- Enable all CSS features
      css_fn = true,   -- Enable all CSS *functions*
    },
  },
}
