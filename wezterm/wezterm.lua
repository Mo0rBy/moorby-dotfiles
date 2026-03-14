local wezterm = require 'wezterm'

-- starts wezterm in MacOS fullscreen mode
-- (need ""native_macos_fullscreen_mode" setting as well)
-- (see "window settings")

return {
  automatically_reload_config = true,

  -- colors
  color_scheme = "Tokyo Night Storm",

  --font
  font = wezterm.font("Cousine Nerd Font Mono"),
  font_size = 20,

  enable_tab_bar = false, -- using tmux as multiplexer instead

  -- window settings
  adjust_window_size_when_changing_font_size = false,
  native_macos_fullscreen_mode = false, -- needed for MacOS fullscreen start

  send_composed_key_when_left_alt_is_pressed = true, -- needed for MacOS to use left option key win key combination/macros

  term = "xterm-256color",
  default_prog = { '/bin/zsh', '-l' },

  enable_wayland = true,

  mouse_bindings = {
    -- Scrolling with the mouse wheel
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'NONE',
      action = wezterm.action.ScrollByLine(-3),
      alt_screen = false,
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'NONE',
      action = wezterm.action.ScrollByLine(3),
      alt_screen = false,
    },
  }
}
