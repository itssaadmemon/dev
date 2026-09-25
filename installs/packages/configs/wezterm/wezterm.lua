local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.5
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_decorations = "NONE"

config.default_prog = { "tmux" }


wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return config
