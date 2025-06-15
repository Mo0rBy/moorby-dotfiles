return {
  "hiphish/rainbow-delimiters.nvim",
  lazy = false,
  submodules = false,
  config = function()
    require("rainbow-delimiters.setup").setup({})
  end,
}
