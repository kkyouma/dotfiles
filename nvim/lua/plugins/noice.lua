-- NOTE: improve nvim notifications

return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'rcarriga/nvim-notify',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('notify').setup {
      timeout = 300,
      max_height = 3,
      max_width = 50,
      render = 'compact',
      stages = 'fade',
    }

    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        progress = { enabled = true },
        hover = {
          enabled = true,
          silent = true,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
          },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true, -- Split long messages
        inc_rename = false, -- Disable incremental rename
        lsp_doc_border = false, -- No border for LSP docs
      },
      routes = {
        {
          filter = {
            any = {
              { event = 'msg_show', kind = '', find = 'written' },
              { event = 'msg_show', kind = '', find = 'No information available' },
              { event = 'msg_show', kind = '', find = 'Undo' },
              { event = 'msg_show', kind = '', find = 'Redo' },
            },
          },
          opts = { skip = true },
        },
        {
          filter = {
            any = {
              { event = 'msg_show', kind = '', find = 'Undo' },
              { event = 'msg_show', kind = '', find = 'Redo' },
            },
          },
          opts = { skip = true },
        },
      },
    }
  end,
}
