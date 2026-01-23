return {
  'IogaMaster/neocord',
  event = 'VeryLazy',
  config = function()
    require('neocord').setup {
      logo = 'https://yoolk.ninja/wp-content/uploads/2020/11/Apps-Neovim-1024x1024.png',
      logo_tooltip = 'Neovim',
      editing_text = '%s', -- Solo muestra el tipo de archivo/lenguaje
      file_explorer_text = 'Explorando',
      show_time = true,
      workspace_text = 'Bussy',
    }
  end,
}
