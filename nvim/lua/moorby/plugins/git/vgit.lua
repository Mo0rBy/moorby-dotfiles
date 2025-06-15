return {
  'tanvirtin/vgit.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading on 'VimEnter' event is necessary.
  event = 'VimEnter',
  config = function()
    local vgit = require('vgit')
    vgit.setup({
      settings = {
        hls = {
          GitSignsAdd = {
            gui = nil,
            fg = '#b8db87',
            bg = nil,
            sp = nil,
            override = false,
          },
          GitSignsChange = {
            gui = nil,
            fg = '#7ca1f2',
            bg = nil,
            sp = nil,
            override = false,
          },
          GitSignsDelete = {
            gui = nil,
            fg = '#e26a75',
            bg = nil,
            sp = nil,
            override = false,
          },
        },
        scene = {
          diff_preference = 'split', -- unified or split
          keymaps = {
            quit = 'q'
          }
        },
      }
    })

    local keymap = vim.keymap
    keymap.set("n", "gdp", function() vgit.project_diff_preview() end, {desc = "Git diff preview of project"})
    keymap.set("n", "glp", function() vgit.project_logs_preview() end, {desc = "Git logs view of project"})

    keymap.set("n", "gk", function() vgit.hunk_up() end, {desc = "Move to next hunk above the cursor"})
    keymap.set("n", "gj", function() vgit.hunk_down() end, {desc = "Move to next hunk below the cursor"})

    keymap.set("n", "gsh", function() vgit.buffer_hunk_stage() end, {desc = "Stage hunk"})
    keymap.set("n", "grh", function() vgit.buffer_hunk_reset() end, {desc = "Reset hunk"})
    keymap.set("n", "gph", function() vgit.buffer_hunk_preview() end, {desc = "Preview hunk"})

    keymap.set("n", "gbb", function() vgit.buffer_blame_preview() end, {desc = "Buffer blame preview"})
    keymap.set("n", "gdb", function() vgit.buffer_diff_preview() end, {desc = "Buffer diff preview"})
    keymap.set("n", "gbh", function() vgit.buffer_history_preview() end, {desc = "Buffer history preview"})
    keymap.set("n", "gbr", function() vgit.buffer_reset() end, {desc = "Buffer reset"})

    keymap.set("n", "gcb", function() vgit.buffer_conflict_accept_both() end, {desc = "Buffer conflict accept both"})
    keymap.set("n", "gcc", function() vgit.buffer_conflict_accept_current() end, {desc = "Buffer conflict accept current"})
    keymap.set("n", "gci", function() vgit.buffer_conflict_accept_incoming() end, {desc = "Buffer conflict accept incoming"})
  end,
}
