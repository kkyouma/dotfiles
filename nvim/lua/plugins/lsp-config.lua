return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
    'b0o/schemastore.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method('textDocument/documentHighlight', event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client:supports_method('textDocument/inlayHint', event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- LSP name (clave) debe coincidir con el nombre que usa nvim-lspconfig/vim.lsp
    local servers = {
      -- PYTHON: I pray for Astral
      ruff = {
        settings = {
          lint = {
            ignore = { 'RET', 'ANN' },
            extendSelect = { 'F', 'E', 'W', 'UP', 'I', 'B', 'C4', 'SIM', 'PD' },
            fixable = { 'ALL' },
          },
          configurationPreference = 'filesystemFirst',
          organizeImports = true,
          lineLength = 88,
        },
      },
      ty = {},

      -- WEB: Unificación con Biome (JS, TS, JSON) + Frameworks
      biome = {}, -- Reemplaza Prettier/ESLint en proyectos modernos
      vtsls = {}, -- LSP de TS más rápido que tsserver
      vue_ls = {}, -- Vue Official (anteriormente vue_ls)
      astro = {}, -- Astro Framework

      -- INFRA & CLOUD
      terraformls = {},
      tflint = {},
      dockerls = {},
      -- docker_compose_language_service = {},

      -- FORMATOS DE DATOS & CONFIG
      taplo = {}, -- El estándar para TOML
      yamlls = {
        settings = {
          yaml = {
            schemaStore = { enable = false, url = '' },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      },
      jsonls = { -- Biome puede manejarlo, pero jsonls + SchemaStore es más potente para dbt/k8s
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      },

      -- OTROS
      bashls = {},
      sqlls = {},
      selene = {}, -- Linter para Lua
    }

    -- Mapa LSP name -> nombre en Mason (actualizado a 2026)
    local mason_name_map = {
      -- Python
      ruff = 'ruff',
      ty = 'ty',

      -- Web
      biome = 'biome',
      vtsls = 'vtsls',
      vue_ls = 'vue-language-server',
      astro = 'astro-language-server',

      -- Infra
      terraformls = 'terraform-ls',
      tflint = 'tflint',
      dockerls = 'dockerfile-language-server',
      hadolint = 'hadolint',
      -- docker_compose_language_service = 'docker-compose-language-service',

      -- Data/Misc
      taplo = 'taplo',
      yamlls = 'yaml-language-server',
      jsonls = 'json-lsp',
      bashls = 'bash-language-server',
      sqlls = 'sqlls',
      selene = 'selene',
      -- lua_ls = 'lua-language-server',
    }

    -- Construir lista de herramientas Mason
    local ensure_installed = {}
    for lsp_name, _ in pairs(servers) do
      local mason_name = mason_name_map[lsp_name] or lsp_name
      table.insert(ensure_installed, mason_name)
    end
    vim.list_extend(ensure_installed, {
      'lua-language-server',
      'stylua',
      'astro-language-server',
      'hadolint',
      -- 'prettier',
      -- 'eslint-lsp',
    })

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
      auto_update = true,
      run_on_start = true,
    }

    -- Habilitar todos los servidores del loop
    for name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end

    -- Lua (config especial fuera del loop)
    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            path = { 'lua/?.lua', 'lua/?/init.lua' },
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file('', true),
          },
        })
      end,
      settings = { Lua = {} },
    })
    vim.lsp.enable 'lua_ls'
  end,
}
