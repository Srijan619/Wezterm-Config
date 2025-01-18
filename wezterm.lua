local wezterm = require("wezterm")

return {

	-- Enable composed key behavior for Left Alt
	send_composed_key_when_left_alt_is_pressed = true,

	-- Enable composed key behavior for Right Alt
	send_composed_key_when_right_alt_is_pressed = true,

	color_scheme = "Afterglow",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",

	-- Keybinding for Command + B to run `go run .`
	keys = {
		{
			key = "b",
			mods = "CTRL",
			action = wezterm.action({
				-- Clear the terminal and run `go run .`
				SendString = "clear\ngo run .\n",
			}),
		},
	},
}
