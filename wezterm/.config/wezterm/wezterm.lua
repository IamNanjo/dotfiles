local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = true
config.default_cursor_style = "SteadyBar"
config.audible_bell = "Disabled"
config.enable_tab_bar = false

config.window_decorations = "NONE"
config.window_background_opacity = 0.9

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.colors = {
	foreground = "white",
	background = "black",
	selection_fg = "white",
	selection_bg = "#121212",

	cursor_bg = "white",

	ansi = {
		"#494d64", -- Black
		"#ff6961", -- Red
		"#a6da95", -- Green
		"#eed49f", -- Yellow
		"#8aadf4", -- Blue
		"#f5bde6", -- Magenta
		"#8bd5ca", -- Cyan
		"#b8c0e0", -- White
	},
	brights = {
		"#5b6078", -- Black
		"#ff6961", -- Red
		"#a6da95", -- Green
		"#eed49f", -- Yellow
		"#8aadf4", -- Blue
		"#f5bde6", -- Magenta
		"#8bd5ca", -- Cyan
		"#a5adcb", -- White
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
