return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = false,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { '.git' },
        },
      },

      default_component_configs = {
        git_status = {
          symbols = {
            added = '',
            modified = '',
            deleted = '✖',
            renamed = '󰁕',
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
      },
    }

    -- ── Dotfiles ──────────────────────────────
    vim.api.nvim_set_hl(0, 'NeoTreeDotfile', {
      fg = '#6c7086',
    })

    -- Gitignored: icon + name gray
    vim.api.nvim_set_hl(0, 'NeoTreeGitIgnored', {
      fg = '#45475a',
      italic = true,
    })
  end,
}
