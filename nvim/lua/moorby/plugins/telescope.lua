return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
          }
        },
        pickers = {
          find_files = {
            previewer = true,
            hidden = true,
          },
          oldfiles = {
            previewer = true,
          },
          live_grep = {
            previewer = true,
          },
          find_buffers = {
            previewer = true,
          }
        }
      }
    })

    -- Setup keymaps
    local keymap = vim.keymap
    local builtin = require('telescope.builtin')

    keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files with Telescope"})
    keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "Find recently opened files with Telescope"})
    keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Grep in all files with Telescope + Ripgrep"})
    keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find in all opened buffers"})
    keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help tags"})
    keymap.set('n', '<leader>fk', builtin.keymaps, {desc = "Find keymaps with Telescope"})
  end
}
