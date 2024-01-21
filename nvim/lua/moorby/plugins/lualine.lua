return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup{
      options = {
        theme = "tokyonight-night",
        globalstatus = true
      },
    }
  end
}
