-- This plugin creates code snapshot images (like CodeSnap in VSCode)
return {
  "michaelrommel/nvim-silicon",
  event = "VeryLazy",
  config = function ()
    require("silicon").setup({
      font = "Cousine Nerd Font Mono",
      theme = "Monokai Extended",
      background = "#94e2d5",
      window_title = function ()
        return vim.fn.fnamemodify(
          vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t"
        )
      end
    })

    -- Set keymaps
    local keymap = vim.keymap

    keymap.set("v", "<leader>cs", ":Silicon<CR>", {desc = "Take a CodeSnapshot using Silicon"})
  end
}
