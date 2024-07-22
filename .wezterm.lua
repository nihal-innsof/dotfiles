local wezterm = require 'wezterm';

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "TITLE | RESIZE"

return config
