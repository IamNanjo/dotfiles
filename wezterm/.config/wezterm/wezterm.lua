local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false
config.default_cursor_style = "SteadyBar"
config.audible_bell = "Disabled"
config.enable_tab_bar = false

config.window_background_opacity = 0.8

config.colors = {
	foreground = "white",
	background = "black",
	selection_fg = "white",
	selection_bg = "#121212",

	cursor_bg = "white",

	ansi = {
		"#000000", -- Black
		"#ff0000", -- Red
		"#00ff00", -- Green
		"#ffff00", -- Yellow
		"#0000ff", -- Blue
		"#ff00ff", -- Magenta
		"#00ffff", -- Cyan
		"#faf8f6", -- White
	},
	brights = {
		"#121212", -- Black
		"#ff6961", -- Red
		"#77dd77", -- Green
		"#fffacd", -- Yellow
		"#42a5f5", -- Blue
		"#f49ac2", -- Magenta
		"#b4fffa", -- Cyan
		"#ffffff", -- White
	},
}

config.font_size = 14

config.disable_default_key_bindings = true

config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = '"',
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical,
	},
	{
		key = "%",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal,
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
	},
}

return config
