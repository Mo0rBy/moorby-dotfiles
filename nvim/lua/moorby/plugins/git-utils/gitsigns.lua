return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  config = function()
    -- Setup plugin
    require("gitsigns").setup{}

    -- Setup keymaps
    local keymap = vim.keymap

    -- if git blame is left on, it moves LSP notifications further to the right
    keymap.set("n", "<leader>glb", ":Gitsigns toggle_current_line_blame<CR>", {desc = "Toggle git blame (current line)"})
  end
}
