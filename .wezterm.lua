local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}

-- start default terminal WSL Ubuntu
-- if wezterm.config_builder then
--   config = wezterm.config_builder()
-- end

-- hide titlebar
config.window_decorations = "RESIZE"

-- config
-- font
config.font = wezterm.font_with_fallback({
  { family = "Fira Code",      weight = "DemiBold" },
  { family = "Hack Nerd Font", weight = "DemiBold" },
  { family = "D2Coding",       weight = "DemiBold" },
})
config.font_size = 9 * 1.5

-- color scheme
config.background = {
  {
    source = {
      File = wezterm.home_dir .. "/.config/wezterm/wallpaper/wallpaper-bg.png",
    },
    opacity = 1.0,
  },
  {
    source = {
      File = wezterm.home_dir .. "/.config/wezterm/wallpaper/wallpaper-01.png",
    },
    opacity = 0.15,
  },
}

config.enable_scroll_bar = true
config.scrollback_lines = 30000

config.enable_kitty_graphics = true
local act = wezterm.action
config.keys = {
  { key = "1", mods = "CTRL", action = act({ ActivateTab = 0 }) },
  { key = "2", mods = "CTRL", action = act({ ActivateTab = 1 }) },
  { key = "3", mods = "CTRL", action = act({ ActivateTab = 2 }) },
  { key = "4", mods = "CTRL", action = act({ ActivateTab = 3 }) },
  { key = "5", mods = "CTRL", action = act({ ActivateTab = 4 }) },
  { key = "6", mods = "CTRL", action = act({ ActivateTab = 5 }) },
  { key = "7", mods = "CTRL", action = act({ ActivateTab = 6 }) },
  { key = "8", mods = "CTRL", action = act({ ActivateTab = 7 }) },
  { key = "9", mods = "CTRL", action = act({ ActivateTab = 8 }) },
  { key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}

-- change config now
-- config.default_domain = 'powershell'
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "pwsh.exe", "-NoLogo" }
end

-- startup gui size and position
-- wezterm.on('gui-startup', function(cmd)
--   local screen = wezterm.gui.screens().main
-- 	local ratio = 0.8
-- 	local width = screen.width * ratio
--   local height = screen.height * ratio

--   local tab, pane, window = mux.spawn_window(cmd or {})

--   -- default window width, height
--   window:gui_window():set_inner_size(width, height)

--   -- default position on center
--   local center_x = (screen.width - width) / 2
--   local center_y = (screen.height - height) / 2
--   window:gui_window():set_position(center_x, center_y)
-- end)

-- startup gui size maximize
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})

  -- maximize window
  window:gui_window():maximize()
end)

return config
