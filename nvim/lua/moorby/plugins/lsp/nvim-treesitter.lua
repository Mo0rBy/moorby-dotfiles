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

    -- add new filetypes for gotmpl and helm
    vim.filetype.add({
      extension = {
        gotmpl = 'gotmpl',
      },
      pattern = {
        [".*/templates/.*%.tpl"] = "helm",
        [".*/templates/.*%.ya?ml"] = "helm",
        ["helmfile.*%.ya?ml"] = "helm",
      },
    })

    -- install treesitter parsers for gotmpl and helm
    local tressitter_install = require("nvim-treesitter.install")
    tressitter_install.commands.TSInstall['gotmpl']()
    tressitter_install.commands.TSInstall['helm']()
  end,
}
