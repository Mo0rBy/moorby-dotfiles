return {
  "dstein64/vim-startuptime",
  cmd = "StartupTime",
  -- Averages multiple startups and shows a per-file/per-event breakdown.
  -- Run :StartupTime to benchmark; :StartupTime --tries 20 for more samples.
  init = function()
    vim.g.startuptime_tries = 10
  end,
}
