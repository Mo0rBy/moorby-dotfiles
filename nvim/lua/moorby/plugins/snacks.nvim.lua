return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 900,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
    __  ___      ____       ____       
   /  |/  /___  / __ \_____/ __ )__  __
  / /|_/ / __ \/ / / / ___/ __  / / / /
 / /  / / /_/ / /_/ / /  / /_/ / /_/ / 
/_/  /_/\____/\____/_/  /_____/\__, /  
                          /____/]],
        keys = {
          { icon = "", desc = "New file", key = "e", action = ":ene | startinsert" },
          { icon = "󰈞", desc = "Find file", key = "SPC ff", action = function() Snacks.picker.files() end },
          { icon = "", desc = "Find grep", key = "SPC fg", action = function() Snacks.picker.grep() end },
          { icon = "", desc = "Recent files", key = "SPC fr", action = function() Snacks.picker.recent() end },
          { icon = "", desc = "Quit", key = "q", action = ":qa" }
        }
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    input = {
      enabled = true
    },
    lazygit = {
      enabled = true
    },
    picker = {
      enabled = true,
      frecency = true,
      formatters = {
        file = {
          truncate = "left"
        }
      }
    },
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
  }
}
