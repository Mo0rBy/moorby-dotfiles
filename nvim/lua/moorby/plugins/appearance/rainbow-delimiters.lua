return {
  "hiphish/rainbow-delimiters.nvim",
  event = { "BufReadPre", "BufNewFile" },
  submodules = false,
  config = function()
    require("rainbow-delimiters.setup").setup({})
  end,
}
