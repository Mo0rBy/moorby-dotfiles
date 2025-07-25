-- This particular config lazy loads both mini.icons and nvim-web-devicons.
-- See this for some more context: https://www.reddit.com/r/neovim/comments/1duf3w7/miniicons_general_icon_provider_several/
return   {
  "echasnovski/mini.icons",
  opts = {},
  lazy = true,
  specs = {
    { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
