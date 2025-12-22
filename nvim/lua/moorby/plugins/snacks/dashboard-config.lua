return {
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
}
