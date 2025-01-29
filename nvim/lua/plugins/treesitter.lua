-- NOTE: syntax highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'csv', 'markdown', 'markdown_inline' },
    auto_install = true,
    highlight = {
      enable = true,
      disable = { 'csv' },
      additional_vim_regex_highlighting = { 'ruby' },
    },
    -- run = ':TSUpdate',
    indent = {
      enable = true,
      disable = { 'ruby' },
    },
  },
}
