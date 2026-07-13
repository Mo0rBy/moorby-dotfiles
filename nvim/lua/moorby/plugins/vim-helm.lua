return {
  -- Helm chart syntax highlighting (the helm pack that vim-polyglot used to
  -- bundle). Loaded only for helm buffers, so it stays off the startup path.
  -- Filetype detection itself is handled by Neovim's built-in ftdetect; this
  -- provides the vimscript syntax since the treesitter helm parser's highlight
  -- query is currently broken (disabled in nvim-treesitter.lua).
  "towolf/vim-helm",
  ft = "helm",
}
