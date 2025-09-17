local wezterm = require("wezterm")
local mux = wezterm.mux

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

local config = {}

config.term = "xterm-256color"

-- start default terminal WSL Ubuntu
-- if wezterm.config_builder then
--   config = wezterm.config_builder()
-- end

-- hide titlebar
config.window_decorations = "RESIZE"

-- config
-- font
config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", weight = "Bold" },
  -- { family = "Fira Code",      weight = "DemiBold" },
  -- { family = "Hack Nerd Font", weight = "DemiBold" },
  { family = "D2Coding",       weight = "DemiBold" },
})

if is_windows then
  config.font_size = 9
else
  config.font_size = 9 * 1.5
end

-- color scheme
config.background = {
  {
    source = {
      File = wezterm.home_dir .. "/.config/wezterm/wallpaper/wallpaper-bg.png",
    },
    opacity = 1,
  },
  {
    source = {
      File = wezterm.home_dir .. "/.config/wezterm/wallpaper/wallpaper-01.png",
    },
    opacity = 0.2,
    horizontal_align = "Center",
  },
}

config.enable_scroll_bar = true
config.scrollback_lines = 30000

config.enable_kitty_graphics = true

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
