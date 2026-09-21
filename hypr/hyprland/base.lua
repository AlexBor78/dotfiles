-- env
local env = {
	XCURSOR_THEME = "Bibata-Modern-Classic"
, XCURSOR_SIZE = "24"
, HYPRCURSOR_SIZE = "24"

, CLUTTER_BACKEND = "wayland"
, SDL_VIDEODRIVER = "wayland"
, MOZ_ENABLE_WAYLAND = "1"

, QT_QPA_PLATFORM = "wayland"
, GDK_BACKEND = "wayland"
, QT_AUTO_SCREEN_SCALE_FACTOR = "1"
, QT_SCALE_FACTOR = "1"
, GDK_SCALE = "1"
, GDK_DPI_SCALE = "1"
}

for key, value in pairs(env) do
	hl.env(key, value)
end

-- launch on Hyprland start
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("wl-paste --watch cliphist store &")
	-- hl.exec_cmd("caelestia-shell -d")
	-- hl.exec_cmd("mako")
	-- hl.exec_cmd("awww-daemon ")
	-- hl.exec_cmd("awww img ~/dotfiles/assets/wallpaper.png --transition-type bottom") -- todo: launch for every monitor
end)

-- inputs
hl.config({
	input = {
	 	kb_layout 	= "us,ru"
	,	kb_variant 	= ""
	,	kb_options 	= "grp:win_space_toggle"
	,	kb_model 		= ""
	,	kb_rules 		= ""

	,	follow_mouse = 1
	,	sensitivity = 0

	,	touchpad = {
			natural_scroll = true
		}
	}
})
