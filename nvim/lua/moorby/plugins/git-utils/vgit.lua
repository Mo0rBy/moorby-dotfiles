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
    keymap.set("n", "gk", function() vgit.hunk_up() end, {desc = "Move to next hunk above the cursor"})
    keymap.set("n", "gj", function() vgit.hunk_down() end, {desc = "Move to next hunk below the cursor"})
    keymap.set("n", "gs", function() vgit.buffer_hunk_stage() end, {desc = "Stage hunk"})
    keymap.set("n", "gr", function() vgit.buffer_hunk_reset() end, {desc = "Reset hunk"})
    keymap.set("n", "gp", function() vgit.buffer_hunk_preview() end, {desc = "Preview hunk"})
    keymap.set("n", "gb", function() vgit.buffer_blame_preview() end, {desc = "Buffer blame preview"})
    keymap.set("n", "gf", function() vgit.buffer_diff_preview() end, {desc = "Buffer diff preview"})
    keymap.set("n", "gh", function() vgit.buffer_history_preview() end, {desc = "Buffer history preview"})
    keymap.set("n", "gu", function() vgit.buffer_reset() end, {desc = "Buffer reset"})
    keymap.set("n", "gd", function() vgit.project_diff_preview() end, {desc = "Project diff preview"})
  end,
}
