local source = {}

function source:complete(params, callback)
  local items = {}

  items = {
    { label = "test-one" },
    { label = "test-two" },
  }

  -- `callback` should always be called.
  callback(items)
end

-- Don't forget to register your new source to cmp.
require("cmp").register_source("test-source", source)










local scandir = require("plenary.scandir")

local list = scandir.scan_dir("/Users/mo0rby/ObsidianVaults/second-brain/2_areas", { only_dirs = true })

print(list)


