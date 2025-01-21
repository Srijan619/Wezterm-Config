local wezterm = require("wezterm")

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("format-tab-title", function(tab, hover, max_width)
	local edge_background = "#2b2b2b"
	local background = "grey"
	local foreground = "#212121"

	local cwd = tab.active_pane.current_working_dir
	local last_folder = cwd.path:match("^.+[/](.+)$")
	local title = last_folder .. " "

	if tab.is_active then
		background = "#eefc92"
		foreground = "#212121"
		title = " 🛸 " .. title
	else
		title = " 🚡 " .. title
	end

	local edge_foreground = background

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return {

	-- Enable composed key behavior for Left Alt
	send_composed_key_when_left_alt_is_pressed = true,

	-- Enable composed key behavior for Right Alt
	send_composed_key_when_right_alt_is_pressed = true,

	color_scheme = "Afterglow",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",

	-- Keybinding for Command + B to run go run .
	keys = {
		{
			key = "b",
			mods = "CTRL",
			action = wezterm.action({
				-- Clear the terminal and run go run .
				SendString = "clear\ngo run .\n",
			}),
		},
	},

	window_padding = {
		left = 0,
		right = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,

	tab_max_width = 100,
}
