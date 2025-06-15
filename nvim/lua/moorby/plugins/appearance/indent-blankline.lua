return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { link = "RainbowDelimiterRed" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { link = "RainbowDelimiterYellow" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { link = "RainbowDelimiterBlue" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { link = "RainbowDelimiterOrange" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { link = "RainbowDelimiterGreen" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { link = "RainbowDelimiterViolet" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { link = "RainbowDelimiterCyan" })
    end)
    vim.g.rainbow_delimiters = { highlight = highlight }

    local opts = require("indent-rainbowline").make_opts({}, {
      color_transparency = 0.15,
    })
    opts.scope = {
      highlight = highlight
    }

    require("ibl").setup(opts)

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}
