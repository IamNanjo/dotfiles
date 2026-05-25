local enabled = true

hl.curve("custom_bezier", {
	type = "bezier",
	points = { { 0, 0 }, { 0.58, 1 } },
})

hl.animation({ enabled = enabled, bezier = "custom_bezier", speed = 1, leaf = "fade" })
hl.animation({ enabled = enabled, bezier = "custom_bezier", speed = 1, leaf = "windows" })
hl.animation({ enabled = enabled, bezier = "custom_bezier", speed = 1, leaf = "windowsOut", style = "popin" })
hl.animation({ enabled = enabled, bezier = "custom_bezier", speed = 1, leaf = "workspaces" })
