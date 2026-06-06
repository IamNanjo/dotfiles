hl.window_rule({
	name = "all",
	match = {
		class = ".*",
	},

	suppress_event = "maximize",
	no_max_size = 1,
})

hl.window_rule({
	name = "floating",
	match = {
		float = 1,
	},

	border_size = 2,
	rounding = 4,
})

hl.window_rule({
	name = "xdg-desktop-portal",
	match = {
		class = "^xdg-desktop-portal.*",
	},

	float = 1,
})

hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = {
		class = "xwaylandvideobridge",
	},

	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = { 1, 1 },
	opacity = 0.0,
})

hl.window_rule({
	name = "hyprland-share-picker",
	match = {
		class = "hyprland-share-picker",
	},

	float = 1,
})

hl.window_rule({
	name = "app-launcher",
	match = {
		class = "Rofi|hyprland-run",
	},

	float = 1,
	center = 1,
	stay_focused = 1,
})

hl.window_rule({
	name = "copyq",
	match = { class = ".*copyq$" },

	float = 1,
	size = { "monitor_w*0.5", "monitor_h*0.5" },
})

hl.window_rule({
	name = "pavucontrol",
	match = {
		class = ".*pavucontrol$",
	},

	float = 1,
	size = { "monitor_w*0.6", "monitor_h*0.6" },
})

hl.window_rule({
	name = "satty",
	match = {
		class = "com.gabm.satty",
	},

	fullscreen = 1,
	no_anim = 1,
})

hl.window_rule({
	name = "zen-browser",
	match = {
		class = "^zen$",
	},

	fullscreen_state = "0 2",
	suppress_event = "fullscreen",
})

hl.window_rule({
	name = "zen-browser-library",
	match = {
		class = "^zen.*",
		title = "^Library$",
	},

	float = 1,
})

hl.window_rule({
	name = "discord",
	match = {
		class = "vesktop|discord",
	},

	workspace = "4 silent",
})

hl.window_rule({
	name = "dolphin",
	match = {
		class = "org.kde.dolphin"
	},

	float = 1
})
