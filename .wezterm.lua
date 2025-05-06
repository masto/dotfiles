local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font "MesloLGS Nerd Font Mono"
config.font_size = 21
config.term = "wezterm"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'

config.color_scheme = 'Horizon Dark (base16)'
config.colors = {
  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = 'grey',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#52ad70',
}

config.keys = {
  { key = '-', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '-', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '_', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '_', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '+', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '+', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '=', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '=', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = '+', mods = 'SHIFT|SUPER', action = wezterm.action.IncreaseFontSize },
}

return config
