return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter").install("all") -- ensures that all language parsers are installed

    require("nvim-ts-autotag").setup() -- no longer configured via nvim-treesitter.configs

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        if args.match == "helm" then
          return -- helm TS highlight query is broken; vim-helm provides syntax instead
        end

        pcall(vim.treesitter.start)
      end,
    })
  end
}
