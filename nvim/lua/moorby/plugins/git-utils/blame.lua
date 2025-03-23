-- This git blame plugin provides a nice blame for the entire file (all lines):
-- 1. In a separate window to the side of the file
-- 2. As virtual text within the file

-- For individual lines (or current line) git blames, see the git-signs.lua config
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
