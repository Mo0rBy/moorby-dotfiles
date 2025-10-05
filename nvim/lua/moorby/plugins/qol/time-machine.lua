return {
  "y3owk1n/time-machine.nvim",
  cmd = {
    "TimeMachineToggle",
    "TimeMachinePurgeBuffer",
    "TimeMachinePurgeAll",
    "TimeMachineLogShow",
    "TimeMachineLogClear",
  },
  keys = {
    {
     "<leader>tt",
     "<cmd>TimeMachineToggle<cr>",
     desc = "[Time Machine] Toggle Tree",
    },
    {
     "<leader>tx",
     "<cmd>TimeMachinePurgeCurrent<cr>",
     desc = "[Time Machine] Purge current",
    },
    {
     "<leader>tX",
     "<cmd>TimeMachinePurgeAll<cr>",
     desc = "[Time Machine] Purge all",
    },
    {
     "<leader>tl",
     "<cmd>TimeMachineLogShow<cr>",
     desc = "[Time Machine] Show log",
    },
  },
  opts = {},
}
