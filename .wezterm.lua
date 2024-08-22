local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

-- start default terminal WSL Ubuntu
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- hide titlebar
config.window_decorations = "RESIZE"

-- default size
initial_rows = 24

-- config
-- font
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 10

-- color scheme
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.9

config.enable_scroll_bar = true
config.scrollback_lines = 30000

config.enable_kitty_graphics = true
config.colors = {
}

-- config key bindings
config.keys = {
  { key = "1", mods = "CTRL", action = wezterm.action({ ActivateTab = 0 }) },
  { key = "2", mods = "CTRL", action = wezterm.action({ ActivateTab = 1 }) },
  { key = "3", mods = "CTRL", action = wezterm.action({ ActivateTab = 2 }) },
  { key = "4", mods = "CTRL", action = wezterm.action({ ActivateTab = 3 }) },
  { key = "5", mods = "CTRL", action = wezterm.action({ ActivateTab = 4 }) },
  { key = "6", mods = "CTRL", action = wezterm.action({ ActivateTab = 5 }) },
  { key = "7", mods = "CTRL", action = wezterm.action({ ActivateTab = 6 }) },
  { key = "8", mods = "CTRL", action = wezterm.action({ ActivateTab = 7 }) },
  { key = "9", mods = "CTRL", action = wezterm.action({ ActivateTab = 8 }) },

  { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom('Clipboard') },
}

-- change config now
config.default_domain = 'WSL:Ubuntu-22.04'

-- startup gui size and position
wezterm.on('gui-startup', function(cmd)
  local screen = wezterm.gui.screens().main
	local ratio = 0.8
	local width = screen.width * ratio
  local height = screen.height * ratio

  local tab, pane, window = mux.spawn_window(cmd or {})

  -- default window width, height
  window:gui_window():set_inner_size(width, height)
  
  -- default position on center
  local center_x = (screen.width - width) / 2
  local center_y = (screen.height - height) / 2
  window:gui_window():set_position(center_x, center_y)
end)

return config
