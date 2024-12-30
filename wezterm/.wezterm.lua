local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Config

config.automatically_reload_config = true

config.color_scheme = "Alabaster Dark"
config.use_fancy_tab_bar = true
-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.tab_bar_at_bottom = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 9,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
	},
}

config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 10.5
config.line_height = 1.1

-- and finally, return the configuration to wezterm
return config