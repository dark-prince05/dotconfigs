-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 14
config.line_height = 1.3

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.default_cursor_style = "SteadyBar" -- or "SteadyBlock", "BlinkingUnderline"

config.window_background_opacity = 0.6
config.macos_window_background_blur = 10

config.enable_wayland = true

-- config.color_scheme = "Gruvbox Dark"
-- coolnight colorscheme:
config.colors = {
	foreground = "#CBE0F0",
	background = "#000000",
	cursor_bg = "#47FF9C",
	cursor_border = "#47ff9c",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#cBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0000ee", "#a277ff", "#24EAF7", "#eeddff" },
	brights = { "#3a61f0", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- and finally, return the configuration to wezterm
return config
