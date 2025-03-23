local wezterm = require("wezterm")
local config = {}

config.color_scheme = "tokyonight_night"

config.term = "wezterm"
-- config.front_end = "OpenGL"
config.custom_block_glyphs = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_background_opacity = 1
config.max_fps = 144
config.font = wezterm.font("JetBrains Mono")
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
config.underline_thickness = 1.0
config.underline_position = -2.0
config.default_cursor_style = "SteadyBar"

config.keys = {
  {
    key = "Backspace",
    mods = "CTRL",
    action = wezterm.action.SendKey({
      key = "w",
      mods = "CTRL",
    }),
  },
  {
    key = "Delete",
    mods = "CTRL",
    action = wezterm.action.SendKey({
      key = "Delete",
      mods = "CTRL",
    }),
  },
}

return config
