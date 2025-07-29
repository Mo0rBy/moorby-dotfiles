local opt = vim.opt_local

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.wrap = true
opt.linebreak = true

vim.opt_local.conceallevel = 2 -- required for obsidian.nvim plugin to correctly render things

opt.spell = true
