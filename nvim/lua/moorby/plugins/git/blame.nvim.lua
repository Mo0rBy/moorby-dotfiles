return {
  "FabijanZulj/blame.nvim",
  keys = {
    { "<leader>gfb", ":BlameToggle<CR>", mode = "n", desc = "Toggle git blame (entire file)" }
  },
  config = function()
    require("blame").setup({
      merge_consecutive = true,
      date_format = "%d/%m/%Y %H:%M"
    })
  end
}
