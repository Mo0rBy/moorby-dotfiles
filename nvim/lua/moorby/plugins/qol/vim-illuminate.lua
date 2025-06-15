return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("illuminate").configure({})
  end
}
