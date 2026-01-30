return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('codeium').setup {
      enable_cmp_source = false,
      virtual_text = {
        filetypes = {
          python = true,
          lua = true,
          javascript = true,
          typescript = true,
        },
        map_keys = true,
        key_bindings = {
          accept = '<C-n>',
          accept_word = '<C-Right>',
          accept_line = '<C-Down>',
          clear = '<C-x>',
          next = '<M-]>',
          prev = '<M-[>',
        },
        enabled = true,
        idle_delay = 3000,
      },
      workspace_root = {
        use_lsp = true,
        paths = {
          '.git',
          'pyproyect.toml',
          'setup.py',
          'requirements.txt',
          'package.json',
          'lazy-lock.json',
        },
      },
    }
  end,
}
