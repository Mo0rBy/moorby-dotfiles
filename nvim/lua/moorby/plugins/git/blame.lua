return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  config = function()
    -- Setup plugin
    require("blame").setup({
      merge_consecutive = true,
      date_format = "%d/%m/%Y %H:%M"
    })

    -- Setup keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>gfb", ":BlameToggle<CR>", {desc = "Toggle git blame (entire file)"})
  end
}
