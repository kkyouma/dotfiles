return {
  'IogaMaster/neocord',
  event = 'VeryLazy',
  config = function()
    require('neocord').setup {
      logo = 'https://yoolk.ninja/wp-content/uploads/2020/11/Apps-Neovim-1024x1024.png',
    }
  end,
}
