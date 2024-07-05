return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true }, -- uses dependency "windwp/nvim-ts-autotag"
      ensure_installed = "all" -- ensures that all language parsers are installed
    })

    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    require('ts_context_commentstring').setup {}
  end,
}
