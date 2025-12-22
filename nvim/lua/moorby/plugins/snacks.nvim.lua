return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 900,
  opts = {
    dashboard = require("moorby.plugins.snacks.dashboard-config"),
    input = {
      enabled = true
    },
    lazygit = {
      enabled = true,
      win = {
        width = 0,
        height = 0
      }
    },
    picker = require("moorby.plugins.snacks.picker-config"),
    statuscolumn = {
      enabled = true
    }
  },
  keys = {
    -- picker keys
    -- find things
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find all files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find in currently open buffers" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Find all keymaps" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep search all files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find recent files" },
    -- lsp
    { "<leader>D", function() Snacks.picker.diagnostics() end, desc = "Find LSP diagnostics" },
    { "<leader>lR", function() Snacks.picker.lsp_references() end, desc = "Find LSP references" },
    { "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "Find LSP definitions" },
    { "<leader>li", function() Snacks.picker.lsp_implementations() end, desc = "Find LSP implementations" },
    { "<leader>lt", function() Snacks.picker.lsp_type_definitions() end, desc = "Find LSP type definition" },
    -- lazygit
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Open Lazygit" },
    -- git
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git log (for current line)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git log (for current file)" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff (Hunks)" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
  }
}
