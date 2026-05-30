-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/

local function load_configs()
	local config_files = io.popen("ls -1 ~/.config/hypr/lua 2>/dev/null")

	if config_files == nil then
		return
	end

	for f in config_files:lines() do
		---@cast f string

		if f:sub(-4) == ".lua" then
			local module_name = "lua." .. f:sub(1, -5) -- Strip the ".lua"
			package.loaded[module_name] = nil -- Remove cached module
			require(module_name)
		end
	end

	config_files:close()
end

-- config.reloaded also runs at startup
hl.on("config.reloaded", load_configs)

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("copyq")
	hl.exec_cmd("swaync")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("udiskie -t")
end)
