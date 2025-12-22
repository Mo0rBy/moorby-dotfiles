return {
  enabled = true,
  layouts = {
    custom_default = {
      -- same as the 'default' layout but adjusted width and height values
      layout = {
        box = "horizontal",
        width = 0.95,
        min_width = 120,
        height = 0.95,
        {
          box = "vertical",
          border = true,
          title = "{title} {live} {flags}",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
        { win = "preview", title = "{preview}", border = true, width = 0.5 },
      }
    }
  },
  layout = {
    preset = function()
      return vim.o.columns >= 120 and "custom_default" or "vertical"
    end,
  },
  matcher = {
    frecency = true,
  },
  formatters = {
    file = {
      truncate = "left"
    }
  }
}
