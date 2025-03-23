return {
  "https://github.com/sindrets/diffview.nvim",
  lazy = false,
  config = function()
    -- Set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>gdv", ":DiffviewOpen<CR>", {desc = "Open git diffview (compared to previous commit)"})
    keymap.set("n", "<leader>gDv", ":DiffviewOpen main <CR>", {desc = "Open git diffview (compared to main branch)"})
  end
}
