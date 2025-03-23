return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      git_services = { -- Used to generate URL's for branch popup action "pull request".
        ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
        ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
        ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
        -- Maybe add Gitea here
      },
      disable_line_numbers = true,
      kind = "split",
    })

    -- Set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>gs", ":Neogit<CR>", {desc =  "Neogit: open default git status window"})
    keymap.set("n", "<leader>gp", ":Neogit pull<CR>", {desc = "Neogit pull command"})
    keymap.set("n", "<leader>gP", ":Neogit push<CR>", {desc = "Neogit push command"})
    keymap.set("n", "<leader>gl", ":Neogit log<CR>", {desc = "Neogit: open git log"})
  end
}
