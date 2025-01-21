local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab)
	local cwd = tab.active_pane.current_working_dir
	local last_folder = cwd.path:match("^.+[/](.+)$")
	local formatted_title = last_folder .. " "
	if tab.is_active then
		return {
			{ Background = { Color = "green" } },
			{ Text = " 🛸 " .. formatted_title },
		}
	end
	return " 🚡 " .. formatted_title
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
}
