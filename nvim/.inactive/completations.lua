return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
      },
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets', -- Anoying premade snippets
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load {
          paths = { '~/path/to/friendly-snippets' },
          include = { 'tex' }, -- Load LaTeX snippets
        }
      end,
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind.nvim', -- Icons
      'micangl/cmp-vimtex',
    },
    config = function()
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'
      local luasnip = require 'luasnip'

      -- local kind_icons = {
      --   article = '󰧮 ',
      --   book = ' ',
      --   incollection = '󱓷 ',
      --   Function = '󰊕 ',
      --   Constructor = ' ',
      --   Text = '󰦨 ',
      --   Method = ' ',
      --   Field = '󰅪 ',
      --   Variable = '󱃮 ',
      --   Class = ' ',
      --   Interface = ' ',
      --   Module = ' ',
      --   Property = ' ',
      --   Unit = ' ',
      --   Value = '󰚯 ',
      --   Enum = ' ',
      --   Keyword = ' ',
      --   Snippet = ' ',
      --   Color = '󰌁',
      --   -- Color = "",
      --   File = '',
      --   Reference = ' ',
      --   Folder = ' ',
      --   EnumMember = ' ',
      --   -- spell = "",
      --   -- EnumMember = "",
      --   Constant = '󰀫 ',
      --   Struct = '',
      --   -- Struct = "",
      --   Event = ' ',
      --   Operator = '󰘧 ',
      --   TypeParameter = ' ',
      -- }

      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        formatting = {
          fields = { 'abbr', 'kind', 'menu' },
          expandable_indicator = true,
          format = lspkind.cmp_format {
            mode = 'symbol_text',
          },
        },
        window = {
          -- completions = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
          completion = {
            max_items = 3,
          },
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          {
            name = 'lazydev',
            group_index = 0,
          },
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'vimtex' },
          { name = 'buffer', keyword_length = 3 },
          { name = 'nvim_lsp_signature_help' },
          { name = 'render-markdown' },
        },
      }
    end,
  },
}
