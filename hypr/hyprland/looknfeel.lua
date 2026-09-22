hl.config({
	general = {
		border_size = 2
	,	gaps_in = 2
	,	gaps_out = 0

	,	col = {
			active_border = "#7AA2F7"
		,	inactive_border = "#A9B1D6"
		}

	,	resize_on_border = true
	,	allow_tearing = false
	,	layout = "master"
	},

	dwindle = {
		preserve_split = true
	},
	master = {
		new_status = "master"
	},
	misc = {
		force_default_wallpaper = -1
	,	disable_hyprland_logo = true
	},

	decoration = {
		rounding = 25

	, active_opacity = 0.99
	, inactive_opacity = 0.90

	,	blur = {
			enabled = false
		,	size = 3
		,	passes = 4
		,	vibrancy = 0.4
		}
	,	shadow = {
			enabled = false
		,	range = 10
		,	render_power = 10
		,	color = "rgba(9d15ec44)"
		}
	}
})

-- animations

hl.curve("main", { type = "bezier", points = { {0.4, 1.27}, { 0.38, 1 } }})
hl.curve("ease", { type = "bezier", points = { {0.25, 1}, {0.25, 1} }})
hl.curve("easeIn", { type = "bezier", points = { {0.42, 0}, {1, 1} }})
hl.curve("workspaceSwap", { type = "bezier", points = { {0.23, 1.2}, {0.3, 1} }})

-- default
hl.animation({ leaf = "global", enabled = true, speed = 5, bezier = "main" })

-- windows
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "main", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "ease", style = "popin" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "main", style = "slide" })

-- layers
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "main", style = "popin" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "ease", style = "popin" })

-- fade
hl.animation({ leaf = "fadeIn", 				enabled = true, speed = 5, 	bezier = "main" })
hl.animation({ leaf = "fadeOut", 				enabled = true, speed = 5, 	bezier = "easeIn" })
hl.animation({ leaf = "fadeSwitch", 		enabled = true, speed = 10, bezier = "ease" })
hl.animation({ leaf = "fadeShadow", 		enabled = true, speed = 5, 	bezier = "easeIn" })
-- hl.animation({ leaf = "fadeGlow", 			enabled = true, speed = 5, 	bezier = "easein" })
hl.animation({ leaf = "fadeDim", 				enabled = true, speed = 10, bezier = "ease" })
hl.animation({ leaf = "fadeLayersIn", 	enabled = true, speed = 5, 	bezier = "main" })
hl.animation({ leaf = "fadeLayersOut",	enabled = true, speed = 5, 	bezier = "easeIn" })
-- hl.animation({ leaf = "fadePopupsIn", 	enabled = true, speed = 10, bezier = "ease" })
-- hl.animation({ leaf = "fadePopupsOut", 	enabled = true, speed = 10, bezier = "ease" })
-- hl.animation({ leaf = "fadeDpms", 			enabled = true, speed = 10, bezier = "ease" })

-- border, shadow, glow
hl.animation({ leaf = "border", enabled = true, speed = 7, bezier = "ease" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 7, bezier = "easeIn" })
-- hl.animation({ leaf = "shadowangle", enabled = true, speed = 7, bezier = "easeIn" })
-- hl.animation({ leaf = "glowangle", enabled = true, speed = 7, bezier = "easeIn" })

-- workspaces
hl.animation({ leaf = "workspacesIn", 					enabled = true, speed = 5, bezier = "workspaceSwap", style = "slide" })
hl.animation({ leaf = "workspacesOut", 				enabled = true, speed = 5, bezier = "workspaceSwap", style = "slidefade" })
hl.animation({ leaf = "specialWorkspaceIn", 	enabled = true, speed = 5, bezier = "workspaceSwap", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", 	enabled = true, speed = 5, bezier = "workspaceSwap", style = "slidefadevert" })

-- todo: others
-- hl.animation({ leaf = "zoomFactor", enabled = true, speed = 5, bezier = "ease", style = "" })
-- hl.animation({ leaf = "monitorAdded", enabled = true, speed = 5, bezier = "ease", style = "" })
