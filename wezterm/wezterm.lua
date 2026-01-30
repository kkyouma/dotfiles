local wezterm = require("wezterm")
local config = {}

-- Theme
config.color_scheme = "deep_blue_custom"

-- Wayland + Blur
config.enable_wayland = true
config.window_background_opacity = 0.85

-- Terminal
config.term = "wezterm"
config.custom_block_glyphs = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.max_fps = 144

-- Font
config.font = wezterm.font("JetBrains Mono")

-- Layout
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Cursor & underline
config.underline_thickness = 1.0
config.underline_position = -2.0
config.default_cursor_style = "SteadyBar"

-- Startup
config.initial_rows = 27
config.initial_cols = 100
config.window_close_confirmation = "NeverPrompt"

-- Keys
config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
	},
	{
		key = "Delete",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "Delete", mods = "CTRL" }),
	},
}

return config
