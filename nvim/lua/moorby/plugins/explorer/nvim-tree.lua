return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle", "NvimTreeCollapse", "NvimTreeRefresh", "NvimTreeFocus", "NvimTreeOpen" },
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    -- disables the default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- configure nvim-tree
    nvimtree.setup({
      hijack_cursor = true,
      view = {
        width = {},
        number = true,
        relativenumber = true,
        cursorline = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_git = true,
        icons = {
        git_placement = "after",
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            }
          }
        }
      },
      filters = {
          dotfiles = false, -- show dotfiles
          git_ignored = false -- show files ignored by git
      },
      git = {
        enable = true,
      },
      tab = {
        sync = { -- sync open and closing nvim-tree across tabs
          open = true,
          close = true,
        }
      }
    })
  end,
}
