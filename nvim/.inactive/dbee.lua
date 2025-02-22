return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup {
      type = 'libsql',
      name = 'turso-db',
      url = vim.env.TURSO_DATABASE_URL,
      token = vim.env.TURSO_AUTH_TOKEN,
    }
  end,
}
