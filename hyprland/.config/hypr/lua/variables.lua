hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 0,

		col = {
			inactive_border = { colors = { "rgb(f38ba8)", "rgb(89b4fa)" }, angle = 45 },
			active_border = { colors = { "rgb(f38ba8)", "rgb(89b4fa)" }, angle = 45 },
		},

		allow_tearing = false,
		layout = "dwindle",
	},

	cursor = {
		inactive_timeout = 1,
	},

	decoration = {
		rounding = 0,

		blur = {
			enabled = true,
			xray = true,
			size = 2,
		},

		shadow = {
			enabled = false,
		},
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		render_unfocused_fps = 120,
		vrr = 1,
	},

	input = {
		kb_layout = "fi",
		kb_variant = "nodeadkeys",
		kb_options = "caps:none",

		follow_mouse = 2,

		sensitivity = 0,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
			drag_lock = 2,
		},
	},

	ecosystem = {
		no_update_news = true,
	},
})
