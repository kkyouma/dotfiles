-- NOTE: syntax highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'markdown', 'markdown_inline' },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    -- run = ':TSUpdate',
    indent = {
      enable = true,
      disable = { 'ruby' },
    },
  },
}
