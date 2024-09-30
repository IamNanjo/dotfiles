local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false
config.default_cursor_style = "SteadyBar"
config.audible_bell = "Disabled"
config.enable_tab_bar = false

local ansi_colors = {
	"#121212", -- Black
	"#ff6961", -- Red
	"#77dd77", -- Green
	"#fffacd", -- Yellow
	"#42a5f5", -- Blue
	"#f49ac2", -- Magenta
	"#b4fffa", -- Cyan
	"#faf8f6", -- White
}

config.window_background_opacity = 0.8
config.colors = {
	foreground = "white",
	background = "black",
	selection_fg = "white",
	selection_bg = "#121212",

	ansi = ansi_colors,
	brights = ansi_colors,
}

config.font_size = 14

return config
