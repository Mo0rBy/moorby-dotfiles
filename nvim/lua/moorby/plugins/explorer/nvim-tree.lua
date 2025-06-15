return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
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

    -- set keymaps (setting them here makes them load with the plugin itself and not before)
    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
