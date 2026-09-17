function configure_monitors()
	hl.notification.create({
		text = "configuring monitor",
		timeout = 3000,
	})

	local monitors = hl.get_monitors()
	local count = #monitors

	if count == 1 then
		local monitor1 = monitors[1]
		local port1 = monitor1.name
		hl.monitor({ output = port1, mode = "preferred", position = "auto", scale = 1 })

	elseif count == 2 then
		local monitor1 = monitors[1]
		local port1 = monitor1.name

		local monitor2 = monitors[2]
		local port2 = monitor2.name

		hl.monitor({ output = port1, mode = "preferred", position = "auto", scale = 1 })
		hl.monitor({ output = port2, mode = "preferred", scale = 1, mirror = port1 })
	elseif count == 3 then
		local monitor1 = monitors[1]
		local port1 = monitor1.name

		local monitor2 = monitors[2]
		local port2 = monitor2.name

		local monitor3 = monitors[3]
		local port3 = monitor3.name

		hl.monitor({ output = port2, mode = "preferred", position = "0x0", scale = 1 })
		hl.monitor({ output = port1, mode = "preferred", position = "0x1080", scale = 1 })
		hl.monitor({ output = port3, mode = "preferred", position = "1920x540", scale = 1 })
	end
end

configure_monitors()

local reloading = false
hl.on("monitor.added", function()
	if reloading then return end
	reloading = true
	hl.exec_cmd("hyprctl reload")
	reloading = false
end)

hl.on("monitor.removed", function()
	if reloading then return end
	reloading = true
	hl.exec_cmd("hyprctl reload")
	reloading = false
end)
