local serializer = require("__khaosdata-extractor__.common.serializer")

--- Writes `mods` to file
--- @param mods {[string]: string} List of mods
--- @return nil
return function(mods)
  helpers.write_file("khaosdata-extractor/prototypes/mods.lua", "--- @type data.Mods\n" .. serializer.serialize(mods) .. "\n")
end
