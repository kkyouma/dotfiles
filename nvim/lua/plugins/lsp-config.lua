return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'j-hui/fidget.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Enable Nerd Font diagnostic symbols
      -- local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      -- for type, icon in pairs(signs) do
      --   local hl = 'DiagnosticSign' .. type
      --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      -- end

      -- LSP Attach Configuration
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Navigation
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Actions
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'v' })
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- Enable inlay hints if available
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Capabilities with nvim-cmp integration
      local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities())

      -- Language Server Settings
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
              typeCheckingMode = 'standard',
            },
            python = {
              analysis = {
                -- Disable non-type-related diagnostics
                diagnosticMode = 'workspace',
                typeCheckingMode = 'standard',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                -- Disable general code checks
                reportGeneralTypeIssues = true, -- Keep type-related reports
                reportOptionalMemberAccess = true,
                reportOptionalSubscript = true,
                reportOptionalCall = true,
                reportOptionalIterable = true,
                reportPrivateImportUsage = false,
                reportUnusedImport = false,   -- Let Ruff handle these
                reportUnusedVariable = false, -- Let Ruff handle these
                reportMissingImports = false, -- Let Ruff handle these
              },
            },
          },
        },
        ruff = {
          settings = {
            lint = {
              ignore = {
                'RET',
                'ANN',
              },
              extendSelect = {
                'F',  -- Flake8
                'E',  -- Pycodestyle
                'W',  -- Pycodestyle
                'UP', -- Pyupgrade
                'I',  -- Isort
              },
            },
            configurationPreference = 'filesystemFirst',
            organizeImports = true,
            lineLength = 88,
          },
        },
        sqlls = {},
        taplo = {},
        astro = {},
        marksman = {},
        texlab = {
          settings = {
            texlab = {
              onOpenAndSave = true,
            },
            build = {
              executable = 'latexmk',
              args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
              onSave = true,
            },
          },
        },
      }

      -- Mason LSP Configuration
      -- Mason Tool Installer Configuration
      require('mason-tool-installer').setup {
        ensure_installed = {
          'stylua',
          'ruff',
          -- Add other tools as needed
        },
        auto_update = true,
      }

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Enable fidget for LSP progress
      require('fidget').setup()
    end,
  },
}
