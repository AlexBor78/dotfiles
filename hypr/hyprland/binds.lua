local terminal 		= "kitty"
local tg					= "AyuGram"
local files				= "nautilus"
local browser			= "zen"
-- local vim_arrows	= false;
-- local notepad = "" 

local menu = "caelestia shell drawers toggle launcher"
local clipboard = "cliphist list | rofi -dmenu -p \"Clipboard:\" | cliphist decode | wl-copy"
-- local screenshoot =  "grim -g \"$(slurp & sleep 0.2 && hyprctl --batch 'keyword animations:enabled 0' > /dev/null)\" - | wl-copy; hyprctl --batch 'keyword animations:enabled 1'"
--
local screenshot = "hyprshot -z -m region"
local screenshot_win = "hyprshot -z -m active -m window"
local screenshot_out = "hyprshot -z -m active -m output"

local alt_screenshot = "hyprshot -z -m region"
local alt_screenshot_win = "hyprshot -z -m active -m window"
local alt_screenshot_out = "hyprshot -z -m active -m output"

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", 				action = "special", workspace_name = "z" })
hl.gesture({ fingers = 3, direction = "down", 			action = "special", workspace_name = "tg" })

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + T", 			hl.dsp.exec_cmd(tg))
hl.bind(mainMod .. " + E", 			hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + B", 			hl.dsp.exec_cmd(browser))
-- hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notepad))

hl.bind(mainMod .. " + Tab", 	hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", 		hl.dsp.exec_cmd(clipboard))

hl.bind("Print", 							hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + Print", 							hl.dsp.exec_cmd(screenshot_win))
hl.bind(mainMod .. " + CTRL + Print", 							hl.dsp.exec_cmd(screenshot_out))

hl.bind("ALT + Print", 							hl.dsp.exec_cmd(alt_screenshot))
hl.bind(mainMod .. " + ALT + Print", 							hl.dsp.exec_cmd(alt_screenshot_win))
hl.bind(mainMod .. " + ALT + CTRL + Print", 							hl.dsp.exec_cmd(alt_screenshot_out))

hl.bind(mainMod .. " + Q", 			hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Q", 	hl.dsp.exit())
hl.bind(mainMod .. " + F", 				hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + ALT + F", 		hl.dsp.window.float())
hl.bind(mainMod .. " + P", 	hl.dsp.window.pseudo())
hl.bind(mainMod .. " + ALT + P", 				hl.dsp.window.pin())
hl.bind(mainMod .. " + ALT + C", 	hl.dsp.window.center())

local directions = {
	"left"
,	"right"
,	"up"
,	"down"
}

for i = 1, #directions do
	local direction = directions[i]
	hl.bind(mainMod .. " + " .. direction, 					hl.dsp.focus({direction = direction}))
	hl.bind(mainMod .. " + ALT + " .. direction, 		hl.dsp.window.move({monitor = direction}))
	hl.bind(mainMod .. " + SHIFT + " .. direction, 	hl.dsp.window.swap({direction = direction}))
end

hl.bind(mainMod .. " + CTRL + left", 	hl.dsp.window.resize({relative = true, x = -60,	y = 0}))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({relative = true, x = 60, 	y = 0}))
hl.bind(mainMod .. " + CTRL + up", 		hl.dsp.window.resize({relative = true, x = 0,  	y = -60}))
hl.bind(mainMod .. " + CTRL + down", 	hl.dsp.window.resize({relative = true, x = 0,  	y = 60}))

local custom_workspaces = {
	Z = { full = "special:z", name = "z" }
,	X = { full = "special:x", name = "x" }
,	C = { full = "special:c", name = "c" }
,	T = { full = "special:tg", name = "tg" }
,	S = { full = "special:scratchpad", name = "scratchpad" }
}

local function basic_add_workspace(key, name)
	hl.bind(mainMod .. " + SHIFT + " .. key, 				hl.dsp.window.move({workspace = name}))
	hl.bind(mainMod .. " + SHIFT + ALT + " .. key, 	hl.dsp.window.move({workspace = name, follow = false}))
end

for key, value in pairs(custom_workspaces) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.workspace.toggle_special(value.name))
	basic_add_workspace(key, value.full)
end

for i = 0, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({workspace = i}))
	basic_add_workspace(i, i)
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", 	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", 	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", 					hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", 			hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", 		hl.dsp.exec_cmd("brightnessctl s 5%+"))
hl.bind("XF86MonBrightnessDown", 	hl.dsp.exec_cmd("brightnessctl s 5%-"))

-- Requires playerctl
hl.bind("XF86AudioNext", 	hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause",	hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", 	hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", 	hl.dsp.exec_cmd("playerctl previous"))

