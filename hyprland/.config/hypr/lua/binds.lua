local terminal = "ghostty"
local menu = "rofi -show drun -sort -sorting-method fzf"
local fileManager = "dolphin"

-- bind = Control_L Alt_L, T, exec, $terminal
hl.bind("CONTROL + ALT + T", hl.dsp.exec_cmd(terminal), { desc = "Open terminal" })
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close(), { desc = "Close active window" })
hl.bind("SUPER + Q", hl.dsp.window.kill(), { desc = "Kill active window" })
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprland-run"), { desc = "Open hyprland-run menu" })
hl.bind("SUPER + S", hl.dsp.exec_cmd(menu), { desc = "Open application launcher" })
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager), { desc = "Open file manager" })

hl.bind("SUPER + M", hl.dsp.exec_cmd("uwsm stop"), { desc = "Close Hyprland (uwsm)" })
hl.bind("SUPER + V", hl.dsp.window.float(), { desc = "Toggle float for active window" })

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }), { desc = "Move focus left" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }), { desc = "Move focus down" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }), { desc = "Move focus up" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }), { desc = "Move focus right" })

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = key }), { desc = "Focus workspace " .. key })
	hl.bind(
		"SUPER + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = key }),
		{ desc = "Move window to workspace " .. key }
	)
end

hl.bind("SUPER + SHIFT + H", hl.dsp.workspace.move({ monitor = "l" }), { desc = "Move workspace left" })
hl.bind("SUPER + SHIFT + J", hl.dsp.workspace.move({ monitor = "d" }), { desc = "Move workspace down" })
hl.bind("SUPER + SHIFT + K", hl.dsp.workspace.move({ monitor = "u" }), { desc = "Move workspace up" })
hl.bind("SUPER + SHIFT + L", hl.dsp.workspace.move({ monitor = "r" }), { desc = "Move workspace right" })

-- 272 = LMB
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, desc = "Drag to move window" })
-- 273 = RMB
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, desc = "Drag to resize window" })

hl.bind("SUPER + F", hl.dsp.window.fullscreen())

hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.exec_cmd("bash -c 'systemctl suspend'"), { desc = "Suspend" })

-- # Media controls
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true, desc = "Increase default audio volume" }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true, desc = "Decrease default audio volume" }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, desc = "Mute default audio output" }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, desc = "Mute default audio input" }
)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, desc = "Media: play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, desc = "Media: skip" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, desc = "Media: previous" })

hl.bind(
	"ALT_R + Insert",
	hl.dsp.exec_cmd(
		"wpctl set-volume $(wpctl status | grep 'virtual_sink_primary' | head -n 1 | awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\\.$/) {print $i}}' | tr -d '.') 5%+ -l 1.0"
	),
	{ locked = true, repeating = true, desc = "Increase primary output volume" }
)
hl.bind(
	"ALT_R + Delete",
	hl.dsp.exec_cmd(
		"wpctl set-volume $(wpctl status | grep 'virtual_sink_primary' | head -n 1 | awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\\.$/) {print $i}}' | tr -d '.') 5%- -l 1.0"
	),
	{ locked = true, repeating = true, desc = "Decrease primary output volume" }
)

hl.bind(
	"ALT_R + Home",
	hl.dsp.exec_cmd(
		"wpctl set-volume $(wpctl status | grep 'virtual_sink_chat' | head -n 1 | awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\\.$/) {print $i}}' | tr -d '.') 5%+ -l 1.0"
	),
	{ locked = true, repeating = true, desc = "Increase chat output volume" }
)
hl.bind(
	"ALT_R + End",
	hl.dsp.exec_cmd(
		"wpctl set-volume $(wpctl status | grep 'virtual_sink_chat' | head -n 1 | awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\\.$/) {print $i}}' | tr -d '.') 5%- -l 1.0"
	),
	{ locked = true, repeating = true, desc = "Decrease chat output volume" }
)

-- Prior = Page Up
hl.bind(
	"ALT_R + Prior",
	hl.dsp.exec_cmd(
		"wpctl set-volume $(wpctl status | grep 'virtual_sink_media' | head -n 1 | awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\\.$/) {print $i}}' | tr -d '.') 5%+ -l 1.0 "
	),
	{ locked = true, repeating = true, desc = "Increase media output volume" }
)
-- Next = Page Down
hl.bind(
	"ALT_R + Next",
	hl.dsp.exec_cmd(
		"wpctl set-volume $(wpctl status | grep 'virtual_sink_media' | head -n 1 | awk '{for(i=1;i<=NF;i++) if($i ~ /^[0-9]+\\.$/) {print $i}}' | tr -d '.') 5%- -l 1.0"
	),
	{ locked = true, repeating = true, desc = "Decrease media output volume" }
)

-- # Brightness control
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd('brightnessctl -d "*" s +10%'),
	{ locked = true, repeating = true, desc = "Increase brightness" }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd('brightnessctl -d "*" s 10%-'),
	{ locked = true, repeating = true, desc = "Decrease brightness" }
)

hl.bind(
	"Print",
	hl.dsp.exec_cmd("grim -g \"$(slurp -d -F 'JetBrainsMono NF')\" -t ppm - | satty --filename -"),
	{ desc = "Take screenshot" }
)

hl.bind("SUPER + minus", hl.dsp.exec_cmd("wtype '–'"), { desc = "Type en dash" })
hl.bind("SUPER + SHIFT + minus", hl.dsp.exec_cmd("wtype '—'"), { desc = "Type em dash" })
