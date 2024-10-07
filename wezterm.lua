local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Dracula (Official)"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font = wezterm.font("Fira Code")
config.font_size = 16.0
config.line_height = 1.2

return config
