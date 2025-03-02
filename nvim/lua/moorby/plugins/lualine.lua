return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup{
      theme = "tokyonight",
      sections = {
        lualine_c = {
          "buffers"
        },
      }
    }
  end
}
