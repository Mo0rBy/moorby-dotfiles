return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter_configs = require("nvim-treesitter.configs")

    treesitter_configs.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true }, -- uses dependency "windwp/nvim-ts-autotag"
      ensure_installed = "all" -- ensures that all language parsers are installed
    })
  end
}
